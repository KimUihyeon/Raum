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
	String CartNo = request.getParameter("No");
	String CartQty = request.getParameter("Qty");
	int No = Integer.parseInt(CartNo);
	int Qty = Integer.parseInt(CartQty);
	
	Query = "SELECT * FROM Raum_Cart WHERE Cart_no ="+No;
	PreparedStatement sessionHelper = con.prepareStatement(Query);
	ResultSet sessionCursor = sessionHelper.executeQuery();

	
	sessionCursor.last();
	int sessionLength = sessionCursor.getRow();
	sessionCursor.beforeFirst();

	if(sessionLength==0){
		%>
		<%
	}
	else{
		Query= "update Raum_Cart set Cart_qty="+Qty+" where Cart_no="+No;
		PreparedStatement InsertCursor = con.prepareStatement(Query);
		InsertCursor.executeUpdate();
		%>
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