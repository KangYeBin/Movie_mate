package com.ictproject.moviemate.domain.user.mapper;


import com.ictproject.moviemate.domain.user.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    boolean isExist(User user);

    void join(User user);
}
