package com.ictproject.moviemate.global.common;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
@EqualsAndHashCode
public class Search{

	// 검색 조건, 검색어
	private String type, keyword;

	public Search() {
		this.type = "";
		this.keyword = "";
	}
}