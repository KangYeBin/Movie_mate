package com.ictproject.moviemate.domain.user.service;

<<<<<<< HEAD
public class UserService {

=======

import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.user.mapper.UserMapper;
import jakarta.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.web.client.RestTemplate;


import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    //토큰 받아온후 구글 로그인 정보를 가져와 DB저장
    public void GoogleLogin(Map<String, String> params, HttpSession session) {
        String requestUri = "https://oauth2.googleapis.com/token";
        params.put("grant_type", "authorization_code");
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(requestUri, params, String.class);
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(result);
            String id_token = jsonObject.get("id_token").toString();
            User user = getGoogleUserInfo(id_token);
            if(!userMapper.isExist(user)){
                userMapper.join(user);
            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }


    //토근으로 구글 사용자 정보 가져오기
    private User getGoogleUserInfo(String id_token) {
        String requestUri = "https://oauth2.googleapis.com/tokeninfo";
        Map<String,String> params = new HashMap<>();
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
>>>>>>> 1037d9b (구글 로그인 코드 추가)
}
