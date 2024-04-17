package com.ictproject.moviemate.domain.user.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class NaverDeleteResponseDTO {

	@JsonProperty("access_token")
	private String access_token;

	@JsonProperty("result")
	private String result;

}
