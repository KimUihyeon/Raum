<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>
<%
	//
	//카트 - 위시 이동
	//

	// 1개짜리
	//
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	String Id = request.getParameter("currentLogin");
	String ItemNo = request.getParameter("No");
	String[] TempNo = ItemNo.split(",");
	String FialText= "";
	int No = 0;
	int clearCont= 0 ;

	int test = -1;

	for(int i=0; i<TempNo.length ; i++){
		No = Integer.parseInt(TempNo[i]);


		Query = "SELECT * FROM Raum_Cart ,Raum_Product WHERE Raum_Product.Prd_No = Raum_Cart.Prd_No and Raum_Cart.M_id='"+Id+"' and Raum_Cart.Cart_no ="+No;
		PreparedStatement cousorHelper = con.prepareStatement(Query);
		ResultSet cursor = cousorHelper.executeQuery();

		cursor.last();
		int sessionLength = cursor.getRow();
		test = sessionLength;
		cursor.beforeFirst();


		if(sessionLength==0){		
			continue;
		}
		else{
			Query= "delete from Raum_Cart where Cart_no="+No;
			PreparedStatement InsertCursor = con.prepareStatement(Query);
			InsertCursor.executeUpdate();
			clearCont++;
		}

	}
	if(clearCont==0){
		%>flase
		<%
	}
	else{
		%>true
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