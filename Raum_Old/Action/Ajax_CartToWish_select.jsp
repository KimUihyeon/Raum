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

	for(int i=0; i<TempNo.length ; i++){
		No = Integer.parseInt(TempNo[i]);

		Query = "SELECT * FROM Raum_Cart ,Raum_Product WHERE Raum_Product.Prd_No = Raum_Cart.Prd_No and Raum_Cart.M_id='"+Id+"' and Raum_Cart.Cart_no ="+No;
		PreparedStatement sessionHelper2 = con.prepareStatement(Query);
		ResultSet sessionCursor2 = sessionHelper2.executeQuery();
		int PrdNo= -1;
		while(sessionCursor2.next()){
			PrdNo= sessionCursor2.getInt("Prd_no");
		}

		Query = "SELECT * FROM Raum_Wish ,Raum_Product WHERE Raum_Product.Prd_No = Raum_Wish.Prd_No and Raum_Wish.M_id='"+Id+"' and Raum_Wish.Prd_no ="+PrdNo;
		PreparedStatement sessionHelper = con.prepareStatement(Query);
		ResultSet sessionCursor = sessionHelper.executeQuery();

		sessionCursor.last();
		int sessionLength = sessionCursor.getRow();
		sessionCursor.beforeFirst();


		if(sessionLength==0){		
			Query= "Insert Into Raum_Wish (M_id,Prd_no) value(?,?)";
			PreparedStatement InsertCursor = con.prepareStatement(Query);
			InsertCursor.setString(1,Id);
			InsertCursor.setInt(2,PrdNo);
			InsertCursor.executeUpdate();
			clearCont++;
			%>
			<%
		}
		else{
			continue;
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