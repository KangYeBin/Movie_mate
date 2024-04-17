package com.ictproject.moviemate.domain.user.mapper;


import com.ictproject.moviemate.domain.user.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {


	// 회원 가입
	void insertUser(User user);

	// 회원 정보 수정
	void modifyUser(User user);

	// 회원 정보 단일 조회
	User findUser(String email);

	// 회원 탈퇴
	void deleteUser(int userId);

	// 중복 확인
	boolean isDuplicate(String email);

}
