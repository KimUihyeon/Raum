<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>

<%
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");

	if(ID == null || PW == null){
		response.sendRedirect("error_500.html");
	}
	else{
		Query = "select * from Raum_Member where M_id='"+ID+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		ResultSet cusor = QueryHelper.executeQuery();

		
		cusor.last();
		int idLength = cusor.getRow();
		cusor.beforeFirst();


		if(idLength==0){
			response.sendRedirect("10_login.jsp?Log=0");
		}
		else{

			while(cusor.next()){
				String toPw=cusor.getString("M_pw");
				if(PW.equals(toPw)){
					session.setAttribute("currentSessionID", ID);
					response.sendRedirect("00_index.jsp?Login=0");	
				}
				else{
					response.sendRedirect("10_login.jsp?Log=1");	
				}
			};
		}


	}

%>

<Html>
	<script>
		alert("<%=ID%>");
		alert("<%=PW%>");
	</script>
</html>