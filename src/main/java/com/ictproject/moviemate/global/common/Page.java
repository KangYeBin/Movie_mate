package com.ictproject.moviemate.global.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class Page {

	private int pageNo; // 클라이언트가 보낸 페이지 번호
	private int amount; // 한 화면에 보여질 게시물 수

	public Page() {
		this.pageNo = 1;
		this.amount = 5;
	}

	public int getPageStart() {
		return (pageNo - 1) * amount;
	}

}