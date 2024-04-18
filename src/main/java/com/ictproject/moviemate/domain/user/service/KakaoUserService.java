package com.ictproject.moviemate.domain.user.service;


import com.ictproject.moviemate.domain.user.dto.KakaoUserResponseDTO;
import com.ictproject.moviemate.domain.user.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.user.dto.SignUpUserRequestDTO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class KakaoUserService {

	private final UserMapper userMapper;


	//// 카카오 로그인 처리////
	public void kakaoLogin(Map<String, String> params, HttpSession session) {

		String kakoAccessToken = getKakaoAccessToken(params);
		session.setAttribute("access_token", kakoAccessToken);
		log.info("access_token: {}", kakoAccessToken);

		// 엑세스 토큰으로 사용자 정보 가져오기
		KakaoUserResponseDTO dto = getKakaoUserInfo(kakoAccessToken);

		// 받은 회원정보로 회원가입
		String email = dto.getAccount().getEmail();
		log.info("이메일: {}", email);


		// 회원 중복 검사 (이메일)
		if (!checkDuplicateValue(dto.getAccount().getEmail())) {
			join(SignUpUserRequestDTO.builder()
							.email(dto.getAccount().getEmail())
							.nickname(dto.getProperties().getNickname())
							.profileImage(dto.getProperties().getProfileImage())
							.build()
					, User.LoginPath.KAKAO
			);

		}

		// 세션에 회원 이메일 저장, 로그인 유지 시간 부여
		maintainLoginState(session, dto.getAccount().getEmail());

	}

	private KakaoUserResponseDTO getKakaoUserInfo(String kakoAccessToken) {

		String requestUri = "https://kapi.kakao.com/v2/user/me";

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + kakoAccessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		RestTemplate template = new RestTemplate();
		ResponseEntity<KakaoUserResponseDTO> responseEntity = template.exchange(
				requestUri,
				HttpMethod.POST,
				new HttpEntity<>(headers),
				KakaoUserResponseDTO.class
		);

		KakaoUserResponseDTO responseJSON = responseEntity.getBody();
		log.info("응답데이터: {}", responseJSON);

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
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
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


	// 카카오 로그아웃
	public void kakaoLogout (HttpSession session) {

		String requestUri ="https://kapi.kakao.com/v1/user/logout";

		String accessToken = (String) session.getAttribute("access_token");

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);

		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("target_id_type", "user_id");
		params.add("target_id", session.getId());

		RestTemplate template = new RestTemplate();
		ResponseEntity<Map> responseEntity = template.exchange(
				requestUri,
				HttpMethod.POST,
				new HttpEntity<>(params, headers),
				Map.class
		);

		Map<String, Object> responseJSON = (Map<String, Object>)responseEntity.getBody();
		log.info("응답 데이터: {}", responseJSON); // 로그아웃 하는 사용자 아이디 확인

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



