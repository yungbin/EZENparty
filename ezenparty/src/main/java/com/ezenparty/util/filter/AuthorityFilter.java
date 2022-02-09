package com.ezenparty.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ezenparty.member.vo.LoginVO;
import com.ezenparty.util.init.Init;

/**
 * Servlet Filter implementation class AuthorityFilter
 */
//@WebFilter("/AuthorityFilter")
public class AuthorityFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthorityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here 전처리필터
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		// null 이면 로그인을 하지 않았다.
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		// 사용자 권한
		Integer gradeNo = 0;
		if(loginVO != null) gradeNo = loginVO.getGradeNo();
		// 요청 url을 가져와 보자.
		String url = req.getServletPath();
		System.out.println("AuthorityFilter.doFilter().url : " + url);
		
		// Init에서 권한 정보를 꺼내와서 활용해서 처리한다.
		Integer pageGradeNo = Init.authorityMap.get(url);
		
		// pageGradeNo == null -> 모든 사용자가 이용할 수 있는 페이지
		if(pageGradeNo != null) {
			// 로그인을 하지 않았으면 예외가 발생
			if(loginVO == null) throw new ServletException("로그인이 필요한 페이지 입니다.");
			if(gradeNo < pageGradeNo) throw new ServletException("당신은 페이지에 접근할 권한이 없습니다.");
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
