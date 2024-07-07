package com.ictproject.moviemate.domain.sympathy.mapper;

import com.ictproject.moviemate.domain.sympathy.Sympathy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.ognl.BooleanExpression;

import java.util.List;

@Mapper
public interface SympathyMapper {

    void insertThumb(Sympathy sympathy); // 공감 눌러

    void deleteThumb(Sympathy sympathy); // 공감 취소

    boolean isSympathy(@Param("reviewId") int reviewId, @Param("loginUserId") int loginUserId); // 공감 누른 사용자 가져오기
}
