<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %><%

		request.setCharacterEncoding("UTF-8");


		String DB_URL="jdbc:mysql://localhost:3306/dkrnl1318";
		String DB_ID="dkrnl1318";
		String DB_PW="a9100231!";

		String Query = "디비1";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
%>
<%!
	public static ResultSet getData(String query){
		
		
		String DBURL="jdbc:mysql://localhost:3306/dkrnl1318";
		String DBID="dkrnl1318";
		String DBPW="a9100231!";

	
		String Query = query;
		
		Connection con = null; 
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection(DBURL, DBID, DBPW);
			PreparedStatement pres = con.prepareStatement(Query);
			return pres.executeQuery();
		}catch(Exception e){
			return null;
		}
		
	}
%>