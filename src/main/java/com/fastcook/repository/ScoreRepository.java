package com.fastcook.repository;

import com.fastcook.dao.Score;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScoreRepository extends PagingAndSortingRepository<Score, Long> {
}
