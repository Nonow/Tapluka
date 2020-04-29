package com.fastcook.controller;

import com.fastcook.business.PublicationService;
import com.fastcook.dao.Publication;
import com.fastcook.dao.User;
import com.fastcook.dto.DeleteDto;
import com.fastcook.dto.PublicationDto;
import com.fastcook.repository.PublicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class PublicationController {
    @Autowired
    PublicationRepository publicationRepository;

    @Autowired
    PublicationService publicationService;

    @PostMapping("deletePublication")
    public String deletePublication(@ModelAttribute("deleteDto") @Validated DeleteDto deleteDto, @SessionAttribute User user, HttpSession httpSession) {
        user = publicationService.deletePublication(deleteDto.getDeleteId(), user);
        httpSession.setAttribute("user", user);
        return "home";
    }
}
