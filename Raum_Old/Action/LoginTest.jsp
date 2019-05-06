<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %><%

	String Log = request.getParameter("Log");
	String Massage = "";

	if(Log==null){
	}
	else{
		if(Log=="1"){Massage= "잘못된 비밀번호 입니다.";};
%>
	<script>
		alert(<%=Massage%>);
	</script>

<%

	};

%>