package com.ictproject.moviemate.domain.wish.service;

import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.wish.mapper.WishMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WishService {

	private final WishMapper wishMapper;

	public List<MovieResponseDTO> findWish(int userId) {
		return wishMapper.findWish(userId).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
	}

}
