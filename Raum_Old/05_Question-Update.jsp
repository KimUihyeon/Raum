
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
 
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%


	String name = request.getParameter("name");
	String id =  request.getParameter("id");
	String title = request.getParameter("title");
	String text =  request.getParameter("text");
	String Qtype = request.getParameter("Question");
	String text2 = text.replace("\r\n","<br>");

	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yy-MM-dd-HH:mm:ss");
	String dateEdit = formatter2.format(new java.util.Date());

	Query = "insert into Raum_Question (M_id,Que_title,Que_text,Que_date,Que_type) value(?,?,?,?,?)";
	PreparedStatement cursorHelper = con.prepareStatement(Query);
	cursorHelper.setString(1,id);
	cursorHelper.setString(2,title);
	cursorHelper.setString(3,text2);
	cursorHelper.setString(4,dateEdit);
	cursorHelper.setString(5,Qtype);

	cursorHelper.executeUpdate();

	response.sendRedirect("05_Question-2.jsp");
	%>
<script>
</script>