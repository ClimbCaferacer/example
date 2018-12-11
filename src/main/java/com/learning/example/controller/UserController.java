package com.learning.example.controller;

import com.learning.example.domain.Message;
import com.learning.example.domain.Role;
import com.learning.example.domain.User;
import com.learning.example.repos.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.stream.Collectors;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList(Map<String,Object> model) {
        Iterable<User> users = userRepo.findAll();
        model.put("users", users);
        return "userList";
    }

    @GetMapping("{id}")
    public String userEditFrom(@PathVariable("id") Long id, Map<String,Object> model) {
        User user = userRepo.findById(id);
        model.put("user", user);
        model.put("all_roles", Role.values());

        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam ("username") String username,
            @RequestParam Map<String, String> form,
            @RequestParam("id") Long id) {
        User user = userRepo.findById(id);
        user.setUsername(username);

        Set<String> roles =  Arrays.stream(Role.values())
                .map(Role::getAuthority)
                .collect(Collectors.toSet());



        //LOGGER.log(Level.INFO, "KeySet: " +roles.keySet());
        LOGGER.log(Level.INFO, "form: " +form);
        LOGGER.log(Level.INFO, "form keyset: " +form.keySet());

        for(String key : form.keySet()) {
           if(roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

        return "redirect/user";
    }

}
