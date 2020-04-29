package com.fastcook.controller;

import com.fastcook.business.ConversationService;
import com.fastcook.dao.User;
import com.fastcook.dto.DeleteDto;
import com.fastcook.repository.ConversationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class ConversationController {
    @Autowired
    ConversationRepository conversationRepository;

    @Autowired
    ConversationService conversationService;

    @PostMapping("deleteSubject")
    public String deleteSubject(@ModelAttribute("deleteDto") @Validated DeleteDto deleteDto, @SessionAttribute("user") User user, HttpSession httpSession) {
        user = conversationService.deleteConversation(deleteDto.getDeleteId(), user);
        httpSession.setAttribute("user", user);
        return "mesSujets";
    }
}
