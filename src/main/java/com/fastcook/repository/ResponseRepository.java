package com.fastcook.repository;

import com.fastcook.dao.Response;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponseRepository extends PagingAndSortingRepository<Response, Long> {
}
