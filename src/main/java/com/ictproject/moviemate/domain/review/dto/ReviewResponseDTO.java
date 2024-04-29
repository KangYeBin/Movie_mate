package com.ictproject.moviemate.domain.review.dto;

import com.ictproject.moviemate.domain.sympathy.dto.SympathyDto;
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
