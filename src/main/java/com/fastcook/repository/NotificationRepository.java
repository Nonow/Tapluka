package com.fastcook.repository;

import com.fastcook.dao.Notification;
import com.fastcook.dao.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends PagingAndSortingRepository<Notification, Long> {
    List<Notification> findNotificationsByUser(User user);

}
