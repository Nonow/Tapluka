package com.fastcook;

import com.devskiller.jfairy.Fairy;
import com.devskiller.jfairy.producer.person.Person;
import com.fastcook.business.RecipeService;
import com.fastcook.business.UserService;
import com.fastcook.dao.Recipe;
import com.fastcook.dao.User;
import com.fastcook.dto.RecipeDto;
import com.fastcook.dto.SubscriptionDto;
import com.fastcook.repository.RecipeRepository;
import com.fastcook.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

@SpringBootApplication
@Slf4j
public class FastCookApplication extends SpringBootServletInitializer implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(FastCookApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(FastCookApplication.class);
    }

    @Autowired
    private UserService userService;

    @Override
    public void run(String... args) throws Exception {
        dbPopulation();
    }

    private void dbPopulation() {
        Person person = Fairy.create(Locale.FRENCH).person();
        SubscriptionDto subscriptionDto = new SubscriptionDto();
        subscriptionDto.setFirstName(person.getFirstName());
        subscriptionDto.setLastName(person.getLastName());
        subscriptionDto.setCivility(person.getSex().name().replace("FEMALE", "FEMME").replace("MALE", "HOMME"));
        subscriptionDto.setDateOfBirth(Date.from(person.getDateOfBirth().atStartOfDay(ZoneId.systemDefault()).toInstant()));
        subscriptionDto.setPhone(person.getTelephoneNumber());
        subscriptionDto.setMail("admin@fastcook.com");
        subscriptionDto.setUsername("admin");
        subscriptionDto.setPassword("password");
        subscriptionDto.setConfirmPassword("password");
        userService.subscription(subscriptionDto);
//        User user = userRepository.findUserByEmail("admin@fastcook.com");
//        long count = recipeRepository.count();
//        RecipeDto recipeDto = new RecipeDto();
//        recipeDto.setTitle3("1");
//        recipeDto.setDescription3("1");
//        recipeDto.setCategory("SALADE");
//        recipeDto.setNumberOfParts(1);
//        recipeService.saveRecipe(recipeDto, user);
//        List<Recipe> recipes = recipeRepository.findRecipesByUserAndPublishedTrue(user);
//        count = recipes.size();
//
//        Long deleteRecipeId = recipes.get(recipes.size()-1).getId();
////        boolean b =
//        User user2 = recipeService.deleteRecipe(deleteRecipeId, user);
//        count = recipeRepository.count();
//
//        Long updateRecipeId = recipes.get(recipes.size()-2).getId();
//        recipeDto.setTitle3("22222222");
//        recipeDto.setDescription3("22222222222");
//        recipeService.updateRecipe(recipeDto, updateRecipeId, user);
//        count = recipeRepository.count();
//        log.info("Finish test");
    }
}
