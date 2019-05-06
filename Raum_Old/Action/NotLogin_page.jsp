<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	//비로그인 전용페이지 
	// 로그인창 , 회원가입창 , 아이디 비번찾기창
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	if(currentLoginID==null){
	}
	else{
		response.sendRedirect("error_500.html");
	}

%>
