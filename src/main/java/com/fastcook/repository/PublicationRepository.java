package com.fastcook.repository;

import com.fastcook.dao.Publication;
import com.fastcook.dao.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicationRepository extends PagingAndSortingRepository<Publication, Long> {
    List<Publication> findPublicationsByUser(User user);
}
