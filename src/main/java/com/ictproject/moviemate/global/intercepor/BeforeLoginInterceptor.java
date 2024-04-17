package com.ictproject.moviemate.global.intercepor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class BeforeLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();

		// 로그인을 안 했다면 무조건 로그인 페이지로
		if (session.getAttribute("login") == null) {
			response.sendRedirect("/");
			return false;
		}

		return true;
	}
}
