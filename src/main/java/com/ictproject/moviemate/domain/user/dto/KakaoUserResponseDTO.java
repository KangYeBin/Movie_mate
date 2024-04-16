package com.ictproject.moviemate.domain.user.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.time.LocalDateTime;


@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class KakaoUserResponseDTO {

    private long id;

    private Properties properties;

    @JsonProperty("kakao_account")
    private kakaoAccount account;


    @Setter @Getter @ToString
    public static class Properties {

        private String nickname;

        @JsonProperty("profile_image")
        private String profileImage;

    }

    @Setter @Getter @ToString
    public static class kakaoAccount {

        private String email;

    }




}
