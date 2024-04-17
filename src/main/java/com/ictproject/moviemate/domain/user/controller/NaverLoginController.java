package com.ictproject.moviemate.domain.user.controller;

import com.ictproject.moviemate.domain.movie.service.MovieService;
import com.ictproject.moviemate.domain.user.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import java.math.BigInteger;
import java.security.SecureRandom;

@Slf4j
@Controller
@RequiredArgsConstructor
public class NaverLoginController {

    private final UserService userService;
    private final MovieService movieService;

    @GetMapping("/movie/sign-in")
    public String signIn(Model model) {
        model.addAttribute("recent", movieService.getRecentData());
        return "login";
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
    public String snsNaver(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session){

        log.info("code : {}", code);
        log.info("state: {}", state);

        userService.naverLogin(code, state, session);

		return "redirect:/movie/main";
    }

	@GetMapping("/naver/logout")
	public String naverLogout(HttpSession session) {

		userService.naverLogout(session);

		return "redirect:/movie/sign-in";
	}


	@GetMapping("/naver/delete")
	public String deleteUser(HttpSession session) {

		userService.deleteNaverUser(session);

		return "redirect:/movie/sign-in";
	}


}
