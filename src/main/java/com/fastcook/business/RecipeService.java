package com.fastcook.business;

import com.fastcook.dao.File;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.dao.type.Category;
import com.fastcook.dto.RecipeDto;
import com.fastcook.repository.FileRepository;
import com.fastcook.repository.RecipeRepository;
import com.fastcook.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
public class RecipeService {

    @Inject
    private UserRepository userRepository;
    @Inject
    private RecipeRepository recipeRepository;
    @Inject
    private FileRepository fileRepository;

    //get data in session.
    public List<Recipe> getMyPublishedRecipes(User user) {
        return user.getRecipes().stream().filter(r -> r.getPublished()).collect(Collectors.toList());
    }

    //get data in database.
    public List<Recipe> getMyPublishedRecipes2(User user) {
        return recipeRepository.findRecipesByUserAndPublishedTrue(user);
    }

    public User saveRecipe(RecipeDto recipeDto, User user) {
        Recipe recipeDao = new Recipe();
        recipeDao.setUser(user);
        recipeDao.setTitle(recipeDto.getTitle3());
        recipeDao.setCategory(Category.valueOf(recipeDto.getCategory().toUpperCase()));
        recipeDao.setNumberOfParts(recipeDto.getNumberOfParts());
        recipeDao.setDescription(recipeDto.getDescription3());
        recipeDao.setDurationOfPreparationInMinutes(recipeDto.getDurePrep());
        recipeDao.setDurationOfCookingInMinutes(recipeDto.getDureCuis());
        if (recipeDto.getFile3() != null) {
            File file = new File();
            file.setMimeType(recipeDto.getFile3().getContentType());
            file.setImageInBase64(Base64.getEncoder().encodeToString(recipeDto.getFile3().getBytes()));
            recipeDao.setFile(fileRepository.save(file));
        }
        User userDao = userRepository.findById(user.getId()).get();
        userDao.getRecipes().add(recipeRepository.save(recipeDao));
        return userRepository.save(userDao);
    }

    public User updateRecipe(RecipeDto recipeDto, Long recipeId, User user ) {
        Optional<Recipe> optional = recipeRepository.findById(recipeId);
        if (optional.isPresent()) {
            Recipe recipeDao = optional.get();
            recipeDao.setTitle(recipeDto.getTitle3());
            recipeDao.setCategory(Category.valueOf(recipeDto.getCategory().toUpperCase()));
            recipeDao.setDescription(recipeDto.getDescription3());
            if (recipeDto.getFile3() != null) {
                File file = new File();
                file.setMimeType(recipeDto.getFile3().getContentType());
                file.setImageInBase64(Base64.getEncoder().encodeToString(recipeDto.getFile3().getBytes()));
                recipeDao.setFile(fileRepository.save(file));
            }
            recipeDao.setNumberOfParts(recipeDto.getNumberOfParts());
            recipeDao.setDurationOfPreparationInMinutes(recipeDto.getDurePrep());
            recipeDao.setDurationOfCookingInMinutes(recipeDto.getDureCuis());
            recipeRepository.save(recipeDao);
            return userRepository.findById(user.getId()).get();
        } else {
            return null;
        }
    }

    public User deleteRecipe(Long recipeId, User user) {
        recipeRepository.delete(recipeRepository.findById(recipeId).get());
        User userDao = userRepository.findById(user.getId()).get();
        userDao.getRecipes().removeIf(recipe -> (recipe.getId() == recipeId));
        userRepository.save(userDao);
        return userDao;
    }
}
