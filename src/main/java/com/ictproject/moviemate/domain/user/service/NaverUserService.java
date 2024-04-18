package com.ictproject.moviemate.domain.user.service;

import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.user.dto.NaverDeleteResponseDTO;
import com.ictproject.moviemate.domain.user.dto.NaverUserResponseDTO;
import com.ictproject.moviemate.domain.user.dto.SignUpUserRequestDTO;
import com.ictproject.moviemate.domain.user.mapper.UserMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;


@Service
@Slf4j
@RequiredArgsConstructor
public class NaverUserService {

    private final UserMapper userMapper;


    //// 네이버 로그인 처리 ////

    @Value("${naver.client}")
    private String naver_client;
    @Value("${naver.secret}")
    private String naver_secret;



    public void naverLogin(String code, String state, HttpSession session) {

        String naverAccessToken = getNaverAccessToken(code, state);
        session.setAttribute("access_token", naverAccessToken);
        log.info("access_token : {}", naverAccessToken);

        // 토큰을 통해 사용자 정보 가져오기
        NaverUserResponseDTO dto = getNaverUserInfo(naverAccessToken);

        log.info("email : {}", dto.getResponse().getEmail());
        log.info("nickname : {}", dto.getResponse().getNickname());
        log.info("profile_image : {}", dto.getResponse().getProfile_image());

        if (!checkDuplicateValue(dto.getResponse().getEmail())) {
            join(SignUpUserRequestDTO.builder()
                            .email(dto.getResponse().getEmail())
                            .nickname(dto.getResponse().getNickname())
                            .profileImage(dto.getResponse().getProfile_image())
                            .build()
                    , User.LoginPath.NAVER);

        }

        maintainLoginState(session, dto.getResponse().getEmail());
    }

    // 접근 토큰 발급 요청
    private String getNaverAccessToken(String code, String state) {

        String requestUri = "https://nid.naver.com/oauth2.0/token";

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("client_id", naver_client);
        params.add("client_secret", naver_secret);
        params.add("grant_type", "authorization_code");
        params.add("state", state);
        params.add("code", code);

        RestTemplate template = new RestTemplate();

        HttpEntity<Object> requestEntity = new HttpEntity<>(params, httpHeaders);

        ResponseEntity<Map> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                requestEntity,
                Map.class
        );

        Map<String, Object> responseJSON = (Map<String, Object>) responseEntity.getBody();
        log.info("응답 JSON 데이터: {}", responseJSON);

        // access token 추출 (로그인 중인 사용자의 정보를 요청할 때 필요한 토큰)
        String accessToken = (String) responseJSON.get("access_token");

        return accessToken;

    }

    // 사용자 정보 가져오기
    private NaverUserResponseDTO getNaverUserInfo(String naverAccessToken) {

        String requestUri = "https://openapi.naver.com/v1/nid/me";

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Authorization", "Bearer " + naverAccessToken);
        httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        RestTemplate template = new RestTemplate();

        ResponseEntity<NaverUserResponseDTO> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(httpHeaders),
                NaverUserResponseDTO.class
        );

        NaverUserResponseDTO responseJSON = responseEntity.getBody();
        log.info("응답 데이터 결과 : {}", responseJSON);

        return responseJSON;
    }


    // 네이버 로그아웃
    public void naverLogout(HttpSession session) {
        log.info("access_token : {}", session.getAttribute("access_token"));
        NaverDeleteResponseDTO dto = deleteNaverUser((String) session.getAttribute("access_token"));

        session.removeAttribute("login");
        session.invalidate();
    }


    // 네이버 회원 탈퇴
    public void deleteNaverUser(HttpSession session) {

        log.info("access_token : {}", session.getAttribute("access_token"));
        NaverDeleteResponseDTO dto = deleteNaverUser((String) session.getAttribute("access_token"));

        if (dto.getResult().equals("success")) {
            User loginUser = (User) session.getAttribute("login");
            session.removeAttribute("login");
            session.invalidate();
            userMapper.deleteUser(loginUser.getUserId());
        }
    }


    public NaverDeleteResponseDTO deleteNaverUser(String naverAccessToken) {
        String requestUri = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
        requestUri += "client_id=" + naver_client;
        requestUri += "&client_secret=" + naver_secret;
        requestUri += "&access_token=" + naverAccessToken;
        requestUri += "&service_provider=NAVER";

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Authorization", "Bearer " + naverAccessToken);
        httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        RestTemplate template = new RestTemplate();

        ResponseEntity<NaverDeleteResponseDTO> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(httpHeaders),
                NaverDeleteResponseDTO.class
        );

        NaverDeleteResponseDTO responseJSON = responseEntity.getBody();
        log.info("응답 데이터 결과 : {}", responseJSON);

        return responseJSON;
    }

    public boolean checkDuplicateValue(String email) {
        return userMapper.isDuplicate(email);
    }


    public void join(SignUpUserRequestDTO dto, User.LoginPath loginPath) {

        User user = User.builder()
                .profile(dto.getProfileImage())
                .email(dto.getEmail())
                .nickName(dto.getNickname())
                .loginPath(loginPath)
                .build();

        userMapper.insertUser(user);
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
