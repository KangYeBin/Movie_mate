package com.ictproject.moviemate.domain.wish.mapper;

import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.wish.Wish;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WishMapper {

	// 찜 등록
	void insertWish(Wish wish);

	// 찜 해제
	void deleteWish(Wish wish);

	// 찜한 영화 목록 가져오기
	List<Movie> findWish(int userId);

    boolean checkWish(Wish wish);
}