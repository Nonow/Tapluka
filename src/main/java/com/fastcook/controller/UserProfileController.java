package com.fastcook.controller;

import com.fastcook.business.UserService;
import com.fastcook.dao.User;
import com.fastcook.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
public class UserProfileController {

    @Inject
    private UserService userService;

    @PostMapping("updateProfile")
    public String updateProfile(
            HttpSession httpSession,
            @SessionAttribute("user") User user,
            @ModelAttribute("newUser") UserDto userDto) {
        httpSession.setAttribute("user", userService.updateUser(user, userDto));
        return "profile";
    }

}
