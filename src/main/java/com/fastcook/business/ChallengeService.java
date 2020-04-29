package com.fastcook.business;

import com.fastcook.dao.Challenge;
import com.fastcook.dao.File;
import com.fastcook.dao.Publication;
import com.fastcook.dao.User;
import com.fastcook.dto.ChallengeDto;
import com.fastcook.repository.ChallengeRepository;
import com.fastcook.repository.FileRepository;
import com.fastcook.repository.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class ChallengeService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ChallengeRepository challengeRepository;
    @Autowired
    private FileRepository fileRepository;
    @Autowired
    private ModelMapper modelMapper;

    public User saveSubjectOfConversation(ChallengeDto challengeDto, User user) {
        User userDao = userRepository.findById(user.getId()).get();
        Challenge challenge = new Challenge();
        challenge.setUser(user);
        challenge.setTitle(challengeDto.getTitle());
        challenge.setDescription(challengeDto.getDescription());
        File file = new File();
        file.setMimeType(challengeDto.getFile().getContentType());
        file.setImageInBase64(Base64.getEncoder().encodeToString(challengeDto.getFile().getBytes()));
        challenge.setFile(fileRepository.save(file));
        userDao.getChallenges().add(challengeRepository.save(challenge));
        return userRepository.save(userDao);
    }

    public User updateChallenge(ChallengeDto challengeDto, Long challengeId, User user) {
        Optional<Challenge> optional = challengeRepository.findById(challengeDto.getUpdateId());
        User userDao = userRepository.findById(user.getId()).get();
        if (optional.isPresent()) {
            Challenge challenge = optional.get();
            challenge.setTitle(challengeDto.getTitle());
            challenge.setDescription(challengeDto.getDescription());
            if (challengeDto.getFile() != null) {
                File file = new File();
                file.setMimeType(challengeDto.getFile().getContentType());
                file.setImageInBase64(Base64.getEncoder().encodeToString(challengeDto.getFile().getBytes()));
                challenge.setFile(fileRepository.save(file));
            }
            challengeRepository.save(challenge);
            return userRepository.findById(user.getId()).get();
        }
        return null;
    }

    public User deleteChallenge(Long challengeId, User user) {
        challengeRepository.deleteById(challengeId);
        User userDao = userRepository.findById(user.getId()).get();
        userDao.getChallenges().removeIf(c -> (c.getId() == challengeId));
        return userRepository.save(userDao);
    }

    public List<Challenge> getChallengesByUser(User user) {
        return challengeRepository.findChallengesByUser(user);
    }

    public List<Challenge> getNewChallenges() {
        Pageable pageable = PageRequest.of(0, 6,
                Sort.by("createdDate").descending());
        return challengeRepository.findAll(pageable).toList();
    }

    private ChallengeDto convertToChallengeDto(Challenge challenge) {
        return modelMapper.map(challenge, ChallengeDto.class);
    }

}
