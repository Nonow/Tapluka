package com.fastcook.repository;

import com.fastcook.dao.Challenge;
import com.fastcook.dao.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ChallengeRepository extends PagingAndSortingRepository<Challenge, Long> {
    List<Challenge> findChallengesByUser(User user);
    List<Challenge> findByParticipants_Id(Long participants_id);
}
