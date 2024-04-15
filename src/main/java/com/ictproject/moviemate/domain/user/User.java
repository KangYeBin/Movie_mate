package com.ictproject.moviemate.domain.user;

/*
	CREATE TABLE user (
		user_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
		profile VARCHAR(100),
		email VARCHAR(100),
		nick_name VARCHAR(100),
		login_path VARCHAR(100)
	);
*/

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

	private int userId;				// 회원 번호
	private String profile;			// 프로필 url
	private String email;			// 이메일
	private String nickName;		// 닉네임
	private LoginPath loginPath;	// 로그인 유형

	public enum LoginPath {
		KAKAO,
		GOOGLE,
		NAVER
	}

}
