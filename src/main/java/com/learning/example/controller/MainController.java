package com.learning.example.controller;

import com.learning.example.domain.Message;
import com.learning.example.domain.User;
import com.learning.example.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/login")
    public String login(Map<String,Object> model) {
        return "login";
    }

    @GetMapping("/")
    public String greeting(Map<String,Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Model model,
                       @RequestParam(required = false, defaultValue = "") String filter) {
        Iterable<Message> messages = messageRepo.findAll();

        if(filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }


        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping
    public String add(  @AuthenticationPrincipal User user,
                        @RequestParam String text,
                        @RequestParam String tag,
                        Map<String,Object> model) {


        Message message = new Message(text, tag, user);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages",messages);

        return "main";
    }

}