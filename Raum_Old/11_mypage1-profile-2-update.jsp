<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String pw=request.getParameter("pw");
	String pw_crrnet = "";

	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String add1 = request.getParameter("add1");
	String add2 = request.getParameter("add2");
	String add3 = request.getParameter("add3");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");

	String tel = tel1+"-"+tel2+"-"+tel3;
	String mail = mail1+"@"+mail2;
	
	if(currentLogin==null){
			response.sendRedirect("error_500.html");
	}
	else{
	
		Query = "update Raum_Member set M_tel=? , M_tel2=? , M_address1=?, M_address2=?, M_address3=? where M_id='"+currentLogin+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		QueryHelper.setString(1,mail);
		QueryHelper.setString(2,tel);
		QueryHelper.setString(3,add1);
		QueryHelper.setString(4,add2);
		QueryHelper.setString(5,add3);
		QueryHelper.executeUpdate();

		response.sendRedirect("11_mypage1-profile-2.jsp?log=1");
	}

%>