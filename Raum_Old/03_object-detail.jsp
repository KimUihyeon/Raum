<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%@include file="Action/LoginTest.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Object-detail.css?ver=2">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>


<script src="three.js"></script>
<script src="Detector.js"></script>
<script src="OrbitControls.js"></script>
<script src="OBJLoader.js"></script>
<script src="MTLLoader.js"></script>


<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Object-detail.js?ver=4"></script>
<title>:: RAUM</title>
</head>

<body>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String TypeNo = request.getParameter("No");
	if(TypeNo==null){
		response.sendRedirect("error_500.html");
	}
	else{

	int ItemNo = Integer.parseInt(TypeNo);

	
//	Query = "SELECT * FROM Raum_Place, Raum_Product WHERE Raum_Place.Pla_no = Raum_Product.Pla_no and Prd_no ="+ItemNo;
	Query = "SELECT * FROM Raum_Product WHERE Prd_no ="+ItemNo;
	PreparedStatement sessionHelper = con.prepareStatement(Query);
	ResultSet sessionCursor = sessionHelper.executeQuery();

	String Name = "";
	String SubName = "";
	String color = "";
	int Price = 0;
	int SalePrice = 0 ;
	int point = 0 ; 
	int qty = 0 ;

	String TextMain= "";
	String Text1 = "";
	String Text2 = "";
	String FileName = "";
	String _3D = "";
	while(sessionCursor.next()){
		String Temp = sessionCursor.getString("Prd_title");
		String[] TempName = Temp.split("<br>");
		Name = TempName[0];
		SubName = TempName[1];
		FileName = sessionCursor.getString("Prd_name");

		color = sessionCursor.getString("Prd_color");		

		Price = sessionCursor.getInt("Prd_price");
		SalePrice = Price - (Price/10);
		point = SalePrice/10;

		qty = sessionCursor.getInt("Prd_qty");

		TextMain = sessionCursor.getString("Prd_TextMain");
		Text1 = sessionCursor.getString("Prd_Text1");
		Text2 = sessionCursor.getString("Prd_Text2");
		_3D = sessionCursor.getString("Prd_3D");


	};
%>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
	

	<div id="reviewAllPopUp">
    	<div class="PopUpBG">
        </div>
        <div class="PopUpWindow">
        	<div class="PopUpTitle">후기 전체보기
            </div>
            <div class="PopUpInfo">
            	<div class="PopUpInfoCenter">
                	
                    <div class="popUpObjectBox">
                    	<div class="popUpObjectImage">
                        </div>
                        <div class="popUpObjectInfo">
                        	<div class="popUpObjectName"><%=Name%>
                            </div>
                            <div class="popUpObjectPriceBox">
                            	<div class="salePrice">&#8361 <%=SalePrice%>.0 
                                </div>
                                <div class="price">&#8361 <%=Price%>.0
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="reviewList">
                		<div class="reviewItem">
                			<div class="reviewStar">
                    		</div>
                    		<div class="reviewPost">생각보다 예뻐서 놀랐어요!
                    		</div>
                    		<div class="reviewInfoBox">
                        		<div class="reviewDate">2017/01/16
                            	</div>
                            	<div class="reviewID">yelin0129
                            	</div>
                    		</div>
                		</div>
                    
                    	<div class="reviewItem">
                			<div class="reviewStar">
                    		</div>
                    		<div class="reviewPost">아주 만족스럽습니다.
                    		</div>
                    		<div class="reviewInfoBox">
                        		<div class="reviewDate">2017/02/26
                            	</div>
                            	<div class="reviewID">ggiddkd1202
                            	</div>
                    		</div>
                		</div>
                	</div>
                
                	<div class="review-controllers">
            			<input type="button" class="review_controller" value="<">
                		<input type="button" class="review_controller" value="1">
                		<input type="button" class="review_controller" value=">">
            		</div>
                    
                </div>
            </div>
            <div class="PopUpCloseBox">
            	<input type="button" class="PopUpCloseB" value="X">
                <div class="PopUp_logo">
                </div>
            </div>
        </div>
    </div>
    
    <div id="reviewWritePopUp">
    	<div class="PopUpBG">
        </div>
        
        <div class="PopUpWindow">
        	<div class="PopUpTitle">후기 전체보기
            </div>
            <div class="PopUpInfo">
            	<div class="PopUpInfoCenter">
                	
                    <div class="popUpObjectBox">
                    	<div class="popUpObjectImage">
                        </div>
                        <div class="popUpObjectInfo">
                        	<div class="popUpObjectName"><%=Name%>
                            </div>
                            <div class="popUpObjectPriceBox">
                            	<div class="salePrice">&#8361 <%=SalePrice%>.0 
                                </div>
                                <div class="price">&#8361 <%=Price%>.0
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="reviewForm">
                    	<div class="Form_starBox">
                        	<div class="Form_starTitle">평점
                            </div>
                            <div class="Form_stars">
                            	<input type="radio" id="star0" name="reviewStar"><div class="star0"></div>
                                <input type="radio" id="star1" name="reviewStar"><div class="star1"></div>
                                <input type="radio" id="star2" name="reviewStar"><div class="star2"></div>
                                <input type="radio" id="star3" name="reviewStar"><div class="star3"></div>
                                <input type="radio" id="star4" name="reviewStar"><div class="star4"></div>
                                <input type="radio" id="star5" name="reviewStar" checked="checked"><div class="star5"></div>
                            </div>
                        </div>
                        
                        <div class="Form_TextTitle">상품평
                        </div>
                        <textarea class="Form_text">
                        </textarea>
                        
                   	</div>
                    <div class="reviewWriteButtons">
                    	<input type="reset"  class="reviewWriteCancel" value="취소">
                        <input type="submit" class="reviewWriteButton" value="작성하기">
                    </div>
                    
               	</div>
            </div>
            <div class="PopUpCloseBox">
            	<input type="button" class="PopUpCloseB" value="X">
                <div class="PopUp_logo">
                </div>
            </div>
        </div>
    </div>
    
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1"><%=Name%>
            </div>
            <div class="keyContainer_text2"><%=SubName%>
            </div>
        </div>
    </section>
    <%
		
	%>
	<style>
		#keyContainer{
		    background: url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat;
			background-size:cover;
		}
	</style>

    <section id="section1">
    	<div class="section1_Center">
        
        	<div class="section1_box1">
            
            	<div class="simpleInfo_objectImage" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat; background-size:cover">
                </div>
                
                <div class="simpleInfo_textBox">
                	<div class="simpleInfo_title"><%=Name%>
                    </div>
                    
                    <div class="simpleInfo_reviewBox">
                    	<div class="simpleInfo_reviewStar">
                        </div>
                        <div class="simpleInfo_reviewWrite">리뷰작성
                        </div>
                    </div>
                    
                    <div class="simpleInfo_priceBox">
                    	<div class="salePrice">&#8361 <%=SalePrice%>.0 </div>
                        <div class="price">&#8361 <%=Price%>.0</div>
                    </div>
                    
                    <div class="simpleInfo_explanation"><%=TextMain%>
                    </div>
                    
                    <div class="simpleInfo_MileageBox">
                    	<div class="simpleInfo_name">마일리지 :</div>
                        <div class="simpleInfo_valu"><%=point%></div>
                        <div class="simpleInfo_name">point</div>
                    </div>
                    <div class="simpleInfo_StockBox">
                    	<div class="simpleInfo_name">재고수량 :</div>
                        <div class="simpleInfo_valu"><%=qty%></div>
                    </div>
                    <div class="simpleInfo_ObjectNumBox">
                    	<div class="simpleInfo_name">상품번호 :</div>
                        <div class="simpleInfo_valu">P-000<%=ItemNo%></div>
                    </div>
                    <div class="simpleInfo_ColorBox">
                    	<div class="simpleInfo_name">색상 :</div>
                        <div class="simpleInfo_valu"><%=color%></div>
                    </div>
                    
                    <div class="simpleInfo_buyBox">
                    	<div class="simpleInfo_name">주문수량</div>
                        <input id="spinner" value="1" >
                        <div class="simpleInfo_buttons">
						<%
							if(currentLogin==null){
							%>
								
                        	<div class="cartButtonCover">
                        		<input type="button" value="장바구니 담기" class="simpleInfo_cartButton" onClick="alertAA()">
                                <div class="cart_popUpBox">
                                	<div class="cart_popUpMent">선택하신 상품을<br>장바구니에 담았습니다.
                                    	<div class="cart_popUpCloseB">x
                                        </div>
                                    </div>
                                    <div class="cart_popUpButtons">
                                    	<input type="button" class="cart_popUpButton" value="장바구니이동" onCLick="MovePage('10_login.jsp?Log=2')">
                                        <input type="button" class="cart_popUpButton" value="쇼핑계속하기" onCLick="MovePage('03_object-calender.jsp?type=1&listQty=8&page=1&align=new')">
                                    </div>
                            	</div>
                            </div>
							<%
							}
							else{
							%>
                        	<div class="cartButtonCover">
                        		<input type="button" value="장바구니 담기" class="simpleInfo_cartButton" onClick="CartAdd()">
                                <div class="cart_popUpBox">
                                	<div class="cart_popUpMent">선택하신 상품을<br>장바구니에 담았습니다.
                                    	<div class="cart_popUpCloseB">x
                                        </div>
                                    </div>
                                    <div class="cart_popUpButtons">
                                    	<input type="button" class="cart_popUpButton" value="장바구니이동" onCLick="MovePage('11_mypage3-cart.jsp')">
                                        <input type="button" class="cart_popUpButton" value="쇼핑계속하기" onCLick="MovePage('03_object-calender.jsp?type=1&listQty=8&page=1&align=new')">
                                    </div>
                            	</div>
                            </div>
							<%

							}
						%>

                        	<input type="button" class="simpleInfo_loveButton WishList" onClick="WishAdd()">

							<script>
								function alertAA(){
									alert("회원전용서비스입니다.");
								}
								function MovePage(page){
									location.href=page;
								}
								function WishAdd(){
								    $.ajax({
								    url:'Action/Ajax_WishAdd.jsp?No=<%=ItemNo%>',
								    success:function(data){
										var dataEdit = ""+data.trim();
										if(dataEdit=="true"){
											alert("관심상품에 등록되었습니다.")
										}
										else{
											alert("이미 등록된 상품입니다.")
										}
									}
									})
								}
								function CartAdd(){
								    $.ajax({
								    url:'Action/Ajax_CartAdd.jsp?No=<%=ItemNo%>',
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
							</script>

                        	<input type="button" class="simpleInfo_linkButton">
                        </div>
                    </div>
                    
                    <div class="simpleInfo_deliveryType">
                    	<div class="deliveryTypeIcon">
                        </div>
                        <div class="deliveryType">조건부 무료배송
                        </div>
                    </div>
                    
                    <div class="simpleInfo_snsButtons">
                    	<div class="simpleInfo_name">공유하기 :</div>
                        <div class="simpleInfo_snsButton"></div>
                        <div class="simpleInfo_snsButton"></div>
                        <div class="simpleInfo_snsButton" id="section__1"></div>
                    </div>
                    
                </div>
                
            </div>
            
            <div class="section1_box2">
            	<div class="boxsName">
                	<div class="sectionName_info">
						<a href="#section__1" class="a_box">상품 상세정보
						</a>
                    </div>
                    <div class="sectionName_review">
						<a href="#section__2" class="a_box">상품 후기(2)
						</a>
                    </div>
                    <div class="sectionName_delivery">
						<a href="#section__3" class="a_box">배송/교환/환불
						</a>
                    </div>
                </div>
                
                <div class="box2_objectImage ItemRaum" style="background: url(Asset/01_img/03_Object-detail/ItemRaum.jpg) top center no-repeat; background-size:contain;">
                </div>
                <div class="box2_objectImage" style="display:none">
                </div>
                <div class="box2_objectImage" style="display:none">
                </div>
                <div class="box2_objectImage intro-3D" id="3DTarget">
                </div>
				<script>
					$(function(){

						var $ItemRaum = $('.ItemRaum');
						var Interval = setInterval(function(){
							sizeTO();
						},500);
					
						function sizeTO(){
						var h_ = $ItemRaum.width() * 1.586;
							$ItemRaum.css({height:h_+"px"});
							console.log("ddd");
						}

						sizeTO();

						$(window).resize(function(){
							sizeTO();
						});
				});
				</script>

				
                <script>
				// 애드라 이거야!!
				// 애드라 이거야!!
				// 애드라 이거야!!
				
				var target ="<%=_3D%>";
				
				// 애드라 이거야!!
				// 애드라 이거야!!
				// 애드라 이거야!!
				// 애드라 이거야!!
				// 애드라 이거야!!

		        if (!Detector.webgl) {
		            Detector.addGetWebGLMessage();
		        }

        		var container;

		        var camera, controls, scene, renderer;
		        var lighting, ambient, keyLight, fillLight, backLight;

		        //var windowHalfX = window.innerWidth / 2;
        		//var windowHalfY = window.innerHeight / 2;
				
				var targetOBJ =document.getElementById('3DTarget');
		        var windowHalfX = window.innerWidth / 2;
		        var windowHalfY = window.innerHeight / 2;
				/*
		        var windowHalfX = targetOBJ.width/ 2;
		        var windowHalfY = targetOBJ.height /2 
*/
				
        		init();
		        animate();

        		function init() {

	        	    container = document.createElement('div');
    	        	document.getElementById('3DTarget').appendChild(container);  // 이부분 바꿔주면댐

	        	    /* Camera */
					$('#3DTarget').width();
        	    	camera = new THREE.PerspectiveCamera(100,$('#3DTarget').width()/ ($('#3DTarget').height()*1.2),1, 500);
//	        	    camera = new THREE.PerspectiveCamera(100, window.innerWidth / window.innerHeight,1, 500);
					//숫자 높이면 멀어짐 , 모름 , 모름 , 모름
	        	    camera.position.z = 5; //숫자 높이면 멀어짐

    		        /* Scene */

            		scene = new THREE.Scene();
		            lighting = false;

        		    ambient = new THREE.AmbientLight(0xffffff, 1.0);
		            scene.add(ambient);

        		    keyLight = new THREE.DirectionalLight(new THREE.Color('hsl(30, 100%, 75%)'), 1.0);
		            keyLight.position.set(-100, 500, 100);

        		    fillLight = new THREE.DirectionalLight(new THREE.Color('hsl(240, 100%, 75%)'), 0.75);
		            fillLight.position.set(100, 0, 100);

        		    backLight = new THREE.DirectionalLight(0xffffff, 1.0);
		            backLight.position.set(100, 0, -100).normalize();
			
			
					scene.add(keyLight);
					scene.add(fillLight);
					scene.add(backLight);


		            var mtlLoader = new THREE.MTLLoader();
        		    mtlLoader.setBaseUrl('Asset/01_img/99_3DModel/');
		            mtlLoader.setPath('Asset/01_img/99_3DModel/');
			
		            mtlLoader.load(target+".mtl", function (materials) {

        	        materials.preload();

            	    materials.materials.default.map.magFilter = THREE.NearestFilter;
                	materials.materials.default.map.minFilter = THREE.LinearFilter;

	                var objLoader = new THREE.OBJLoader();
    	            objLoader.setMaterials(materials);
        	        objLoader.setPath('Asset/01_img/99_3DModel/');
           	//    objLoader.load('female-croupier-2013-03-26-2.obj', function (object) {
                	objLoader.load(target+".obj", function (object2) {

                    scene.add(object2);

	                });

    	        });
						





    	        /* Renderer */

   		        renderer = new THREE.WebGLRenderer();
   		        renderer.setPixelRatio(window.devicePixelRatio);
//1 	  	    renderer.setSize(window.innerWidth, window.innerHeight);
	 	  	    renderer.setSize(window.innerWidth, window.innerHeight);
      		    renderer.setClearColor(new THREE.Color("hsl(0, 0%, 10%)"));

 	           container.appendChild(renderer.domElement);

    	        /* Controls */

    	        controls = new THREE.OrbitControls(camera, renderer.domElement);
	            controls.enableDamping = true;
       			controls.dampingFactor = 0.25;
    	        controls.enableZoom = true;
				controls.enableRotate=true;
            	/* Events */

	            window.addEventListener('resize', onWindowResize, false);
    	        window.addEventListener('keydown', onKeyboardEvent, false);

        	}

	        function onWindowResize() {
				/*
		      windowHalfX = targetOBJ.width/ 2;
		      windowHalfY = targetOBJ.height /2 
			  */
    	      windowHalfX = window.innerWidth / 2;
        	  windowHalfY = window.innerHeight / 2;

            	camera.aspect = window.innerWidth / window.innerHeight;
	            camera.updateProjectionMatrix();

    	        renderer.setSize(window.innerWidth, window.innerHeight);
				$('.test').css({height: window.innerHeight*0.8+'px'});

	        }

	        function onKeyboardEvent(e) {

    	        if (e.code === 'KeyL') {

        	        lighting = !lighting;
	
    	            if (lighting) {

        	            ambient.intensity = 0.25;
            	        scene.add(keyLight);
                	    scene.add(fillLight);
                    	scene.add(backLight);

        	        }
					else {

   	        	        ambient.intensity = 1.0;
        	            scene.remove(keyLight);
    	           	    scene.remove(fillLight);
	                   	scene.remove(backLight);

					}

				}

			}

		    function animate() {
		    	requestAnimationFrame(animate);
        		controls.update();
		        render();

        	}

		    function render() {
        		renderer.render(scene, camera);
		    }
			</script>
                
                <div class="objectInfoBox">
                	<div class="objectInfoTitle-box">
                    </div>
                    
                	<div class="objectInfoTitle">상품 상세정보
                    </div>
                    
                    <div class="objectInfoTitle-1">상품설명
                    </div>
                    
                    <div class="objectInfo1"><%=Text1%>
                    </div>
                    <div class="objectInfo1"><%=Text2%>
                    </div>
                    <div class="objectInfo1" id="section__2">- 실측사이즈는 재는위치나 방식에따라 조금씩 차이가 날 수 있습니다.<br>- 제품의 사향은 품질개선을 위해 일부 사양이 변경될  수 있습니다.<br>- 모니터의 해상도, 사양, 보는 각도에 따라 색상차이가 있을 수 있습니다.
                    </div>
                </div>
            </div>
            
            <div class="section1_box3">
            	<div class="boxsName">
                	<div class="sectionName_info">
						<a href="#section__1" class="a_box">상품 상세정보
						</a>
                    </div>
                    <div class="sectionName_review">
						<a href="#section__2" class="a_box">상품 후기(2)
						</a>
                    </div>
                    <div class="sectionName_delivery">
						<a href="#section__3" class="a_box">배송/교환/환불
						</a>
                    </div>
                </div>
                
                <div class="reviewButtons">
                	<input type="button" class="reviewAllButton" value="후기 전체보기">
                    <input type="button" class="reviewWrite" value="후기 작성하기">
                </div>
                
                <div class="reviewNone">
                	<div class="reviewNoneMent">등록된 상품후기가 없습니다.
                    </div>
                    <div class="reviewNoneMent">첫 후기를 작성하고 200마일리지 받아가세요!
                    </div>
                </div>
                
                <div class="reviewList">
                	<div class="reviewItem">
                		<div class="reviewStar">
                    	</div>
                    	<div class="reviewPost">생각보다 예뻐서 놀랐어요!
                    	</div>
                    	<div class="reviewInfoBox">
                        	<div class="reviewDate">2017/01/16
                            </div>
                            <div class="reviewID">yelin0129
                            </div>
                    	</div>
                	</div>
                    
                    <div class="reviewItem">
                		<div class="reviewStar">
                    	</div>
                    	<div class="reviewPost">아주 만족스럽습니다.
                    	</div>
                    	<div class="reviewInfoBox">
                        	<div class="reviewDate">2017/02/26
                            </div>
                            <div class="reviewID">ggiddkd1202
                            </div>
                    	</div>
                	</div>
                </div>
                
                <div class="review-controllers">
            		<input type="button" class="review_controller" value="<">
                	<input type="button" class="review_controller" value="1">
                	<input type="button" id="section__3" class="review_controller" value=">">
            	</div>
            </div>
            
            <div class="section1_box4">
            	<div class="boxsName">
                	<div class="sectionName_info">
						<a href="#section__1" class="a_box">상품 상세정보
						</a>
                    </div>
                    <div class="sectionName_review">
						<a href="#section__2" class="a_box">상품 후기(2)
						</a>
                    </div>
                    <div class="sectionName_delivery">
						<a href="#section__3" class="a_box">배송/교환/환불
						</a>
                    </div>
                </div>
                
                <div class="deliveryBox">
                	<div class="deliveryTitle">배송정보
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">배송기간은 주문일(무통장입금은 결제완료일)로부터 1일(24시간) ~ 14일 정도 걸립니다. (주말, 공휴일 제외)
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">단, 지정일이 배송이 가능한 상품이나, 제작 기간이 별도호 소요되는 상품의경우에는 상품설명에있는 제작 기간과 배송 시기를 숙지해 주시기 바랍니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">제작 기간에 따라 배송이 지연될수있습니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">조건부 무료배송입니다. (20만원 이상)
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">지역에따라 추가 배송비용이 발생할 수 있음을 알려드립니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">해외배송은 불가합니다.
                        </div>
                    </div>
                </div>
                
                <div class="deliveryBox">
                	<div class="deliveryTitle">교환/환불안내
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">교환/환불신청은 배송완료 후 7일 이내 가능합니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">고객님의 변심으로 환불을 요청하실 경우 배송비는 고객님의 부담입니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">상품에 불량인 경우 배송비를 포함한 전액 환불 가능합니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">주문제작인 상품은 교환/환불이 불가합니다.
                        </div>
                    </div>
                </div>
                
                <div class="deliveryBox">
                	<div class="deliveryTitle">교환/환불<br>불가사유
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">교환/환불 기간이 지난 경우 신청이 불가합니다.
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">고객님의 책임사유로 상품이 회손된 경우 불가합니다. ( 상품 내용 확인을 위해 포장 등을 훼손한 경우는 제외 )
                        </div>
                    </div>
                    
                    <div class="deliveryInfo">
                    	<div class="clamp">>
                        </div>
                        <div class="deliveryInfoText">사용하신 제품은 교환/환불이 불가합니다.
                        </div>
                    </div>
                </div>
                
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
<%
	}
%>
</body>
</html>
