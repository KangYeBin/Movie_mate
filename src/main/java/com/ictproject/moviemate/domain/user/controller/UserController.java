package com.ictproject.moviemate.domain.user.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/movie/sign-in")
    public String signIn() {
        return "logintest";
    }


}
