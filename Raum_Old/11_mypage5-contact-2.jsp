<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage5-contact-2.css?ver=1">

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
<script src="Asset/00_Script/Mypage5-contact-2.js"></script>
<title>:: RAUM</title>
</head>
<%
	String no = request.getParameter("No");
	Query = "select * from Raum_Request where R_no="+no;
	PreparedStatement cursorHelper = con.prepareStatement(Query);
	ResultSet cursor = cursorHelper.executeQuery();

	cursor.last();
	int sessionLength = cursor.getRow();
	cursor.beforeFirst();
	String text = "";
	int nextNo = 0;
	String FileName = "";
	String _3D = "";
	String Confirm = "";

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
            <div class="keyContainer_text2">Home / 마이페이지 / 의뢰내역 / 상세보기
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1Center">
        	<div class="radioBox">
            	<input type="radio" name="chkCustom" value="chkCustom" checked="checked">가구제작
            </div>
            
            <div class="section1Title">의뢰내역 3D 미리보기
            </div>
			<%
				if(sessionLength==0){
					%>

					<%
				}
				else{
					while(cursor.next()){
						text = cursor.getString("R_text");
						nextNo = cursor.getInt("R_no");
						FileName = cursor.getString("R_file");

						_3D = cursor.getString("R_addmin_file");
						Confirm = cursor.getString("FinalConfirm");

						if(_3D.equals("-")){
							%>
            <div class="threeBox intro-3D" id="3DTarget">
            </div>
							<%
						}
						else{
							%>
            <div class="threeBox intro-3D" id="3DTarget">
            </div>
			
				
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
        		    mtlLoader.setBaseUrl('Asset/01_img/99_UpdateRequst3D/');
		            mtlLoader.setPath('Asset/01_img/99_UpdateRequst3D/');
			
		            mtlLoader.load(target+".mtl", function (materials) {

        	        materials.preload();

            	    materials.materials.default.map.magFilter = THREE.NearestFilter;
                	materials.materials.default.map.minFilter = THREE.LinearFilter;

	                var objLoader = new THREE.OBJLoader();
    	            objLoader.setMaterials(materials);
        	        objLoader.setPath('Asset/01_img/99_UpdateRequst3D/');
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

					<%
				}
			%>
							<%
						}
					}
					%>
            
            <div class="section1Title">의뢰내역
            </div>
            <div class="customInfoBox"><%=text%>
            </div>
            
            <div class="section1Title">첨부 파일 내역
            </div>
            <div class="customImageBox" style="background: url(Asset/01_img/99_UpdateRequst/<%=FileName%>) center center no-repeat;
			background-size:contain;">
            </div>
            
            <div class="section1MentBox">
            	<div class="clamp">></div>
                <div class="customMent">문의하신 사항과 맞지않는 모델이신 경우 더 상세한 정보를 재문의 해주시길 바랍니다.
                </div>
            </div>
            <div class="section1MentBox">
            	<div class="clamp">></div>
                <div class="customMent">의뢰 완료를 눌러주시면 위의 모델을 통해 주문제작 됩니다.
                </div>
            </div>
            <div class="section1MentBox">
            	<div class="clamp">></div>
                <div class="customMent">의뢰 완료후 3일 후에 제작에 들어갑니다. 만약 변경을 원하시면 3일안에 연락을 주셔야합니다.
                </div>
            </div>
            
            <div class="section1Buttons">

			<%
				if(sessionLength==0){
					%>
            <input type="button" class="reQuestAgainB fianlDo" value="잘못된 접근입니다.">
					<%
				}
				else{
						if(Confirm.equals("o")){
							%>
            <input type="button" class="reQuestB fianlDo" value="의뢰가 왼료된 문서입니다.">

							<%
						}
						else{
							if(_3D.equals("-")){
								%>
								
            <input type="button" class="reQuestAgainB fianlDo" value="재문의" onClick="onClickPage('11_mypage5-contact-edit-1.jsp?no=<%=nextNo%>')">
								<%
							}
							else{
								%>
								
            <input type="button" class="reQuestAgainB" value="재문의" onClick="onClickPage('11_mypage5-contact-edit-1.jsp?no=<%=nextNo%>')">
            <input type="button" class="reQuestB" value="의뢰완료" onClick="onClickPage('11_mypage5-contact-3.jsp?no=<%=nextNo%>')">
								<%
							}
							%>
							
							<%
						}
					%>
					<%
				}
			%>
			<%
			%>
            </div>
			<script>
				function onClickPage(page){
					location.href=page;
				}
			</script>
            
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
