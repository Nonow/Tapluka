package com.fastcook.controller;

import com.fastcook.business.NotificationService;
import com.fastcook.dao.Notification;
import com.fastcook.dao.User;
import com.fastcook.dto.NotificationDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class NotificationController {
    @Inject
    NotificationService notificationService;

    @GetMapping(path = {"/notification"})
    public List<NotificationDto> getNotification() {
        return notificationService.getAllNotification();
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public ModelAndView getData() {
        List<NotificationDto> list = notificationService.getAllNotification();
        ModelAndView model = new ModelAndView("notification");
        model.addObject("lists", list);
        return model;
    }

    private List<String> getList() {

        List<String> list = new ArrayList<String>();
        list.add("List A");
        list.add("List B");
        list.add("List C");
        list.add("List D");
        list.add("List 1");
        list.add("List 2");
        list.add("List 3");
        return list;

    }

}
