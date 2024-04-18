package com.ictproject.moviemate.domain.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/my")
    public String myPage(){

        return "mypage";
    }

}
