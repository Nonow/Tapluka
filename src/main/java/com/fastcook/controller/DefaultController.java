package com.fastcook.controller;

import com.fastcook.dto.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

@ControllerAdvice
public class DefaultController {

    @InitBinder
    public void initLocalDateBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }


    @InitBinder
    public void initIntegerBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Integer.class,
                new CustomNumberEditor(Integer.class, true));
    }

    @InitBinder
    public void initBigDecimalBinder(WebDataBinder binder) {
        binder.registerCustomEditor(BigDecimal.class,
                new CustomNumberEditor(BigDecimal.class, true));
    }

    @ModelAttribute("newAuthentication")
    public AuthenticationDto authenticationDto() {
        return new AuthenticationDto();
    }

    @ModelAttribute("newChallenge")
    public ChallengeDto challengeDto() {
        return new ChallengeDto();
    }

    @ModelAttribute("newRecipe")
    public RecipeDto recipeDto() {
        return new RecipeDto();
    }

    @ModelAttribute("newResponse")
    public ResponseDto responseDto() {
        return new ResponseDto();
    }

    @ModelAttribute("newComment")
    public CommentDto commentDto() {return new CommentDto(); }

    @ModelAttribute("newSubject")
    public SubjectOfConversationDto subjectOfConversationDto() {
        return new SubjectOfConversationDto();
    }

    @ModelAttribute("newSubscription")
    public SubscriptionDto subscriptionDto() {
        return new SubscriptionDto();
    }

    @ModelAttribute("newUser")
    public UserDto userDto() {
        return new UserDto();
    }


    @ModelAttribute("editRecette")
    public RecipeDto editRecipeDto() {return new RecipeDto();}

    @ModelAttribute("editAvis")
    public PublicationDto editPublicationDto() {return new PublicationDto();}

    @ModelAttribute("editChallenge")
    public ChallengeDto editChallengeDto() {return new ChallengeDto();}

    @ModelAttribute("editSujet")
    public SubjectOfConversationDto editSubjectOfConversationDto() {return  new SubjectOfConversationDto();}

    @ModelAttribute("deleteDto")
    public DeleteDto deleteDto() {
        return new DeleteDto();
    }

}
