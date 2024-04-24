package com.ictproject.moviemate.domain.review.dto;

import lombok.*;

import java.util.List;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class ReviewResponseDTO {

	private String movieCd;
	private List<ReviewDetailResponseDTO> dto;

}
