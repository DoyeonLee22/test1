package com.pc.emp.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class SevletFilter implements Filter {

	private Set<String> excludedPaths;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 인증이 필요 없는 경로를 담을 Set 초기화
		excludedPaths = new HashSet<>();
		// 인증이 필요 없는 경로 추가
		excludedPaths.add("/login.jsp");
		excludedPaths.add("/login");
		excludedPaths.add("/css/login.css");
		excludedPaths.add("/js/"); // 디렉토리 제외를 위해 startsWith 검사 사용
		excludedPaths.add("/images/"); // 디렉토리 제외를 위해 startsWith 검사 사용
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// 요청에서 경로를 가져옴
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		// 요청된 경로가 제외된 경로 중 하나인지 확인
		boolean isExcluded = excludedPaths.stream()
				.anyMatch(excludedPath -> path.equals(excludedPath) || path.startsWith(excludedPath));

		if (isExcluded) {
			chain.doFilter(request, response); // 요청을 계속 진행하도록 허용
			return;
		}

		// 사용자 속성을 위한 세션 확인
		HttpSession session = httpRequest.getSession(false);
		String user = (session != null) ? (String) session.getAttribute("user") : null;

		if (user != null) {
			chain.doFilter(request, response); // 사용자가 로그인한 경우, 요청 허용
		} else {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp"); // 로그인 페이지로 리디렉션
		}
	}

	@Override
	public void destroy() {
		// 여기에서 자원 정리
	}
}