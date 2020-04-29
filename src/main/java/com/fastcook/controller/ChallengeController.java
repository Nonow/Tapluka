package com.fastcook.controller;

import com.fastcook.business.ChallengeService;
import com.fastcook.dao.User;
import com.fastcook.dto.DeleteDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ChallengeController {
    @Autowired
    ChallengeService challengeService;

    @PostMapping("deleteChallenge")
    public ModelAndView deleteChallenge(@ModelAttribute("deleteDto") @Validated DeleteDto deleteDto, @SessionAttribute("user") User user, HttpSession httpSession) {
        user = challengeService.deleteChallenge(deleteDto.getDeleteId(), user);
        httpSession.setAttribute("user", user);
        ModelAndView model = new ModelAndView("mesChallenges");
        model.addObject("myChallenges", user.getChallenges());
        return model;
    }
}
