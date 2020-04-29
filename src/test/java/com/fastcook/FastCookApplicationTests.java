package com.fastcook;

import com.devskiller.jfairy.Fairy;
import com.devskiller.jfairy.producer.person.Person;
import com.fastcook.business.RecipeService;
import com.fastcook.business.UserService;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.dao.type.Category;
import com.fastcook.dto.RecipeDto;
import com.fastcook.dto.SubscriptionDto;
import com.fastcook.repository.FileRepository;
import com.fastcook.repository.RecipeRepository;
import com.fastcook.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import javax.inject.Inject;

import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@DataJpaTest
class FastCookApplicationTests {

//    @Autowired
//    RecipeRepository recipeRepository;
//    @Autowired
//    UserService userService;
//    @Autowired
//    RecipeService recipeService;
//    @Autowired
//    UserRepository userRepository;
//    @Autowired
//    FileRepository fileRepository;
//
//
//    @Test
//    void contextLoads() {
//        createUser();
//        User user = userRepository.findUserByEmail("admin@fastcook.com");
//        assertThat(user).isNotNull();
//        assertThat(recipeService).isNotNull();
//    }
//
//    @Test
//    void testRecipeRepository() {
//        createUser();
//        User user = userRepository.findUserByEmail("admin@fastcook.com");
//        long count = recipeRepository.count();
//        List<Recipe> recipeList = recipeRepository.findRecipesByUserAndPublishedTrue(user);
//        //create recipe
//        Recipe recipe = createRecipe(user);
//        RecipeDto recipeDto  = createRecipeDto();
//        //save
//        recipeService.saveRecipe(recipeDto, user);
//        recipeService.saveRecipe(recipeDto, user);
//        recipeService.saveRecipe(recipeDto, user);
//        recipeService.saveRecipe(recipeDto, user);
//        //userRepository.save(user);
//        //test
//        assertThat(recipeRepository.count()).isEqualTo(count+4);
//        recipeList = recipeRepository.findRecipesByUserAndPublishedTrue(user);
//        Recipe lastRecipe = recipeList.get(recipeList.size()-1);
//        //update
//        Long createdId = recipeList.get(recipeList.size()-1).getId();
//        recipeDto.setTitle3("updatedTitle");
//        recipeService.updateRecipe(recipeDto, createdId, user);
//        Recipe updatedRecipe = recipeRepository.findById(createdId).get();
//        assertThat(updatedRecipe.getId()).isEqualTo(createdId);
//        assertThat(updatedRecipe.getTitle()).isEqualTo("updatedTitle");
//
//        recipeService.deleteRecipe(createdId, user);
//
//        assertThat(recipeRepository.count()).isEqualTo(count+3);
//
//
//    }
//
//
//    Recipe createRecipe(User user) {
//        Recipe recipe = new Recipe();
//        recipe.setTitle("t");
//        recipe.setCategory(Category.DESSERT);
//        recipe.setDescription("d");
//        recipe.setNumberOfParts(1);
//        recipe.setUser(user);
//        return recipe;
//    }
//
//    RecipeDto createRecipeDto() {
//        RecipeDto recipeDto = new RecipeDto();
//        recipeDto.setTitle3("1");
//        recipeDto.setDescription3("1");
//        recipeDto.setCategory("SALADE");
//        recipeDto.setNumberOfParts(1);
//        return recipeDto;
//    }
//
//    void createUser() {
//        Person person = Fairy.create(Locale.FRENCH).person();
//        SubscriptionDto subscriptionDto = new SubscriptionDto();
//        subscriptionDto.setFirstName(person.getFirstName());
//        subscriptionDto.setLastName(person.getLastName());
//        subscriptionDto.setCivility(person.getSex().name().replace("FEMALE", "FEMME").replace("MALE", "HOMME"));
//        subscriptionDto.setDateOfBirth(Date.from(person.getDateOfBirth().atStartOfDay(ZoneId.systemDefault()).toInstant()));
//        subscriptionDto.setPhone(person.getTelephoneNumber());
//        subscriptionDto.setMail("admin@fastcook.com");
//        subscriptionDto.setUsername("admin");
//        subscriptionDto.setPassword("password");
//        subscriptionDto.setConfirmPassword("password");
//        userService.subscription(subscriptionDto);
//    }
//
//
//
//
//    @TestConfiguration
//    public static class ConfigurationToTest {
//
//        @Bean
//        RecipeService recipeService() {
//            return new RecipeService();
//        }
//
//        @Bean
//        UserService userService() {
//            return new UserService();
//        }
//
//    }

}
