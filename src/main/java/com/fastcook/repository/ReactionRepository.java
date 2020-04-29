package com.fastcook.repository;

import com.fastcook.dao.Reaction;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReactionRepository extends PagingAndSortingRepository<Reaction, Long> {
}
