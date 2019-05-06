<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%
	String no = request.getParameter("no");
	String qty = request.getParameter("qty");

	String Name = request.getParameter("Cl_name");
	String add1 = request.getParameter("Cl_add1");
	String add2 = request.getParameter("Cl_add2");
	String add3 = request.getParameter("Cl_add3");
	String tel1 = request.getParameter("Cl_tel1");
	String tel2 = request.getParameter("Cl_tel2");
	String tel3 = request.getParameter("Cl_tel3");
	String Message = request.getParameter("Cl_Message");
	String point = request.getParameter("point");
	String Order_point = request.getParameter("Order_point");
%>
<script>
	alert("<%=no%>");
	alert("<%=qty%>");
	alert("<%=Name%>");
	alert("<%=add1%>");
	alert("<%=add2%>");
	alert("<%=add3%>");
	alert("<%=tel1%>");
	alert("<%=tel2%>");
	alert("<%=tel3%>");
	alert("<%=Message%>");
	alert("<%=point%>");
	alert("<%=Order_point%>");
</script>