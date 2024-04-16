package com.ictproject.moviemate.domain.user.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class NaverUserResponseDTO {
/*
	response 예시
		{
		  "resultcode": "00",
		  "message": "success",
		  "response": {
			"email": "openapi@naver.com",
			"nickname": "OpenAPI",
			"profile_image": "https://ssl.pstatic.net/static/pwe/address/nodata_33x33.gif",
			"age": "40-49",
			"gender": "F",
			"id": "32742776",
			"name": "오픈 API",
			"birthday": "10-01"
		  }
		}

*/
	@JsonProperty("response")
	private response response;

	@Getter
	@Setter
	@ToString
	public static class response {

		@JsonProperty("email")
		private String email;

		@JsonProperty("nickname")
		private String nickname;

		@JsonProperty("profile_image")
		private String profile_image;
	}
	
}
