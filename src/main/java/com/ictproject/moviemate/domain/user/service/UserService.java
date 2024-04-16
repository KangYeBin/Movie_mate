package com.ictproject.moviemate.domain.user.service;

import com.ictproject.moviemate.domain.user.dto.KakaoUserResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.DuplicateFormatFlagsException;
import java.util.Map;

@Service
@Slf4j
public class UserService {

    // 카카오 로그인 처리
    public void kakaoLogin(Map<String, String> params) {

        String accessToken = getKakaoAccessToken(params);
        log.info("access_token: {}", accessToken);

        // 엑세스 토큰으로 사용자 정보 가져오기
        KakaoUserResponseDTO dto = getKakaoUserInfo(accessToken);

        // 받은 회원정보로 회원가입
        String email = dto.getAccount().getEmail();
        log.info("이메일: {}", email);
        //dto.getProperties().getNickname();

        // 회원중복 검사 (이메일)




    }
    public boolean checkDuplicateValue(String email) {
        return
    }


    private KakaoUserResponseDTO getKakaoUserInfo(String accessToken) {

        String requestUri = "https://kapi.kakao.com/v2/user/me";

        // 요청 헤더
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // 요청 보내기
        RestTemplate template = new RestTemplate();
        ResponseEntity<KakaoUserResponseDTO> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(headers),
                KakaoUserResponseDTO.class
        );

        KakaoUserResponseDTO responseJSON = responseEntity.getBody();
        log.info("응답 데이터 결과: {}", responseJSON);

        return responseJSON;
    }



    // 토큰 발급 요청
    private String getKakaoAccessToken(Map<String, String> requestParam) {

        // 요청 URI
        String requestUri = "https://kauth.kakao.com/oauth/token";

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // 요청 바디에 파라미터 세팅
        MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", requestParam.get("appKey"));
        params.add("redirect_uri", requestParam.get("redirect"));
        params.add("code", requestParam.get("code"));

        // 카카오 인증 POST요청 보내기
        RestTemplate template = new RestTemplate();

        // 헤더, 파라미터 하나로 묶기.
        HttpEntity<Object> requestEntity = new HttpEntity<>(params, headers);

        ResponseEntity<Map> responseEntity
                = template.exchange(requestUri, HttpMethod.POST, requestEntity, Map.class);

        // 응답 데이터에서 JSON 추출
        Map<String, Object> responseJSON = (Map<String, Object>) responseEntity.getBody();
        log.info("응답 JSON 데이터: {}", responseJSON);

        // access token 추출
        String accessToken = (String) responseJSON.get("access_token");

        return accessToken;

    }




}
