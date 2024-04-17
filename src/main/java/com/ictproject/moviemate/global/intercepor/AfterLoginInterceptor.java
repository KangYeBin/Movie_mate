package com.ictproject.moviemate.global.intercepor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class AfterLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();

		// 로그인한 후에는 로그인 페이지 접속 불가
		if (session.getAttribute("login") != null) {
			response.sendRedirect("/main");
			return false;
		}

		return true;
	}
}
