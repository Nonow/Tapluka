package com.fastcook.controller;

import com.fastcook.business.ChallengeService;
import com.fastcook.business.ConversationService;
import com.fastcook.business.RecipeService;
import com.fastcook.dao.Challenge;
import com.fastcook.dao.Conversation;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.repository.ConversationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    RecipeService recipeService;

    @Autowired
    ConversationService conversationService;

    @Autowired
    ChallengeService challengeService;

    @Autowired
    ConversationRepository conversationRepository;

    @GetMapping(path = {"/", "/index"})
    public String index() {
        return "index";
    }

    @GetMapping(path = {"/logout"})
    public String logout() {
        return "index";
    }

    @GetMapping(path = {"/register"})
    public String register() {
        return "register";
    }

    @GetMapping(path = {"/home"})
    public String home() {
        return "home";
    }

    @GetMapping(path = {"/recipes"})
    public ModelAndView getRecipes(
            @SessionAttribute("user") User user,
            HttpSession httpSession) {
        //FIXME: si vous voulez pas faire avec HttpSession
        //et pour "load" les recipes.
        Iterable<Recipe> l = recipeService.getMyPublishedRecipes2(user);
        ModelAndView model = new ModelAndView("recipes");
        model.addObject("recipes", l);
        return model;
    }

    @GetMapping(path = {"/subjects"})
    public ModelAndView subjects(@SessionAttribute("user") User user,
                                 HttpSession httpSession) {
        Iterable<Conversation> l = conversationRepository.findAll();
        ModelAndView model = new ModelAndView("subjects");
        model.addObject("subjects", l);
        return model;
    }

    @GetMapping(path = {"/challenges"})
    public String challenges() {
        return "challenges";
    }

    @GetMapping(path = {"/settings"})
    public String settings() {
        return "settings";
    }

    @GetMapping(path = {"/profile"})
    public String profile() {
        return "profile";
    }

    @GetMapping(path = {"/mesChallenges"})
    public ModelAndView myChallenges(@SessionAttribute("user") User user, HttpSession httpSession) {
        Iterable<Challenge> myChallenges = challengeService.getChallengesByUser(user);
        httpSession.setAttribute("myChallenges", myChallenges);
        ModelAndView model = new ModelAndView("mesChallenges");
        model.addObject("myChallenges");
        return model;
    }

    @GetMapping(path = {"/mesSujets"})
    public ModelAndView myConversation(@SessionAttribute("user") User user,
                                       HttpSession httpSession) {
        Iterable<Conversation> mySubjects = conversationService.getMySubjectOfConversation2(user);
        httpSession.setAttribute("mySubjects", mySubjects);
        ModelAndView model = new ModelAndView("mesSujets");
        model.addObject("mySubjects", mySubjects);
        return model;
    }

}
