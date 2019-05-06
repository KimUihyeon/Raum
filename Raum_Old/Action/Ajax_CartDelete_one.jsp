<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>

<%
	String Id = request.getParameter("currentLogin");
	String wish_no = request.getParameter("no");

	Query = "delete from Raum_Cart where Cart_no=?";
	PreparedStatement deleteHelper = con.prepareStatement(Query);
	deleteHelper.setString(1,wish_no);
	deleteHelper.executeUpdate();
%>

<jsp:include page="Ajax_CartList.jsp">
	<jsp:param name="currentLogin" value="<%=Id%>" />
</jsp:include>