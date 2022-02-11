package com.ezenparty.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
// import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
// @WebFilter("/EncodingFilter") -> web.xml에 등록 시킨다.
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 기본 생성자
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy() 소멸자
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 * 실행되는 필터
	 * chain.doFilter(request, response); -> 실행할 프로그램으로 이동시키는 메서드
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 전처리 필터
		System.out.println("한글 엔코딩 필터. (전처리)");
		request.setCharacterEncoding("utf-8");

		// pass the request along the filter chain
		chain.doFilter(request, response); // 실행할 프로그램으로 이동 시키는 메서드
		// 후처리 필터
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
