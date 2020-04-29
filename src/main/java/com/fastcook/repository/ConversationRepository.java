package com.fastcook.repository;

import com.fastcook.dao.Challenge;
import com.fastcook.dao.Conversation;
import com.fastcook.dao.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConversationRepository extends PagingAndSortingRepository<Conversation, Long> {
    List<Conversation> findConversationsByUser(User user);
}
