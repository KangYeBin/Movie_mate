package com.ictproject.moviemate.domain.user.controller;

import jakarta.servlet.http.HttpSession;
import com.ictproject.moviemate.domain.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import jakarta.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import java.math.BigInteger;
import java.security.SecureRandom;


import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/movie/sign-in")
    public String signIn() {
        return "logintest";
    }



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

        return "redirect:" + uri;
    }

    //// 카카오 인가코드 받기 ////

    @GetMapping("/auth/kakao")
    public String kakaoInga(String code) {
        log.info("카카오 인가코드: {}", code);


        // 서비스에 넘기기
        Map<String, String> params = new HashMap<>();
        params.put("appKey", kakaoAppKey);
        params.put("redirect", kakaoRedirectUri);
        params.put("code", code);

        userService.kakaoLogin(params);


        // 로그인 후 홈화면으로 보내기
        return "redirect:/";

    }



    //// 네이버 로그인 ////

	@Value("${naver.client}")
	private String naver_client;

	@Value("${naver.secret}")
	private String naver_secret;

    @Value("${naver.redirect-uri}")
    private String redirect_uri;


	@GetMapping("/naver/login")
	public RedirectView naverLogin() {

		RedirectView rv = new RedirectView();
		rv.setUrl("https://nid.naver.com/oauth2.0/authorize?client_id="
                + naver_client
                + "&response_type=code&redirect_uri="
                + redirect_uri
                + "&state="
                + generateState()
        );

        log.info(rv.getUrl());

        return rv;
	}

    public String generateState()
    {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }


    @GetMapping("/auth/naver/callback")
    public String snsNaver(@RequestParam("code") String code, @RequestParam("state") String state, HttpServletRequest request, Model model){

        log.info("code : {}", code);
        log.info("state: {}", state);

        userService.naverLogin(code, state);

		return "redirect:/";
    }


}
