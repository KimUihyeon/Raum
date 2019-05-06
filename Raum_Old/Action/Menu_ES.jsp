<%@page contentType="text/html; charset=utf-8"%>
<%
	// 메뉴창
	String currentMenu = (String)session.getAttribute("currentSessionID");
	if(currentMenu==null){
		//비로그인
	}
	else{
		//로그인중
	}

%>
