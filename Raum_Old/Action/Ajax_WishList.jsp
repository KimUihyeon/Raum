<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>

<tr>
	<td>
    </td>
    <td>상품번호
    </td>
	<td>상품정보
	</td>
	<td>가격
	</td>
	<td>수량
	</td>
	<td>마일리지
	</td>
	<td>선택
	</td>
</tr>
<%
	String Id = request.getParameter("currentLogin");
	Query = "select * from Raum_Wish,Raum_Product where Raum_Wish.Prd_no = Raum_Product.Prd_no and M_id='"+Id+"' ORDER BY Wish_no desc";
	PreparedStatement cousorHelper = con.prepareStatement(Query);
	ResultSet cursor = cousorHelper.executeQuery();

	cursor.last();
	int sessionLength = cursor.getRow();
	cursor.beforeFirst();

	if(sessionLength==0){
%>							

<tr class="tableNoItem">
	<td colspan="5">주문하신 상품이 존재하지 않습니다.
	</td>
</tr>
<script>
	$('.clickItemBox').html("관심상품 목록(0)");
</script>

<%
	}
	else{
		while(cursor.next()){
			int WishNo=  cursor.getInt("Wish_no");
			int ItemNo = cursor.getInt("Prd_no");
			String FileName = cursor.getString("Prd_name");
								
			String ItemCtg = cursor.getString("Prd_type");
			String ItemTitle = cursor.getString("Prd_title");
			String[] TitleEdit = ItemTitle.split("<br>");
			int price = cursor.getInt("Prd_price");
			int FinalPrice = (int)((double)price - ((double)price/10));
			int Point = (int)((double)FinalPrice/10);
			String ItemNo_String = "A17-";
			if(ItemNo<10){
				ItemNo_String = ItemNo_String+"00"+ItemNo;
			}
			else if(ItemNo<100){
				ItemNo_String = ItemNo_String+"0"+ItemNo;
			}
			else{
				ItemNo_String = ItemNo_String+ItemNo;
			}
			%>
			<tr>
				<td><input type="checkbox" name="Wish_chk" class="Wish_chk" value="<%=ItemNo%>">
				</td>
				<td><%=ItemNo_String%>
				</td>
				<td class="itemBox">
					<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
						<div class="ItemImg" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat; background-size:cover">
						</div>[<%=ItemCtg%>] <%=TitleEdit[0]%> <%=TitleEdit[1]%>
					</a>
				</td>
				<td>&#8361 <%=FinalPrice%>.0
				</td>
				<td>
					<input type="text" readonly value="1" class="countText">
						<div class="TableArrowUp">
						</div>
                        <div class="TableArrowDown">
                        </div>
                </td>
                <td><%=Point%>p
                </td>
                <td>
                    <div class="TableBtn" onClick="CartAdd(<%=ItemNo%>)">장바구니
                    </div>
                    <div class="TableBtn" onClick="Wish_DeleteOne(<%=WishNo%>)">삭제
                    </div>
                </td>
			</tr>

			<%
		}
	}
%>
<script>
	var section_Heigt = 500+( $('tr').length * 60);
	$('#section1').css({height:section_Heigt+"px"});

						
	
	/*갯수 카운트다운*/
	var ArrayCount = new Array();
	var ArrayBool = new Array();
	var CountQty = $('.table1 tr').length;
	for(var i= 0 ; i<CountQty; i++){
		if(i!=0){
			ArrayCount[i] = $('.table1 tr').eq(i).find(' .countText').val();
			ArrayBool[i]=true;
			if(ArrayCount[i]==1){
				console.log(ArrayCount[i]);
				ArrayBool[i]=false;
				$('.table1 tr').eq(i).find(' .TableArrowDown').animate({opacity:0.3},500);
			}
		}
		else{}
	}
	$('tr').each(function(index, element) {
		var $Target = $(this);
        $(this).find(' .TableArrowUp').on('click',function(){
			ArrayCount[index]= parseInt(ArrayCount[index]) + 1;
			$Target.find('.countText').val(ArrayCount[index])
			ArrayBool[index]=true;
			$Target.find('.TableArrowDown').css({opacity:1});
		});
        $(this).find(' .TableArrowDown').on('click',function(){
			if(ArrayBool[index]){
				ArrayCount[index]= parseInt(ArrayCount[index]) - 1;
				if(ArrayCount[index]==1){
					ArrayBool[index]=false;
					$(this).animate({opacity:0.3},500);
				}
				$Target.find('.countText').val(ArrayCount[index]);
			}
		});
    });
	function Submit_1(){
		if($('.Wish_chk').is(":checked")){
			var NextTitle="";
			$('.Wish_chk').each(function(){
				if($(this).is(":checked")){
					NextTitle +=$(this).val()+",";
				}
				
			});
			$.ajax({
				url:'Action/Ajax_WishToCart_select.jsp?currentLogin=<%=Id%>&No='+NextTitle,
				success:function(data){
					console.log(data);
					var TempSring = data.trim();
					console.log(TempSring);
					if(TempSring=="true"){
						alert("장바구니에 추가하였습니다.");
					}
					else{
						alert("상품이 장바구니에 존재합니다");
					}
				}
			})
		}
		else{
			alert("상품을 하나 이상 선택해주세요");
		}
	}
	
	function Submit_2(){
		
		$(".Wish_chk").attr('checked', true);
		if($('.Wish_chk').is(":checked")){
			var NextTitle="";
			$('.Wish_chk').each(function(){
				if($(this).is(":checked")){
					NextTitle +=$(this).val()+",";
				}
				
			});
			$.ajax({
				url:'Action/Ajax_WishToCart_select.jsp?currentLogin=<%=Id%>&No='+NextTitle,
				success:function(data){
					console.log(data);
					var TempSring = data.trim();
					console.log(TempSring);
					if(TempSring=="true"){
						alert("장바구니에 추가하였습니다.");
					}
					else{
						alert("상품이 장바구니에 존재합니다");
					}
				}
			})
		}
		else{
			alert("상품을 하나 이상 선택해주세요");
		}
		
		$(".Wish_chk").attr('checked', false);
	}
	function CartAdd(No){
	    $.ajax({
		    url:'Action/Ajax_CartAdd.jsp?No='+No,
		    success:function(data){
				var dataEdit = ""+data.trim();
			if(dataEdit=="true"){
				alert("장바구니에 등록되었습니다.")
			}
			else{
				alert("이미 등록된 상품입니다.")
			}
		}
	})
	}


	function Wish_DeleteOne(No){
		$('.table1').html("");
			$.ajax({
				url:'Action/Ajax_WishDelete_one.jsp?currentLogin=<%=Id%>&no='+No,
				success:function(data){
				var dataEdit = ""+data.trim();
				$('.table1').append(data);
			}
		})
	}

<%
	if(sessionLength==0){
	}
	else{
%>
	var ItemQty= CountQty -1 ;
	$('.clickItemBox').html("관심상품 목록("+ItemQty+")");
	
<%
	}
%>
</script>