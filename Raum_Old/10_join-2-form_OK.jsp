<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String tel_1=request.getParameter("tel_1");
	String tel_2=request.getParameter("tel_2");
	String tel_3=request.getParameter("tel_3");
	String tel = tel_1+"-"+tel_2+"-"+tel_3;
	String add_1=request.getParameter("add_1");
	String add_2=request.getParameter("add_2");
	String add_3=request.getParameter("add_3");
	String mail_1=request.getParameter("Email_1");
	String mail_2=request.getParameter("Email_2");
	String mail = mail_1+"@"+mail_2;

	
	String[] SMSCHK=request.getParameterValues("SMSCHK");
	String[] EmailCHK=request.getParameterValues("EmailCHK");

	
	Query = "insert into Raum_Member (M_id,M_pw,M_name,M_tel,M_address1,M_address2,M_address3,M_tel2) values(?,?,?,?,?,?,?,?)";
	PreparedStatement QueryHelper = con.prepareStatement(Query);

	QueryHelper.setString(1,id);
	QueryHelper.setString(2,pw);
	QueryHelper.setString(3,name);
	QueryHelper.setString(4,mail);
	QueryHelper.setString(5,add_1);
	QueryHelper.setString(6,add_2);
	QueryHelper.setString(7,add_3);
	QueryHelper.setString(8,tel);

	
	QueryHelper.executeUpdate();



	response.sendRedirect("10_join-3-welcom.jsp");
%>


<script>
</script>