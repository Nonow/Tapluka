package com.fastcook.business;

import com.fastcook.dao.*;
import com.fastcook.dao.type.ReactionType;
import com.fastcook.dto.*;
import com.fastcook.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class PublicationService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PublicationRepository publicationRepository;
    @Autowired
    private FileRepository fileRepository;
    @Autowired
    private ReactionRepository reactionRepository;
    @Autowired
    private CommentRepository commentRepository;



    public User savePublication(PublicationDto publicationDto, User user) {
        User userDao = userRepository.findById(user.getId()).get();
        Publication publication = new Publication();
        publication.setUser(user);
        publication.setContent(publicationDto.getContent());
        if (publicationDto.getFile() != null) {
            File file = new File();
            file.setMimeType(publicationDto.getFile().getContentType());
            file.setImageInBase64(Base64.getEncoder().encodeToString(publicationDto.getFile().getBytes()));
            publication.setFile(fileRepository.save(file));
        }
        userDao.getPublications().add(publicationRepository.save(publication));
        return userRepository.save(userDao);
    }

    public Boolean saveResponse(ResponseDto responseDto, Long publicationId, User user) {
        Publication publication = publicationRepository.findById(publicationId).get();
        Reaction reaction = new Reaction();
        reaction.setContent(responseDto.getResponse());
        reaction.setUser(user);
        publication.getReactions().add(reactionRepository.save(reaction));
        return null != publicationRepository.save(publication);
    }

    public Boolean saveReaction(ReactionDto reactionDto, Long publicationId, User user) {
        Publication publication = publicationRepository.findById(publicationId).get();
        Reaction reaction = new Reaction();
        reaction.setUser(user);
        reaction.setPublication(publication);
        if (reactionDto.getReactionType() == 0) {
            reaction.setReactionType(ReactionType.LIKE);
            reaction = reactionRepository.save(reaction);
            return null != reaction;
        } else if (reactionDto.getReactionType() == 1) {
            for(Reaction publicationReaction : publication.getReactions()) {
                if (publicationReaction.getUser().getId() == user.getId()) {
                    reactionRepository.delete(publicationReaction);
                    return true;
                }
            }
        }
        //publication.getReactions().add(reactionRepository.save(reaction));

        return false;
    }

    public Boolean saveComment(CommentDto commentDto, Long publicationId, User user) {
        Publication publication = publicationRepository.findById(publicationId).get();
        if (publication != null) {
            Comment comment = new Comment();
            comment.setUser(user);
            comment.getPublications().add(publication);
            comment.setContent(commentDto.getContent());
            Comment savedComment = commentRepository.save(comment);
            return savedComment != null;
        } else {
            return false;
        }
    }

    public Iterable<Publication> getNewPublications() {
        Pageable pageable = PageRequest.of(0, 10,
                Sort.by("createdDate").descending());
        return publicationRepository.findAll(pageable);
    }

    public User updatePublication(PublicationDto publicationDto, Long publicationId, User user) {
        Optional<Publication> optional = publicationRepository.findById(publicationId);
        if (optional.isPresent()) {
            Publication publication = optional.get();
            if (publicationDto.getFile() != null) {
                File file = new File();
                file.setMimeType(publicationDto.getFile().getContentType());
                file.setImageInBase64(Base64.getEncoder().encodeToString(publicationDto.getFile().getBytes()));
                publication.setFile(fileRepository.save(file));
            }
            publication.setContent(publicationDto.getContent());
            publicationRepository.save(publication);
            return userRepository.findById(user.getId()).get();
        } else {
            return null;
        }
    }

    public User deletePublication(Long publicationId, User user) {
        publicationRepository.deleteById(publicationId);
        User userDao = userRepository.findById(user.getId()).get();
        userDao.getPublications().removeIf(p -> (p.getId() == publicationId));
        return userRepository.save(userDao);
    }

    public Iterable<Publication> getAll(User user) {
        Iterable<Publication> publications = publicationRepository.findAll();
        for(Publication publication : publications) {
            for(Reaction reaction : publication.getReactions()) {
                if(reaction.getUser().getId() == user.getId()) {
                    publication.setReactionType(1);
                    break;
                }
            }
        }
        return publications;
    }

}

