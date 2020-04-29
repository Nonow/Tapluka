package com.fastcook.business;

import com.fastcook.dao.Conversation;
import com.fastcook.dao.File;
import com.fastcook.dao.Publication;
import com.fastcook.dao.User;
import com.fastcook.dto.SubjectOfConversationDto;
import com.fastcook.repository.ConversationRepository;
import com.fastcook.repository.FileRepository;
import com.fastcook.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Base64;
import java.util.List;

@Service
public class ConversationService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    ConversationRepository conversationRepository;

    public User saveSubjectOfConversation(SubjectOfConversationDto subjectOfConversationDto, User user) {
        User userDao = userRepository.findById(user.getId()).get();
        Conversation conversation = new Conversation();
        conversation.setTitle(subjectOfConversationDto.getTitle2());
        conversation.setContent(subjectOfConversationDto.getDescription2());
        File file = new File();
        file.setMimeType(subjectOfConversationDto.getFile2().getContentType());
        file.setImageInBase64(Base64.getEncoder().encodeToString(subjectOfConversationDto.getFile2().getBytes()));
        conversation.setFile(fileRepository.save(file));
        userDao.getConversations().add(conversationRepository.save(conversation));
        return userRepository.save(userDao);
    }

    public List<Conversation> getMySubjectOfConversation2(User user) {
        return conversationRepository.findConversationsByUser(user);
    }

    public List<Conversation> getMySubjectOfConversation(User user) {
        return user.getConversations();
    }

    public User deleteConversation(Long conversationId, User user) {
        //conversationRepository.deleteById(conversationId);
        User userDao = userRepository.findById(user.getId()).get();
        userDao.getConversations().removeIf(c -> (c.getId() == conversationId));
        return userRepository.save(userDao);
    }




}
