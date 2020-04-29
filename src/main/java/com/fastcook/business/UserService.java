package com.fastcook.business;

import com.fastcook.dao.User;
import com.fastcook.dao.type.Civility;
import com.fastcook.dto.AuthenticationDto;
import com.fastcook.dto.SubscriptionDto;
import com.fastcook.dto.UserDto;
import com.fastcook.repository.FileRepository;
import com.fastcook.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.ZoneId;


@Service
@Slf4j
public class UserService {

    private static final int LOG_ROUNDS = 13;
    private static final String SALT = BCrypt.gensalt(LOG_ROUNDS);
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FileRepository fileRepository;

    private static String generateHashedPassword(String password) {
        return BCrypt.hashpw(password, SALT);
    }

    public Boolean subscription(SubscriptionDto subscriptionDto) {
        if (!subscriptionDto.getPassword().equals(subscriptionDto.getConfirmPassword())) {
            log.error("Password mismatch", subscriptionDto);
            return false;
        }
        User user = new User();
        user.setFirstName(subscriptionDto.getFirstName());
        user.setLastName(subscriptionDto.getLastName());
        user.setUsername(subscriptionDto.getUsername());
        user.setEmail(subscriptionDto.getMail());
        user.setPassword(generateHashedPassword(subscriptionDto.getPassword()));
        user.setDateOfBirth(Instant.ofEpochMilli(subscriptionDto.getDateOfBirth().getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate());
        user.setCivility(Civility.valueOf(subscriptionDto.getCivility().toUpperCase()));
        user.setPhone(subscriptionDto.getPhone());
        return userRepository.save(user) != null;
    }

    public User authenticated(AuthenticationDto authenticationDto) {
        User user = userRepository.findUserByEmail(authenticationDto.getMail());
        if (BCrypt.checkpw(authenticationDto.getPassword(), user.getPassword()))
            return user;
        else
            return null;
    }

    public User updateUser(User user, UserDto userDto) {
        User userDao = userRepository.findById(user.getId()).get();
        userDao.setPhone(userDto.getPhone());
        userDao.setEmail(userDto.getMail());
        userDao.setFirstName(userDto.getFirstName());
        userDao.setLastName(userDto.getLastName());
        userDao.setDateOfBirth(Instant.ofEpochMilli(userDto.getDateOfBirth().getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate());
        userDao.setCivility(Civility.valueOf(userDto.getCivility().toUpperCase()));
        userDao.setUsername(userDto.getUsername());
        return userRepository.save(userDao);
    }

    public Boolean logout(HttpSession session) {
        session.invalidate();
        return true;
    }

    public Boolean deleteMyAccount(User user, HttpSession session) {
        userRepository.delete(user);
        session.invalidate();
        return true;
    }
}
