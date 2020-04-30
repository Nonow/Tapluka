package com.fastcook.controller;

import com.fastcook.business.ChallengeService;
import com.fastcook.business.ConversationService;
import com.fastcook.business.PublicationService;
import com.fastcook.business.RecipeService;
import com.fastcook.dao.Conversation;
import com.fastcook.dao.Publication;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.dto.*;
import com.fastcook.repository.ChallengeRepository;
import com.fastcook.repository.ConversationRepository;
import com.fastcook.repository.PublicationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class ModalController {

    @Inject
    private ChallengeService challengeService;
    @Inject
    private PublicationService publicationService;
    @Inject
    private RecipeService recipeService;
    @Inject
    private ConversationService conversationService;
    @Inject
    private PublicationRepository publicationRepository;
    @Inject
    private ChallengeRepository challengeRepository;
    @Inject
    private ConversationRepository conversationRepository;


    @PostMapping("newChallenge")
    public ModelAndView newChallenge(@ModelAttribute("newChallenge")
                               @Validated ChallengeDto challengeDto,
                               @SessionAttribute("user") User user,
                               HttpSession httpSession) {
        httpSession.setAttribute("user",
                challengeService.saveSubjectOfConversation(challengeDto, user));
        ModelAndView model = new ModelAndView("challenges");
        model.addObject("challenges", challengeRepository.findAll());
        return model;
    }

    @PostMapping("newSubject")
    public ModelAndView newSubject(@ModelAttribute("newSubject")
                             @Validated SubjectOfConversationDto subjectOfConversationDto,
                             @SessionAttribute("user") User user,
                             HttpSession httpSession) {
        httpSession.setAttribute(
                "user",
                conversationService.saveSubjectOfConversation(subjectOfConversationDto, user)
        );
        Iterable<Conversation> subjects = conversationRepository.findAll();
        httpSession.setAttribute("subjects", subjects);
        ModelAndView model = new ModelAndView("subjects");
        model.addObject("", subjects);
        return model;
    }

    @PostMapping("newPublication")
    public ModelAndView newPublication(@ModelAttribute("newPublication")
                                 @Validated PublicationDto publicationDto,
                                 @SessionAttribute("user") User user,
                                 HttpSession httpSession) {
        httpSession.setAttribute("user", publicationService.savePublication(publicationDto, user));
        ModelAndView model = new ModelAndView("home");
        model.addObject("publications", publicationService.getAll(user));
        return model;
    }

    @PostMapping("newComment")
    public ModelAndView newComment(@ModelAttribute("newComment") @Validated CommentDto commentDto,
                                   @SessionAttribute("user") User user,
                                   HttpSession httpSession) {
        publicationService.saveComment(commentDto, commentDto.getPublicationId(), user);
        ModelAndView model = new ModelAndView("home");
        model.addObject("publications", publicationRepository.findAll());
        return model;
    }

    @PostMapping("newRecipe")
    public ModelAndView newRecipe(@ModelAttribute("newRecipe")
                                  @Validated RecipeDto recipeDto,
                                  @SessionAttribute("user") User user,
                                  HttpSession httpSession) {
        httpSession.setAttribute("user", recipeService.saveRecipe(recipeDto, user));
        Iterable<Recipe> l = recipeService.getMyPublishedRecipes2(user);
        ModelAndView model = new ModelAndView("recipes");
        model.addObject("recipes", l);
        return model;
    }


    @PostMapping("editAvis")
    public ModelAndView updatePublication(@ModelAttribute("editAvis") @Validated PublicationDto publicationDto,
                                    @RequestParam("updateId") Long publicationId,
                                    @SessionAttribute User user,
                                    HttpSession httpSession) {
        publicationService.updatePublication(publicationDto, publicationId, user);
        ModelAndView model = new ModelAndView("home");
        model.addObject("publications", publicationService.getAll(user));
        return model;
    }

    @PostMapping("editRecette")
    public String updateRecipe(@ModelAttribute("editRecette") @Validated RecipeDto recipeDto,
                               @RequestParam("updateId") Long recipeId,
                               @SessionAttribute("user") User user,
                               HttpSession httpSession) {
        httpSession.setAttribute("user", recipeService.updateRecipe(recipeDto, recipeId, user));
        return "recipes";
    }

    //TODO:
    @PostMapping("editChallenge")
    public ModelAndView editChallenge(@ModelAttribute("editChallenge")
                                @Validated ChallengeDto challengeDto,
                                @RequestParam("updateId") Long updateId,
                                @SessionAttribute("user") User user,
                                HttpSession httpSession) {
        user = challengeService.updateChallenge(challengeDto, updateId, user);
        httpSession.setAttribute("user", user);
        ModelAndView model = new ModelAndView("mesChallenges");
        model.addObject("myChallenges", user.getChallenges());
        return model;
    }


    @PostMapping("editSujet")
    public ModelAndView editSubject(@ModelAttribute("editSujet")
                              @Validated SubjectOfConversationDto subjectOfConversationDto,
                              @RequestParam("updateId") Long updateId,
                              @SessionAttribute("user") User user,
                              HttpSession httpSession) {
        user = conversationService.updateConversation(subjectOfConversationDto, updateId, user);
        httpSession.setAttribute("user", user);
        ModelAndView model = new ModelAndView("mesSujets");
        model.addObject("mySubjects", user.getConversations());
        return model;
    }

}
