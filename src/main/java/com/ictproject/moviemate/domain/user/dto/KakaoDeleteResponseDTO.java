package com.ictproject.moviemate.domain.user.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class KakaoDeleteResponseDTO {

    @JsonProperty("id")
    private long id;

}