package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encoding = "UTF-8";

	@Override
	public void init(FilterConfig config) throws ServletException {

		System.out.println("CharacterEncodingFilter.init");
		// 필터 초기화 작업
		encoding = config.getInitParameter("encoding");

		if (encoding == null) {
			encoding = "UTF-8";
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("CharacterEncodingFilter.doFilter");

		// 필터 작업.
		request.setCharacterEncoding(encoding);

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("CharacterEncodingFilter.destroy");
		// 필터에서 사용한 자원해제.
	}

}
