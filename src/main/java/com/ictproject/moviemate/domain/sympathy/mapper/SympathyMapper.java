package com.ictproject.moviemate.domain.sympathy.mapper;

import com.ictproject.moviemate.domain.movie.Like;
import com.ictproject.moviemate.domain.review.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SympathyMapper {

    void insertThumb(Like sympathy); // 공감 눌러

    void deleteThumb(Like sympathy); // 공감 취소

    List<Review> findSympathy(int reviewId); // 마이페이지 후기에서 공감수?


}
