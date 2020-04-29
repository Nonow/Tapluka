package com.fastcook.repository;

import com.fastcook.dao.Preparation;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PreparationRepository extends PagingAndSortingRepository<Preparation, Long> {
}
