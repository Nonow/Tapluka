package com.fastcook.controller;

import com.fastcook.business.UserService;
import com.fastcook.dto.SubscriptionDto;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.inject.Inject;

@Controller
public class SubscriptionController {

    @Inject
    private UserService userService;

    @PostMapping(path = {"/subscribe"})
    public String home(
            @ModelAttribute("newSubscription")
            @Validated SubscriptionDto subscriptionDto,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "register";
        }
        Boolean subscriptionOk = userService.subscription(subscriptionDto);
        if (!subscriptionOk) {
            ObjectError objectError = new ObjectError("newSubscription", "Les mot de passe ne corespondent pas!");
            bindingResult.addError(objectError);
            return "register";
        } else {
            return "index";
        }
    }
}
