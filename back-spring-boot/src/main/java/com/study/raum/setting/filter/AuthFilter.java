package com.study.raum.setting.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * AuthFilter
 *
 * @author Kimuihyeon
 * @since 2020.11.07
 */
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Map<String , String > requestParamMap = new HashMap<>();

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Enumeration<String> headerNames = httpServletRequest.getHeaderNames();

        List<String> headers = new ArrayList<>();
        if (headerNames != null) {
            while (headerNames.hasMoreElements()) {
                String headerName = headerNames.nextElement();
                String header = httpServletRequest.getHeader(headerName);
                headers.add(headerName);
            }
        }

        String breakPoint = "";
    }
}
