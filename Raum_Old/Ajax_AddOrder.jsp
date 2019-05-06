<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>


<%
	String TempNo = request.getParameter("no");
	String TempQty = request.getParameter("qty");

	String name = request.getParameter("name");
	String add1 = request.getParameter("add1");
	String add2 = request.getParameter("add2");
	String add3 = request.getParameter("add3");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1+"-"+tel2+"-"+tel3;
	String Message = request.getParameter("ment");
	String point = request.getParameter("point");
	String Order_point = request.getParameter("point2");
	String card = request.getParameter("paymentWay");
	String Price = request.getParameter("Price");
	String id = request.getParameter("id");


	String[] no = TempNo.split(",");
	String[] qty = TempQty.split(",");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd-HH:mm");
	String today = formatter.format(new java.util.Date());
	
	Query = "SELECT * FROM Raum_Order WHERE M_id='"+id+"'";
	PreparedStatement sessionHelper = con.prepareStatement(Query);
	ResultSet sessionCursor = sessionHelper.executeQuery();

	
	sessionCursor.last();
	int sessionLength = sessionCursor.getRow();
	sessionCursor.beforeFirst();

	if(sessionLength==0){
		
		for(int i=0; i<no.length ; i++){

			Query= "Insert Into Raum_Order (M_id,Prd_no,B_qty,B_date,Cl_name,Cl_add1,Cl_add2,Cl_add3,Cl_phone,Cl_message,B_price,B_paymentWay)	value(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement InsertCursor = con.prepareStatement(Query);
			InsertCursor.setString(1,id);
			InsertCursor.setInt(2,Integer.parseInt(no[i]));
			InsertCursor.setInt(3,Integer.parseInt(qty[i]));
			InsertCursor.setString(4,today);
			InsertCursor.setString(5,name);
			InsertCursor.setString(6,add1);
			InsertCursor.setString(7,add2);
			InsertCursor.setString(8,add3);
			InsertCursor.setString(9,tel);
			InsertCursor.setString(10,Message);
			InsertCursor.setInt(11,Integer.parseInt(Price));
			InsertCursor.setString(12,card);

			InsertCursor.executeUpdate();

			Query= "delete from Raum_Cart where M_id='"+id+"' and Prd_no="+Integer.parseInt(no[i]) ;
			PreparedStatement deleteCursor = con.prepareStatement(Query);
			deleteCursor.executeUpdate();


		}

			%>
				<script>
					location.href="11_mypage3-product-ordering2.jsp?type=1";
				</script>
			<%
		
	}
	else{
		Query = "SELECT MAX(B_type) FROM Raum_Order WHERE M_id='"+id+"'";
		PreparedStatement sessionHelper3 = con.prepareStatement(Query);
		ResultSet sessionCursor3 = sessionHelper3.executeQuery();

		if(sessionCursor3.next()){
			int B_type2 = sessionCursor3.getInt("MAX(B_type)")+1;

			for(int i=0; i<no.length ; i++){
				Query= "Insert Into Raum_Order (M_id,Prd_no,B_qty,B_date,Cl_name,Cl_add1,Cl_add2,Cl_add3,Cl_phone,Cl_message,B_type,B_price,B_paymentWay)	value(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement InsertCursor = con.prepareStatement(Query);
				InsertCursor.setString(1,id);
				InsertCursor.setInt(2,Integer.parseInt(no[i]));
				InsertCursor.setInt(3,Integer.parseInt(qty[i]));
				InsertCursor.setString(4,today);
				InsertCursor.setString(5,name);
				InsertCursor.setString(6,add1);
				InsertCursor.setString(7,add2);
				InsertCursor.setString(8,add3);
				InsertCursor.setString(9,tel);
				InsertCursor.setString(10,Message);
				InsertCursor.setInt(11,B_type2);
				InsertCursor.setInt(12,Integer.parseInt(Price));
				InsertCursor.setString(13,card);

				InsertCursor.executeUpdate();

				

				Query= "delete from Raum_Cart where M_id='"+id+"' and Prd_no="+Integer.parseInt(no[i]) ;
				PreparedStatement deleteCursor = con.prepareStatement(Query);
				deleteCursor.executeUpdate();
	

			}
			%>
				<script>
					location.href="11_mypage3-product-ordering2.jsp?type=<%=B_type2%>";
				</script>
			<%

		}

	}
%>