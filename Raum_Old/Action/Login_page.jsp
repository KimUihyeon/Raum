<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	// 회원 전용 창
	// 로그인창 , 회원가입창 , 아이디 비번찾기창
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	if(currentLoginID==null){
		%>
			<script>
				alert("회원전용 페이지입니다.");
			</script>
		<%
		response.sendRedirect("10_login.jsp");
	}
	else{
	}

%>
