<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String pw=request.getParameter("pw");
	String pw2=request.getParameter("pw2");
	String pw_crrnet = "";
	%>
	<script>
		alert(<%=pw%>);
		alert(<%=pw2%>);
	</script>
	<%
	
	if(currentLogin==null){
			response.sendRedirect("error_500.html");
	}
	else{
	
		Query = "select * from Raum_Member where M_id='"+currentLogin+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		ResultSet cursor = QueryHelper.executeQuery();

		while(cursor.next()){
			pw_crrnet = cursor.getString("M_pw");
		}
	
		if(pw_crrnet.equals(pw)){
			response.sendRedirect("11_mypage1-profile-2.jsp");
			Query = "update Raum_Member set M_pw=? where M_id='"+currentLogin+"'";
			PreparedStatement QueryHelper2 = con.prepareStatement(Query);
			QueryHelper2.setString(1,pw2);
			%>
			<script>
				location.replace("11_mypage1-profile-2.jsp?log=1");
			</script>
			<%
//			response.sendRedirect("11_mypage1-profile-2.jsp?log=1");
			QueryHelper2.executeUpdate();
		}
		else{
			%>
			<script>
				location.replace("11_mypage1-profile-2.jsp?log=2");
			</script>
			<%
		}
	}

%>