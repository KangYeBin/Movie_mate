package com.ictproject.moviemate.global.config;

import com.ictproject.moviemate.global.intercepor.AfterLoginInterceptor;
import com.ictproject.moviemate.global.intercepor.BeforeLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

	private final AfterLoginInterceptor afterLoginInterceptor;
	private final BeforeLoginInterceptor beforeLoginInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry
				.addInterceptor(afterLoginInterceptor)
				.addPathPatterns("/");

		registry
				.addInterceptor(beforeLoginInterceptor)
				.addPathPatterns("/*", "/category/*")
				.excludePathPatterns("/");


	}
}
// localhost:8181/ -> 로그인페이지
// localhost:8181/main ->

