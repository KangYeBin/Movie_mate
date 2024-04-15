package com.ictproject.moviemate.domain.user.controller;

import com.ictproject.moviemate.domain.user.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import java.math.BigInteger;
import java.security.SecureRandom;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;

	@Value("${naver.client}")
	private String naver_client;

	@Value("${naver.secret}")
	private String naver_secret;

    @Value("${naver.redirect-uri}")
    private String redirect_uri;

	@GetMapping("/movie/sign-in")
	public String signIn() {
		return "logintest";
	}

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
