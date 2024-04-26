package com.ictproject.moviemate.domain.sympathy.service;

import com.ictproject.moviemate.domain.movie.Like;
import com.ictproject.moviemate.domain.sympathy.mapper.SympathyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SympathyService {

    private final SympathyMapper sympathyMapper;

    // 공감 눌렀을 때
    public void insertThumb(Like like) {
        sympathyMapper.insertThumb(like);
    }

    // 공감 취소 할 때
    public void deleteThumb(Like sympathy) {
        sympathyMapper.deleteThumb(sympathy);
    }

    // 내 후기에 공감 마이페이지에서 볼 때?
  //public List<Review> findSympathy(int reviewId) {
    //    sympathyMapper.findSympathy(reviewId).stream().map()
    //}




}
