package com.ictproject.moviemate.domain.user.controller;


import com.ictproject.moviemate.domain.user.service.KakaoUserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class KakaoLoginController {

    private final KakaoUserService userService;



    //// 카카오 로그인 ////

    @Value("${sns.kakao.app-key}")
    private String kakaoAppKey;

    @Value("${sns.kakao.redirect-uri}")
    private String kakaoRedirectUri;


    @GetMapping("/kakao/login")
    public String kakaoLogin () {

        String uri = "https://kauth.kakao.com/oauth/authorize";
        uri += "?client_id=" + kakaoAppKey;
        uri += "&redirect_uri=" + kakaoRedirectUri;
        uri += "&response_type=code";
        uri += "&prompt=login";

        return "redirect:" + uri;
    }


    // 카카오 인가코드 받기

    @GetMapping("/auth/kakao")
    public String kakaoInga(String code, HttpSession session) {
        log.info("카카오 인가코드: {}", code);


        // 서비스에 넘기기
        Map<String, String> params = new HashMap<>();
        params.put("appKey", kakaoAppKey);
        params.put("redirect", kakaoRedirectUri);
        params.put("code", code);

        userService.kakaoLogin(params, session);


        // 로그인 후 홈화면으로 보내기
        return "redirect:/movie/sign-in";

    }



    // 카카오 로그아웃
    @GetMapping("/kakao/logout")
    public String kakaoLogout(HttpSession session) {

        session.removeAttribute("login");
        session.invalidate();

        return "redirect:/movie/sign-in";
    }






}
