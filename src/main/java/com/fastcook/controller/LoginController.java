package com.fastcook.controller;

import com.fastcook.business.NotificationService;
import com.fastcook.business.UserService;
import com.fastcook.dao.User;
import com.fastcook.dto.AuthenticationDto;
import com.fastcook.repository.ChallengeRepository;
import com.fastcook.repository.PublicationRepository;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Inject
    private UserService userService;
    @Inject
    private PublicationRepository publicationRepository;
    @Inject
    private ChallengeRepository challengeRepository;
    @Inject
    private NotificationService notificationService;

    @PostMapping(path = {"/login"})
    public String home(
            @ModelAttribute("newAuthentication")
            @Validated AuthenticationDto authenticationDto,
            BindingResult bindingResult,
            HttpSession httpSession) {
        if (bindingResult.hasErrors()) {
            return "index";
        }
        User user = userService.authenticated(authenticationDto);
        if (null == user) {
            ObjectError objectError = new ObjectError("newAuthentication", "Combinaison incorrect!");
            bindingResult.addError(objectError);
            return "index";
        } else {
            httpSession.setAttribute("publications", publicationRepository.findAll());
            httpSession.setAttribute("challenges", challengeRepository.findAll());
            httpSession.setAttribute("notifications", notificationService.getAllNotification());
            httpSession.setAttribute("user", user);
            return "home";
        }
    }
}
