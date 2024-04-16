package com.ictproject.moviemate.domain.user.controller;


import com.ictproject.moviemate.domain.user.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class GoogleLoginController {

    private final UserService userService;
    @Value("${google.client.id}")
    private String googleClientId;
    @Value("${google.client.pw}")
    private String googleClientPw;
    @Value("${google.redirect.url}")
    private String redirectUrl;


    //구글 로그인 폼 열기
    @GetMapping("/google/login")
    public String googleLogin() {
        StringBuilder requestUrl = new StringBuilder();
        requestUrl.append("https://accounts.google.com/o/oauth2/v2/auth?client_id=");
        requestUrl.append(googleClientId);
        requestUrl.append("&redirect_uri=");
        requestUrl.append(redirectUrl);
        requestUrl.append("&response_type=code");
        requestUrl.append("&scope=email profile openid");
        requestUrl.append("&prompt=select_account");
        return "redirect:" + requestUrl;
    }

    //구글 로그인 진행
    @GetMapping("/api/v1/google/login")
    public String googleLoginAPI(String code, HttpSession session) {
        Map<String, String> params = new HashMap<>();
        params.put("code", code);
        params.put("client_id", googleClientId);
        params.put("client_secret", googleClientPw);
        params.put("redirect_uri", redirectUrl);
        userService.GoogleLogin(params, session);
        return "";
    }



}
