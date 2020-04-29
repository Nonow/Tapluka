package com.fastcook.repository;

import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecipeRepository extends PagingAndSortingRepository<Recipe, Long> {
    List<Recipe> findRecipesByUserAndPublishedTrue(User user);
}
