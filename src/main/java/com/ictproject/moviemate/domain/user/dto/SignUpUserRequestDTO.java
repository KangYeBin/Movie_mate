package com.ictproject.moviemate.domain.user.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpUserRequestDTO {

	private String nickname;

	private String email;

	private String profileImage;
}
