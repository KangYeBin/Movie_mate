package com.ictproject.moviemate.domain.user.service;

import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.user.mapper.UserMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;


@Service
@Slf4j
@RequiredArgsConstructor
public class GoogleUserService {

    private final UserMapper userMapper;


    //// 구글 로그인 처리 ////

    public void GoogleLogin(Map<String, String> params, HttpSession session) {
        String requestUri = "https://oauth2.googleapis.com/token";
        params.put("grant_type", "authorization_code");
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(requestUri, params, String.class);
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(result);
            String id_token = jsonObject.get("id_token").toString();
            session.setAttribute("id_token", id_token);
            User user = getGoogleUserInfo(id_token);
            if (!userMapper.isDuplicate(user.getEmail())) {
                userMapper.insertUser(user);
            }
            maintainLoginState(session, user.getEmail());

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }


    // 토근으로 구글 사용자 정보 가져오기
    private User getGoogleUserInfo(String id_token) {
        String requestUri = "https://oauth2.googleapis.com/tokeninfo";
        Map<String, String> params = new HashMap<>();
        params.put("id_token", id_token);
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(requestUri, params, String.class);
        JSONParser parser = new JSONParser();
        try {
            JSONObject userinfo = (JSONObject) parser.parse(result);
            return User.builder()
                    .profile(userinfo.get("picture").toString())
                    .email(userinfo.get("email").toString())
                    .nickName(userinfo.get("name").toString())
                    .loginPath(User.LoginPath.GOOGLE)
                    .build();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

    }

    // 구글 로그아웃
    public void googleLogout(HttpSession session) {
        session.removeAttribute("login");
        session.invalidate();
    }


    // 구글 회원 탈퇴
    public void deleteGoogleUser(HttpSession session) {

        log.info("id_token : {}", session.getAttribute("id_token"));

        User loginUser = (User) session.getAttribute("login");
        session.removeAttribute("id_token");
        session.removeAttribute("login");
        session.invalidate();
        userMapper.deleteUser(loginUser.getUserId());

    }



    // 세션으로 로그인 유지
    public void maintainLoginState(HttpSession session, String email) {

        User foundUser = userMapper.findUser(email);

        // 세션에 로그인한 회원 정보를 저장
        session.setAttribute("login", foundUser);
        // 세션 수명 설정
        session.setMaxInactiveInterval(60 * 60); // 1시간

    }

}
