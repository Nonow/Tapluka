package com.fastcook.business;

import com.fastcook.dao.Notification;
import com.fastcook.dao.User;
import com.fastcook.dto.NotificationDto;
import com.fastcook.repository.NotificationRepository;
import com.google.common.collect.Lists;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    @Autowired
    ModelMapper modelMapper;

    public List<NotificationDto> getAllNotification(User user) {
        List<Notification> list = notificationRepository.findNotificationsByUser(user);
        return list.stream().map(this::convertToDto).collect(Collectors.toList());
    }

    public List<NotificationDto> getAllNotification() {
        Iterable<Notification> list = notificationRepository.findAll();
        List<Notification> l = Lists.newArrayList(list);
        return l.stream().map(this::convertToDto).collect(Collectors.toList());
    }

    private NotificationDto convertToDto(Notification notification) {
        NotificationDto dto = modelMapper.map(notification, NotificationDto.class);
        return dto;
    }
}
