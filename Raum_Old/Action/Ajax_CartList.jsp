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
	Query = "select * from Raum_Cart,Raum_Product where Raum_Cart.Prd_no = Raum_Product.Prd_no and M_id='"+Id+"' ORDER BY Cart_no desc";
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
	$('.TotalLine').html("0.0 천원");
	$('.RightTop').html(".00 천원 <div class=Tag>상품총 금액</div>");
	$('.RightBottom').html("0.00 천원 <div class=Tag>배송비</div>");

	$('.TotalBottom').html("<font color='#666666' class='font'>(적립 마일리지 0p) 결제 예정 금액 </font><font color='#996867' class='font'>0.00 천원 </font>");
</script>

<%
	}
	else{
		while(cursor.next()){
			int CartNo=  cursor.getInt("Cart_no");
			int ItemNo = cursor.getInt("Prd_no");
			int Cartqty=  cursor.getInt("Cart_qty");
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
				<td>
					<input type="checkbox" name="Cart_chk" class="CartNo" value="<%=CartNo%>">
				</td>
				<td><%=ItemNo_String%>
				</td>
				<td class="itemBox">
					<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
						<div class="ItemImg" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat; background-size:cover">
						</div>[<%=ItemCtg%>] <%=TitleEdit[0]%> <%=TitleEdit[1]%>
					</a>
				</td>
				<td class="priceBox">&#8361 <%=FinalPrice%>.0
				</td>
				<td>
					<input type="text" readonly value="<%=Cartqty%>" class="countText">
						<div class="TableArrowUp">
						</div>
                        <div class="TableArrowDown">
                        </div>
                </td>
                <td><%=Point%>p
                </td>
                <td>
                    <div class="TableBtn">
                       	<a href="11_mypage3-product-ordering1_one.jsp?no=<%=ItemNo%>" class="a_box">구매하기
                        </a>
                    </div>
                    <div class="TableBtn" onClick="Cart_DeleteOne(<%=CartNo%>)">삭제
                    </div>
                </td>
			</tr>

			<%
		}
	}
%>
<script>
	var section_Heigt = 900+( $('tr').length * 60);
	$('#section1').css({height:section_Heigt+"px"});
	
	$('.cart_iconIn_text').html('<%=sessionLength%>');


						
	
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
			countPrice();
			Arrow_Ajax($Target.find('.CartNo').val(),ArrayCount[index]);
		});
        $(this).find(' .TableArrowDown').on('click',function(){
			if(ArrayBool[index]){
				ArrayCount[index]= parseInt(ArrayCount[index]) - 1;
				if(ArrayCount[index]==1){
					ArrayBool[index]=false;
					$(this).animate({opacity:0.3},500);
				}
				$Target.find('.countText').val(ArrayCount[index]);
			countPrice();
			Arrow_Ajax($Target.find('.CartNo').val(),ArrayCount[index]);
			}
		});
    });


	function Cart_DeleteOne(No){
		$('.table1').html("");
			$.ajax({
				url:'Action/Ajax_CartDelete_one.jsp?currentLogin=<%=Id%>&no='+No,
				success:function(data){
				var dataEdit = ""+data.trim();
				$('.table1').append(data);
			}
		})
	}

	function countPrice(){
		
	var ItemQty= CountQty -1 ;
	$('.clickItemBox').html("관심상품 목록("+ItemQty+")");

	var $Qty = $('.countText');
	var $Price = $('.priceBox');
	var Qty = new Array();
	var Price = new Array();
	var StringTemp = new Array();
	var Total_ =0;
	var Total_s ="배송 상품 합계금액 ";

	for(var i=0 ; i<ItemQty ; i++){
		Qty[i] =$('.countText').eq(i).val();
		Price[i] = $('.priceBox').eq(i).text().trim();
		StringTemp = Price[i].split(" ");
		console.log(Qty[i]);
		console.log(Price[i]);
		console.log(StringTemp[1]);
		Total_ += parseInt(StringTemp[1]) * parseInt(Qty[i]);
		console.log(Total_);
	}
	Total_s += Total_+".0 + 배송비 0.25 = 합계 "+ ( Total_ +0.25)+"원";
	console.log(Total_s);
	$('.TotalLine').html(""+Total_s);
	$('.RightTop').html(Total_+".00 천원 <div class=Tag>상품총 금액</div>");
	$('.RightBottom').html("0.25 천원 <div class=Tag>배송비</div>");

	var point =(Total_ / 10);
	$('.TotalBottom').html("<font color='#666666' class='font'>(적립 마일리지 "+point+"p) 결제 예정 금액 </font><font color='#996867' class='font'>"+( Total_ +0.25)+"천원 </font>");
	}
	function Arrow_Ajax(No,Qty){
		$.ajax({
			url:'Action/Ajax_CartUpdate_Arrow.jsp?No='+No+'&Qty='+Qty,
			success:function(data){
			}
		})

	}

<%
	if(sessionLength==0){
	}
	else{
%>
	countPrice();
	
	
<%
	}
%>
</script>