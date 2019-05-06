<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>

<%
	String Ctg = request.getParameter("Ctg");
	Query = "select * from Raum_FAQ where F_ctg='"+Ctg+"'";
	PreparedStatement cousorHelper = con.prepareStatement(Query);
	ResultSet cursor = cousorHelper.executeQuery();
	
	cursor.last();
	int sessionLength = cursor.getRow();
	cursor.beforeFirst();

	if(sessionLength==0){
	}
	else{
		while(cursor.next()){
			String Text = cursor.getString("F_text");
			String Title = cursor.getString("F_title");
			%>
				<div class="Level-04-Item">
					<div class="Text-Q">Q : <%=Title%>
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active"><%=Text%>
				</div>
			<%
		}
	}
%>
<script>

$(function(){
  var $Q= $('.Level-04-Item');
  var $A= $('.Level-04-DropItem');

  $Q.each(function(index){
    $(this).on('click',function(){
      $('.Text-A').addClass('Text-A-Ative');
      $(this).find(' .Text-A').removeClass('Text-A-Ative');
      $A.addClass('Drop-Active');
      $A.eq(index).removeClass('Drop-Active');
    })
  });
	
	var _H =(<%=sessionLength%>*35)+850;
	$('#section1').css({height:_H+'px'});
  
});

</script>
<style>