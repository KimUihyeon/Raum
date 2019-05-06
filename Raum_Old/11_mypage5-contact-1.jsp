<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage5-contact-1.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage-Common.js"></script>
<script src="Asset/00_Script/Mypage5-contact-1.js"></script>
<title>:: RAUM</title>
</head>
<%

	String currentLoginID = (String)session.getAttribute("currentSessionID");
	int QTY= 0;
	if(currentLoginID==null){
		response.sendRedirect("error_500.html");
	}
	else{
		Query = "select * from Raum_Request where M_id='"+currentLoginID+"'";
		PreparedStatement cursorHelper = con.prepareStatement(Query);
		ResultSet cursor = cursorHelper.executeQuery();

		cursor.last();
		int sessionLength = cursor.getRow();
		cursor.beforeFirst();

%>
<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Contact
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 의뢰내역
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section_Center">
        	<div class="selectBox">
            	<select id="mypageSelect">
                	<option value="mypageCenter">마이페이지</option>
                	<option value="profile">개인정보수정</option>
                    <option value="order">주문내역</option>
                    <option value="cart">장바구니</option>
                    <option value="wishlist">관심상품</option>
                    <option value="contanct">의뢰내역</option>
                    <option value="inquiry">문의내역</option>
                    <option value="AS">A/S신청내역</option>
                    <option value="review">상품후기</option>
                </select>
                <input type="button" class="moveButton" value="이동">
            </div>
            
            <!--d여기여기-->
            <div class="clickItemBox">
            	총 <%=sessionLength%>건의 의뢰내역이 있습니다.
            </div>
            
            <div class="tableBox">
            	<table class="table1">
                	<tr>
                    	<td>구분
                        </td>
                    	<td>상담명
                        </td>
                    	<td>등록일
                        </td>
                    	<td>상태
                        </td>
                    </tr>

                    
            <%
			
		if(sessionLength==0){
			%>
                    
                	<tr class="tableNoItem">
                    	<td colspan="4">주문하신 상품이 존재하지 않습니다.
                        </td>
                    </tr>

			<%
		}
		else{
			while(cursor.next()){
				String type = cursor.getString("R_type");
				String title = cursor.getString("R_title");
				String dateTesm =cursor.getString("R_date").substring(0,8);
				String notice = cursor.getString("R_addmin_file");
				int No= cursor.getInt("R_no");
				%>
                	<tr>
                    	<td>
                            	<a href="11_mypage5-contact-2.jsp?No=<%=No%>" class="a_box"><%=type%>
                                </a>
                        </td>
                    	<td>
                            	<a href="11_mypage5-contact-2.jsp?No=<%=No%>" class="a_box"><%=title%>
                                </a>
                        </td>
                    	<td><%=dateTesm%>
                        </td>
                    	<td>
				<%

				if(notice.equals("-")){
					%>
                        	<div class="tableNoBtn">
                            	<a href="11_mypage5-contact-2.jsp?No=<%=No%>" class="a_box">답변대기
                                </a>
                            </div>
					<%
				}
				else{
					%>
                        	<div class="tableBtn">
                            	<a href="11_mypage5-contact-2.jsp?No=<%=No%>" class="a_box">답변확인
                                </a>
                            </div>

					
					<%
				}
					%>
					
                        </td>
                    </tr>
					<%

			}
		}
	}
			%>
                </table>
            </div>
            
        </div>
    	
    </section>
    
    <section id="putter">
    	<div class="putter_box">

        	<div class="putter_boxTop">
            	<div class="putter_logo">
                	<a href="00_index.jsp" class="a_box">
                    </a>
                </div>
            </div>

            <div class="putter_boxMid">
            	<div class="putter_icons">
                	<div class="twiter_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                	<div class="facebook_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                	<div class="insta_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                </div>
            </div>

            <div class="putter_boxBottom">
            	<div class="putter_info">ⓒ 2016 Raum. All rights reserved. Raum</h4>
                </div>
                <div class="putter_info">충청남도 천안시 서북구 성환읍 대학로 91</h4>
                </div>
            </div>

        </div>
    </section>
    
</div>

</body>
</html>

