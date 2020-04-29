package com.fastcook.controller;

import com.fastcook.business.RecipeService;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.dto.DeleteDto;
import com.fastcook.dto.PublicationDto;
import com.fastcook.dto.RecipeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class RecipeController {

    @Autowired
    RecipeService recipeService;

    @PostMapping("deleteRecipe")
    public String deleteRecipe(@ModelAttribute("deleteDto") @Validated DeleteDto deleteDto, @SessionAttribute("user") User user, HttpSession httpSession) {
        user = recipeService.deleteRecipe(deleteDto.getDeleteId(), user);
        httpSession.setAttribute("user", user);
        return "recipes";
    }
}
