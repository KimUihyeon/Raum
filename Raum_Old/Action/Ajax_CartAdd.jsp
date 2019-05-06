<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>
<%
	//
	//위시 디비등록 Ajax
	//

	// 1개짜리
	//
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	String ItemNo = request.getParameter("No");
	int No = Integer.parseInt(ItemNo);
	
	Query = "SELECT * FROM Raum_Cart WHERE M_id='"+currentLoginID+"' and Prd_no ="+ItemNo;
	PreparedStatement sessionHelper = con.prepareStatement(Query);
	ResultSet sessionCursor = sessionHelper.executeQuery();

	
	sessionCursor.last();
	int sessionLength = sessionCursor.getRow();
	sessionCursor.beforeFirst();

	if(sessionLength==0){
		Query= "Insert Into Raum_Cart (M_id,Prd_no) value(?,?)";
		PreparedStatement InsertCursor = con.prepareStatement(Query);
		InsertCursor.setString(1,currentLoginID);
		InsertCursor.setInt(2,No);
		InsertCursor.executeUpdate();
		%>true
		<%
	}
	else{
		%>false
		<%

	}

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