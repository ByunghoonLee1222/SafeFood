package com.ssafy.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("*.do")
public class EncodingFilter implements Filter {

    public EncodingFilter() {
    	
    }

	public void destroy() {
		System.out.println("EncodingFilter destroy....");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		/*
		 * doFilter(request,response)
		 * 연결된 다른 filter나 요청된 servlet으로 이동하는 기능
		 */
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("EncodingFilter init....");
	}

}
