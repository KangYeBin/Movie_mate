package com.ictproject.moviemate.domain.wish.mapper;

import com.ictproject.moviemate.domain.wish.Wish;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishMapper {

	// 찜 등록
	void insertWish(Wish wish);

	// 찜 해제
	void deleteWish(Wish wish);

}