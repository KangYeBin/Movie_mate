package com.ictproject.moviemate.domain.sympathy.service;

import com.ictproject.moviemate.domain.sympathy.Sympathy;
import com.ictproject.moviemate.domain.review.mapper.ReviewMapper;
import com.ictproject.moviemate.domain.sympathy.dto.SympathyDto;
import com.ictproject.moviemate.domain.sympathy.mapper.SympathyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SympathyService {

    private final SympathyMapper sympathyMapper;

    // 공감 눌렀을 때
    public void insertThumb(Sympathy sympathy) {
        sympathyMapper.insertThumb(sympathy);
    }

    // 공감 취소 할 때
    public void deleteThumb(Sympathy sympathy) {
        sympathyMapper.deleteThumb(sympathy);
    }

    // 공감 누른 사용자 가져오기
    public boolean isSympathy(int reviewId, int loginUserId) {
        return sympathyMapper.isSympathy(reviewId, loginUserId);
    }

}
