package com.ictproject.moviemate.domain.user.service;


import com.ictproject.moviemate.domain.user.dto.KakaoUserResponseDTO;
import com.ictproject.moviemate.domain.user.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.user.dto.NaverUserResponseDTO;
import com.ictproject.moviemate.domain.user.dto.SignUpUserRequestDTO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

	private final UserMapper userMapper;



    //// 카카오 로그인 처리////
    public void kakaoLogin(Map<String, String> params) {

        String accessToken = getKakaoAccessToken(params);
        log.info("access_token: {}", accessToken);

        // 엑세스 토큰으로 사용자 정보 가져오기
        KakaoUserResponseDTO dto = getKakaoUserInfo(accessToken);

        // 받은 회원정보로 회원가입
        String email = dto.getAccount().getEmail();
        log.info("이메일: {}", email);


        // 회원 중복 검사 (이메일)
		if(!checkDuplicateValue(dto.getAccount().getEmail())){
			join(SignUpUserRequestDTO.builder()
					.email(dto.getAccount().getEmail())
					.nickname(dto.getProperties().getNickname())
					.profileImage(dto.getProperties().getProfileImage())
					.build()
					,User.LoginPath.KAKAO
			);

		}

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



    // 카카오 토큰 발급 요청
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





	//// 네이버 로그인 처리 ////

	@Value("${naver.client}")
	private String naver_client;

	@Value("${naver.secret}")
	private String naver_secret;


	public void naverLogin(String code, String state) {

		String naverAccessToken = getNaverAccessToken(code, state);
		log.info("access_token : {}", naverAccessToken);

		// 토큰을 통해 사용자 정보 가져오기
		NaverUserResponseDTO dto = getNaverUserInfo(naverAccessToken);

		log.info("email : {}", dto.getResponse().getEmail());
		log.info("nickname : {}", dto.getResponse().getNickname());
		log.info("profile_image : {}", dto.getResponse().getProfile_image());

		if(!checkDuplicateValue(dto.getResponse().getEmail())){
			join(SignUpUserRequestDTO.builder()
							.email(dto.getResponse().getEmail())
							.nickname(dto.getResponse().getNickname())
							.profileImage(dto.getResponse().getProfile_image())
							.build()
					, User.LoginPath.NAVER);

		}

	}

	public boolean checkDuplicateValue(String email) {
		return userMapper.isDuplicate(email);
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

	public void join(SignUpUserRequestDTO dto, User.LoginPath loginPath) {

		User user = User.builder()
				.profile(dto.getProfileImage())
				.email(dto.getEmail())
				.nickName(dto.getNickname())
				.loginPath(loginPath)
				.build();

		userMapper.insertUser(user);
	}


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
			if (!userMapper.isDuplicate(user.getEmail())) {
				userMapper.insertUser(user);
			}

		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}


	//토근으로 구글 사용자 정보 가져오기
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


}



