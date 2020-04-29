package com.fastcook.controller;

import com.fastcook.dao.User;
import com.fastcook.dto.RecipeDto;
import com.fastcook.repository.ReactionRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class ReactionController {
    @Autowired
    ReactionRepository reactionRepository;


}
