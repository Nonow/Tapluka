package com.fastcook.controller;

import com.fastcook.business.PublicationService;
import com.fastcook.dao.User;
import com.fastcook.dto.ReactionDto;
import com.fastcook.dto.RecipeDto;
import com.fastcook.repository.ReactionRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class ReactionController {
    @Autowired
    ReactionRepository reactionRepository;

    @Autowired
    PublicationService publicationService;

    @RequestMapping(value="newReaction", method = RequestMethod.POST)
    public void newReactionToPublication(@RequestParam("pubId") Long publicationId,
                                         @RequestParam("reactionType") Integer reactionType,
                                         @SessionAttribute("user") User user) {
        ReactionDto reactionDto = new ReactionDto();
        reactionDto.setReactionType(reactionType);
        publicationService.saveReaction(reactionDto, publicationId, user);

    }

}
