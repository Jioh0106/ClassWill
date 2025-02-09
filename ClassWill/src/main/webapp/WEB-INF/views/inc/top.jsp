<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style>
    
/*** Top Navbar Start ***/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');


* {
     font-family: "Noto Sans KR", sans-serif; 
}

.class-will-top {
    background: black;
}

.class-will-top a {
    color: inherit; 
    text-decoration: none; 
}

.navbar .navbar-nav .nav-link {
    padding: 0px 20px;
    font-size: 18px;
    color: white; 
    transition: .5s;
}

.navbar {
    height: 150px;
    border-bottom: 1px solid rgba(255, 255, 255, .3);
    background: black !important; /* Navbar 배경을 검정색으로 설정 */
}

.navbar .navbar-nav .nav-link:hover,
.navbar .navbar-nav .nav-link.active,
.navbar .navbar-nav .nav-link:hover .nav-link.active {
    color: white; /* 호버 상태에서 글자 색을 흰색으로 유지 */
    font-weight: bold; /* 호버 상태에서 볼드체 */
}


.navbar-nav > a:hover {
    background: white;
    border-radius: 5px;
}

.navbar-nav > div:hover {
    background: white;
    border-radius: 5px;
}

.navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 700;
    vertical-align: middle;
    margin-left: 8px;
    color: white; /* 드롭다운 토글 아이콘 색을 흰색으로 설정 */
}

@media (min-width: 1200px) {
    .navbar .nav-item .dropdown-menu {
        display: block;
        visibility: hidden;
        top: 100%;
        transform: rotateX(-75deg);
        transform-origin: 0% 0%;
        border: 0;
        transition: .5s;
        opacity: 0;
    }
}

@media (max-width: 1200px) {
    #navbarCollapse {
        background: lightgray;
        border-radius: 10px;
    }
}

.navbar-brand {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    padding: 0;
    margin: 0;
}

.navbar-toggler {
    border: none;
    background: none;
}

.navbar-toggler:focus {
    outline: none;
}

.navbar-toggler-icon {
    background-image: none;
    font-size: 1.5rem;
    color: white;
}

.dropdown .dropdown-menu a:hover {
    background: gray;
    color: var(--bs-light);
}

.navbar .nav-item:hover .dropdown-menu {
    transform: rotateX(0deg);
    visibility: visible;
    background: var(--bs-light) !important;
    border-radius: 10px !important;
    transition: .5s;
    opacity: 1;
}

#searchModal .modal-content {
    background: black;
   	margin: auto;
}

.collapse-category {
    background: black;
    color: white;
    position: absolute;
    width: 100%;
    z-index: 1000;
}

.collapse-category .collapse-category {
    background: black;
}

.top-ul {
    list-style: none;
}

.big-category {
    font-weight: bold;
    margin-bottom: 15px;
}

#top-class-regist {
	border: 1px solid white;
    border-radius: 5px;
}

.top-logout {
	padding-left: 15px;
	cursor : pointer;
}

.collapse-category .col {
    display: flex;
    flex-direction: column;
}

.collapse-category .big-category {
    flex-shrink: 0;
    margin-bottom: 10px;
}

.collapse-category .top-ul {
    padding-left: 0;
}

.collapse-category .top-ul li {
    list-style: none;
}


@media (max-width: 992px) {
    .navbar {
	    height: 120px;
	    border-bottom: 1px solid rgba(255, 255, 255, .3);
	    background: black !important; /* Navbar 배경을 검정색으로 설정 */
	}
    
}


.search-box {
	height: 40px;
	width:  300px;
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 40px;
	padding: 10px;
	border: 1px solid #f9deec;
	
}

.search-txt {
    border: none;
    background : none;
    outline: none;
    float: left;
    padding: 0px;
    padding-left: 10px;
    color: black;
    font-size: 15px;
    width: 80%;
    align-items: center;
   
}

.search-btn {
	color: black;
	float: right;
	width: 40px;
	height: 100%;
	border-radius: 50%;
	border: none;
	background: none;
	font-size: 16px;
	display:flex;
	justify-content: center;
	align-items: center; 
	
	
}

.search-box-area {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: none;  
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.8);
    z-index: 999;
}

.search-box-area .modal-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: black;
    padding: 50px 20px 20px 20px;
    border-radius: 10px;
    position: relative;
}

.search-box-area .modal-header .close {
    position: absolute;
    top: 10px;
    right: 10px;
    color: white;
    font-size: 1.5rem;
    cursor: pointer;
}

.recommend-keyword {
	color: white;
	border: 1px solid white;
	border-radius: 30px;
	padding: 10px 15px;;
	margin: 10px;
	font-size: 14px;
}


@media (min-width: 576px) {
    .mini-top-menu {
        width: 350px;
    }
}

@media (max-width: 576px) {
    .mini-top-menu {
        width: 100%;
    }
}

.mini-top-menu {
	position:fixed;
	left: 0px;
	top:0px;
	background: white;
	color: black;
	height: 100%; 
	z-index: 99;
	display: none;
	overflow-y:auto;
}

.mini-top-menu-header {
	height: 50px;
	background: #EAEAEA;
	padding: 10px 20px;
	align-items: center;
}

.mini-cate-big {
 	font-size: 18px; 
/* 	font-weight: bold; */
	margin-bottom: 8px;
	margin-top: 8px;
}

.mini-cate-small{
	font-size: 15px;
	margin-bottom: 5px;
}

.mini-cate-small-area {
	list-style: none;
	padding: 0px;
}

.mini-cate-local {
	font-size: 18px; 
	margin-bottom: 8px;
	color: black;
}

#mini-cate-local-area {
	margin-bottom: 80px;
}

.mini-cate-small-area {
/* 	display: none; */
	
}


.badge-position {
	top: 12px; /* 위로 이동 */ 
	right: 20px; /* 오른쪽으로 이동 */ 
    transform: translate(50%, -50%); /* 적절한 위치로 조정 */
    width: 12px !important;
    height: 12px !important;
    display: flex;
    align-items: center;
    justify-content: center;
	font-size: 8px;
}


#chatListModal {
    display: none;
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 9999;
    overflow: hidden;
}

@media (min-width: 600px) {
    #chatListModal {
		width: 400px;
    	height: 700px;
    	
    }
}

/* 모바일에서의 스타일 조정 */
@media (max-width: 600px) {
    #chatListModal {
        width: 100%;
        max-width: 100%;
        border-radius: 0px;
    }
}


.chat-modal-content {
    position: relative;
    width: 100%;
    height: 100%;
}

#chatModalClose {
    position: absolute;
    top: 8px;
    right: 10px;
    cursor: pointer;
    color: gray;
    font-size: 25px;
    font-weight: bold;
}

#chatListContent {
    width: 100%;
    height: 100%;
}

/* 모달 배경 */
.modal-backdrop {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 9998;
}


/*** Top Navbar End ***/

</style>

<!-- top Navbar start -->
<div class="class-will-top">
	<div class="container-fluid ">
	    <div class="container px-0 top-cate">
	        <nav class="navbar navbar-expand-lg bg-body-tertiary">
	            <div class="container-fluid">
	                <div class="row w-100 d-lg-flex d-md-none d-none align-items-end top-nev-lg">
	                    
	                    <!-- 왼쪽 네비게이션 영역 -->
		                    <div class="col-5 d-none d-lg-flex justify-content-start mb-3">
		                        <ul class="navbar-nav">
		                            <li class="nav-item">
		                                <a href="#" class="nav-link" data-bs-toggle="collapse" id="top-categoty"  data-bs-target="#collapse-category" aria-expanded="false" aria-controls="collapse-category">
		                                	<span class="fa fa-bars"></span> 카테고리
		                                </a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" href="" data-bs-toggle="collapse" id="top-local" data-bs-target="#collapse-zone" aria-expanded="false" aria-controls="collapse-zone">
		                                	지역별
		                                </a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" href="event">이벤트</a>
		                            </li>
		                        </ul>
		                    </div> <!-- col-5 -->
	
	                    <!-- 가운데 로고 영역 (큰 화면) -->
	                    <div class="col-2 d-none d-lg-flex justify-content-center">
	                        <a class="navbar-brand" href="./">
	                            <img src="${pageContext.request.contextPath}/resources/img/class_will_logo.png" width="200px" alt="Logo" class="d-inline-block align-text-top">
	                        </a>
	                    </div>
	
	                    <!-- 오른쪽 네비게이션 영역 -->
	                    <div class="col-5 mb-3">
							<div class="row mb-4">
		                    	<div class="col d-none d-lg-flex justify-content-end align-items-center">
									<ul class="navbar-nav ">
									    <li class="nav-item px-4 d-flex align-items-center">
									        <a class="nav-link" href="creator-main" id="top-class-regist">클래스등록</a>
									    </li>
									    <li class="nav-item">
											<!-- 클릭 시 모달 창을 열기 위한 링크 -->
											<a class="nav-link position-relative openChatModal" href="#" id="openChatModal" >
												<i class="bi bi-envelope bi-top"  style="font-size: 25px; "></i>
<!-- 												<span class="position-absolute badge-position bg-danger border border-light rounded-circle alerts"></span> -->
											</a>
											
										</li>
									    <c:choose>
											<c:when test="${empty member.member_email}">
												<li class="nav-item d-flex align-items-center"> 
													<a class="nav-link d-flex align-items-center" href="member-login"> 로그인 <i class="bi bi-chevron-right"></i></a>
												</li>
											</c:when>
											<c:when test="${member.member_type eq 3}">
												<li class="nav-item d-flex align-items-center"> 
													<a class="nav-link" href="admin"><i class="bi bi-gear"></i> 관리자</a>
												</li>
												<li class="nav-item d-flex align-items-center">
												    <a class="nav-link top-logout" onclick="logout()"><i class="bi bi-box-arrow-right" style="font-size: 25px;"></i> 로그아웃</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="nav-item d-flex align-items-center">
												    <a class="nav-link" href="my-page"><i class="bi bi-person-circle bi-top" style="font-size: 25px;"></i></a>
												</li>
												<li class="nav-item d-flex align-items-center">
												    <a class="nav-link top-logout" onclick="logout()">로그아웃 &nbsp;<i class="bi bi-box-arrow-right" style="font-size: 25px;"></i> </a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
			                     </div>  <!--  col -->           
			            	</div> <!--  row -->
			            	<!-- top 검색창 -->
			            	<div class="row">
								<div class="col d-none d-lg-flex justify-content-end px-4">
									<form class="search-box">
										<input class="search-txt align-items-center" type="text" name="keyword" placeholder="관심 주제, 클래스, 크리에이터">
										<button class="search-btn" type="button" ><i class="bi bi-search bi-top"></i></button>
									</form>
								</div>
							</div>   
	                    </div>
		            </div> <!-- row -->
	                

                    <!-- 로고와 햄버거 버튼 (작은 화면) -->
					<div class="row w-100 d-flex d-lg-none align-items-end">
	                    <div class="col-8 d-flex d-lg-none justify-content-start">
	                        <a class="navbar-brand" href="./">
	                            <img src="${pageContext.request.contextPath}/resources/img/class_will_logo.png" width="150px" alt="Logo" class="d-inline-block align-text-top">
	                        </a>
	                    </div>
	                    <div class="col-4 d-flex d-lg-none justify-content-end align-items-center mb-3 mx-0">
	                         <button class="navbar-toggler" type="button" id="mini-menu-toggle" >
		                        <span class="fa fa-bars text-white"></span>
		                    </button>
	                    </div>
					</div>
					
				</div> <!-- container-fluid -->
	        </nav>

			<!-- 미니 탑 메뉴창 -->
			<div class="mini-top-menu">
				<div class="mini-top-menu-header d-flex justify-content-between mb-3">
					<div class="">	 
                    	<c:choose>
							<c:when test="${empty member.member_email}">
								<a class="d-flex align-items-center" href="member-login"><i class="bi bi-person"></i>&nbsp;로그인<i class="bi bi-chevron-right" style="font-size: 13px;"></i></a>
							</c:when>
							<c:when test="${member.member_type eq 3}">
								<a class="" href="admin"><i class="bi bi-gear"></i> 관리자</a>&nbsp;
								<a class="top-logout" onclick="logout()"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
							</c:when>
							<c:otherwise>
								<a class="" href="my-page"><i class="bi bi-person-circle bi-top"></i> 내 정보</a>
								<a class="top-logout" onclick="logout()"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="">			
	                    <button type="button" class="btn-close text-reset " id="mini-top-close" aria-label="Close"></button>
	                </div>    
				</div>
				<div class="mini-top-menu-body px-3">
					<div>
	                    <h5 class="mb-3"><a class="" href="event">✨이벤트</a></h5>
	                    <h5 class="mb-2 d-flex align-items-center"><i class="bi bi-grid-fill" style="font-size: 15px;"></i>&nbsp;카테고리</h5>
                    	<div class="mx-4" id="mini-cate-field-area">
                    	</div><!-- mini-cate-field-area -->
	                    <h5 class="my-3 d-flex align-items-center"><i class="bi bi-geo-alt-fill"></i>&nbsp;지역별</h5>
	                    <div class="mx-4" id="mini-cate-local-area">
	                    </div><!-- mini-cate-local-area -->
					</div>
				</div> <!-- mini-top-menu-body -->
			</div><!-- mini-top-menu -->
	            
	    </div> <!-- top-cate -->
	</div> <!-- container-fluid -->
	<!-- Navbar End -->
	
	<!-- Search Box Area -->
	<div class="search-box-area container-fluid" id="searchModal">
	    <div class="modal-content">
	        <div class="modal-header">
	            <span class="close">&times;</span>
	        </div>
	        <div class="modal-body">
	            <form action="class-list" class="search-box d-flex justify-content-center" method="post">
	                <input class="search-txt align-items-center" id="keyword" type="text" name="keyword" placeholder="관심 주제, 클래스, 크리에이터">
	                <button class="search-btn" type="submit"> <i class="bi bi-search bi-top"></i></button>
	            </form>
	        </div>
	        <div class="recommend my-3 py-3 text-center container">
	            <!-- 추천 검색어 영역 -->
	            <h5 class="mb-3">추천 검색어</h5>
	            <div class="justify-content-center" id="recommend-area">
	            </div>
	        </div>
	    </div>
	</div>
				
	
	
	<div class="container-fluid">
		<!-- 분야 카테고리 -->
	    <div class="collapse collapse-category" id="collapse-category">
	        <div class="card card-body collapse-category">
	            <div class="container">
	                <div class="row" id="fieldCategoryArea">
	                <!-- 분야 카테고리 목록 ajax -->
	                </div><!-- row -->
	            </div>
	        </div>
	    </div>
		<!-- 지역 카테고리 -->
	    <div class="collapse collapse-category" id="collapse-zone">
			<div class="card card-body collapse-category">
		  		<div class="container">
					<div class="row" id="localCategoryArea">
						<!-- 지역 카테고리 목록 ajax -->
					</div><!-- row -->
				</div>
			</div>
		</div>
	</div>  
		
	<!-- 채팅창 모달 창 -->
	<div id="chatListModal" class="modal">
	    <div class="chat-modal-content">
	        <!-- 모달 창 안에 닫기 버튼 -->
	        <span id="chatModalClose">&times;</span>
	        <!-- 모달 창 내용 -->
	        <iframe id="chatListContent" width="100%" height="100%" frameborder="0"></iframe>
	    </div>
	</div>
	<div id="modalBackdrop" class="modal-backdrop"></div>
											
</div> <!-- class-will-top -->
<!-- top Navbar end -->

<script>
//=================================== top script start =====================================================
// 로그아웃 클릭
function logout() {
	if(confirm("로그아웃하시겠습니까?")) {
// 		let returnUrl = encodeURIComponent(window.location.href); 
// 		location.href = "member-logout?returnUrl=" + returnUrl;
		location.href = "member-logout";
	}
} 

// 채팅창 모달 닫는 함수
function closeChatModal() {
	$("#chatListModal").css("display", "none");
	$("#modalBackdrop").css("display", "none");
	$("body").css("overflow", "auto"); // 배경 스크롤 복구
}



$(function() {
	
	// 탑 분야 카테고리 
	$("#top-categoty").on("mouseover", function() {
		$.ajax({
			type: "GET",
	        url: "top-field-category",
		 	dataType : "json",
		 	contentType: "application/json",
		 	success : function(fieldCategory) {
		 		$("#fieldCategoryArea").html("");
			 	for(field of fieldCategory) {
// 			 		console.log("field.id : " + field.id);
// 			 		console.log("field.largeCategory : " + field.largeCategory);
			 		let fieldSmallAreaId = "fieldSmallArea"+field.id;
			 		
			 		$("#fieldCategoryArea").append(
						 ' <div class="col col-2 text-left">'
	                       + '<div>'
	                           + '<a href="class-list?class_big_category='+field.id+'"><span class="big-category mb-3">'+field.largeCategory+'</span></a>'
	                           + '<ul class="top-ul mt-3 mb-3" id="'+fieldSmallAreaId+'">'
	                           + '</ul>'
	                       + '</div>'
	                   + '</div>');
			 		
			 		for(children of field.children) {
// 			 			console.log("children.id : "+ children.id);
// 			 			console.log("children.largeCategory : "+children.largeCategory);
// 			 			console.log("children.smallCategory : "+children.smallCategory);
			 			 $("#" + fieldSmallAreaId).append('<li><a href="class-list?class_big_category='+field.id+'&class_small_category='+children.id+'">' + children.smallCategory + '</a></li>');
			 		
			 		}
			 	}
		 		
		 	},
		 	error: function(xhr, status, error) {
		        console.error("Error details:", xhr, status, error); // 디버깅 정보 출력
				
		        alert("오류 발생" + error);
		    }
			
		});
	
		
	}); // $("#top-categoty").on("mouseover", function() {}) 끝
	
	// 탑 지역 카테고리
	$("#top-local").on("mouseover", function() {
		$.ajax({
			type: "GET",
	        url: "top-local-category",
		 	dataType : "json",
		 	contentType: "application/json",
		 	success : function(localCategory) {
		 		$("#localCategoryArea").html("");
			 	for(local of localCategory) {
			 		console.log("local.local_name : " + local.local_name);
			 		console.log("local.local_code : " + local.local_code);
				 	$("#localCategoryArea").append(
				 		  '<div class="col col-2 text-left mb-3">'
						+ 	'<a href="class-list?common2_code='+ local.local_code + '"><span class="big-category">' + local.local_name + '</span></a>'
						+ '</div>'		
				 	);
			 	}
		 	},
		 	error: function(xhr, status, error) {
		        console.error("Error details:", xhr, status, error); // 디버깅 정보 출력
		        alert("오류 발생" + error);
		    }
		});
	
		
	}); // $("#top-local").on("mouseover", function() {}) 끝
	
	// ============================================================================================
    // 미니 탑 메뉴 
    $("#mini-menu-toggle").on("click", function() {
		// 미니 탑 메뉴 분야 카테고리 
		$.ajax({
			type: "GET",
	        url: "top-field-category",
		 	dataType : "json",
		 	contentType: "application/json",
		 	success : function(fieldCategory) {
		 		$("#mini-cate-field-area").html("");
			 	for(field of fieldCategory) {
// 			 		console.log("field.id : " + field.id);
// 			 		console.log("field.largeCategory : " + field.largeCategory);
			 		let miniSmallAreaId = "mini-cate-small-area"+field.id;
			 		
			 		$("#mini-cate-field-area").append(
					 		 '<div class="mini-cate-field">'
			            	+ 	 '<h5 class="mini-cate-big"><a href="class-list">'+field.largeCategory+'</a></h5>'
			            	+	 '<ul class="mini-cate-small-area" id="'+miniSmallAreaId+'"></ul>'
			            	+ '</div>'
			 		);
			 		for(children of field.children) {
// 			 			console.log("children.id : "+ children.id);
// 			 			console.log("children.largeCategory : "+children.largeCategory);
// 			 			console.log("children.smallCategory : "+children.smallCategory);
						$("#" + miniSmallAreaId).append('<li class="mini-cate-small"><a href="class-list?class_big_category='+field.id+'&class_small_category='+children.id+'">' + children.smallCategory + '</a></li>');
			 		}
			 	}
		 		
		 	},
		 	error: function(xhr, status, error) {
		        console.error("Error details:", xhr, status, error); // 디버깅 정보 출력
				
		        alert("mini-menu-toggle / top-field-category  오류 발생" + error);
		    }
			
		}); // ajax() 끝
		
		// 미니 탑 메뉴 지역 카테고리 
		$.ajax({
			type: "GET",
	        url: "top-local-category",
		 	dataType : "json",
		 	contentType: "application/json",
		 	success : function(localCategory) {
		 		$("#mini-cate-local-area").html("");
			 	for(local of localCategory) {
// 		 		console.log("local.local_name : " + local.local_name);
// 		 		console.log("local.local_code : " + local.local_code);
				 	$("#mini-cate-local-area").append(
	                    '<h5 class="mini-cate-local"><a href="class-list?common2_code='+ local.local_code + '">'+ local.local_name +'</a></h5>'
				 	);
			 	}
		 	},
		 	error: function(xhr, status, error) {
		        console.error("Error details:", xhr, status, error); // 디버깅 정보 출력
		        alert("mini-menu-toggle / top-local-category 오류 발생" + error);
		    }
		}); // ajax() 끝
		
		// 미니 탑 메뉴창 열기
		$(".mini-top-menu").toggle(); 
		
	}); //  $("#mini-menu-toggle").on("click", function() {}) 끝
    
    // 미니 탑 메뉴 닫기
    $("#mini-top-close").on("click", function() {
		$(".mini-top-menu").toggle();
	});
	
    // ====================================================================================================
	 // 검색창과 검색 버튼 클릭 시 #search-box-area 나타남
    $('.search-box, .search-txt, .search-btn, .search-btn2').on('click', function(event) {
        $('#searchModal').fadeIn();
        $("#keyword").focus();
        
        $.ajax({
        	type: "GET",
	        url: "recommend-keyword",
		 	dataType : "json",
		 	contentType: "application/json",
		 	success : function(keywordList) {
// 		 		console.log(keywordList);
		 		$("#recommend-area").html("");
		 		for(keyword of keywordList) {
		 			$("#recommend-area").append('<div class="btn recommend-keyword"><a href="#" class="recommend-link" data-keyword="' + keyword + '">' + keyword + '</a></div>');
		 		}
            	
		 	},
		 	error : function(xhr, status, error) {
		 		console.error("Error details:", xhr, status, error); // 디버깅 정보 출력
		        alert("recommend-keyword / ajax 오류 발생 : " + error);
		    }
        });
        
        
    });
    
    // 추천 키워드 클릭 시 해당 키워드로 검색됨
    $(document).on('click', '.recommend-link', function(event) {
    	 event.preventDefault(); // 기본 동작을 막습니다.
         let keyword = $(this).data('keyword');
         $("#keyword").val(keyword);
         $("form.search-box").submit();
    });
    

    // close 버튼 클릭 시 #search-box-area 사라짐
    $('.search-box-area .close').on('click', function() {
        $('#searchModal').fadeOut();
    });
	
    // ===================================================================================================
    // 카테고리, 지역 콜렙스 호버
	let collapseElements = $('#top-categoty, #top-local');

    let currentOpenCollapse = null;

    let openCollapse = (target) => {
        if (currentOpenCollapse && currentOpenCollapse !== target) {
            currentOpenCollapse.removeClass('show');
        }
        target.addClass('show');
        currentOpenCollapse = target;
    };

    let closeCollapse = (target) => {
        target.removeClass('show');
        if (currentOpenCollapse === target) {
            currentOpenCollapse = null;
        }
    };

    collapseElements.each(function() {
    	let elem = $(this);
    	let target = $(elem.attr('data-bs-target'));

        elem.on('mouseenter', () => openCollapse(target));
        target.on('mouseenter', () => openCollapse(target));
        target.on('mouseleave', () => closeCollapse(target));
    });
    	
    // ===================================================================================================
 	// 채팅 모달 창 열기
    $(".openChatModal").on("click", function(e) {
        e.preventDefault(); // 기본 동작 방지
        let member_code = "${sessionScope.member.member_code}";
        if(member_code == null || member_code == "") {
        	 alert("로그인이 필요한 페이지 입니다.");
        	 let returnUrl = encodeURIComponent(window.location.href); 
	         window.location.href = "member-login?returnUrl=" + returnUrl;
        } else {
	        $("#chatListContent").attr("src", "user-chat-list"); // 실제로 열고자 하는 URL로 변경
	        $("#chatListModal").css("display", "block");
	        $("#modalBackdrop").css("display", "block"); // 배경 표시
	        $("body").css("overflow", "hidden"); // 배경 스크롤 방지
        }
    });

    // 채팅 모달 창 닫기
    $("#chatModalClose").on("click", function() {
    	closeChatModal();
    });

    // 채팅 모달 외부를 클릭하면 모달 닫기
    $(window).on("click", function(event) {
        if (event.target == document.getElementById("modalBackdrop")) {
        	closeChatModal();
        }
    });
    
	
});


</script>

<%-- 로그인 상태일 경우에만 채팅 관련 스크립트를 클라이언트측에 전송 --%>
<c:if test="${not empty sessionScope.member}">

	<script type="text/javascript">
		$(function() {
			let member_email = "${sessionScope.member.member_email}";
			connect(); // 페이지 로딩 완료 시 채팅방 입장을 위해 웹소켓을 연결 호출
			checkUnreadMessages(); // 유저 로그인 시 읽지 않은 메시지 요청
		});
		
		let member_code = "${sessionScope.member.member_code}";
		let ws; // WebSocket 객체가 저장될 변수 선언
		
		var serverName = "${pageContext.request.serverName}";
	    var serverPort = "${pageContext.request.serverPort}";
	    var contextPath = "${pageContext.request.contextPath}";
	    
		function connect() {
			console.log("serverName: " + serverName);
        	console.log("serverPort: " + serverPort);
			console.log("contextPath: " + contextPath);

			let ws_base_url = "ws://" + serverName + ":" + serverPort + contextPath;
			console.log("ws_base_url : " + ws_base_url);
			
			ws = new WebSocket(ws_base_url + "/echo");
			
			ws.onopen = onOpen; // 웹소켓 요청에 대한 연결 성공 시
			ws.onclose = onClose; 
			ws.onmessage = onMessage;
			ws.onerror = onError;
		}
		
		function onOpen() {
			console.log("onOpen()");
		}
		
		function onClose(event) {
			console.log("onClose() - " + event);
		}
		
		function onError() {
			console.log("onError()");
		}
				
        function checkUnreadMessages() {
        	// setInterval() 함수를 호출하여 1초마다 웹소켓 연결 감지 후 연결이 됐을 때 초기화 메세지 전송
        	let startChatInterval = setInterval(() => {
        		// 웹소켓 연결 상태 체크
        		if(ws != null && ws.readyState === ws.OPEN) { // 웹소켓 연결 시
					console.log("ws.readyState : " + ws.readyState + ", ws.OPEN : " + ws.OPEN);
					// => ws.readyState : 1, ws.OPEN : 1
					console.log("1:1 채팅방 웹소켓 연결 완료");
					
					ws.send(JSON.stringify({
						message_type: "CHECK_UNREAD"
					}));
					
					// 메세지 전송 후 반복 인터벌 작업 종료 => clearInterval() 함수 활용(파라미터로 반복 인터벌 수행하는 함수 전달)
					clearInterval(startChatInterval);
				}
			}, 1000);
		
        }
		 
		// iFrame에서 받은 메시지 감지하여 처리
        $(window).on("message", function(event) {
            const data = event.originalEvent.data;
            console.log("-------------------------------"+JSON.stringify(data));
			ws.send(JSON.stringify(data));
        });
		
			
		function onMessage(event) {
			// 전송받은 메세지를 JSON 타입으로 파싱
			let data = JSON.parse(event.data); // string -> JSON 객체
			let iframe = $("#chatListContent")[0];
			console.log("onMessage() - 수신된 데이터 : " + JSON.stringify(data));
			
			if(data.message_type == "UNREAD_MESSAGE"){  
				alarmOn();
				
			} else if(data.message_type == "REQUEST_ROOM_LIST") {
				console.log("data.message_type == REQUEST_ROOM_LIST");
				iframe.contentWindow.postMessage(data, '*');
				
			} else if(data.message_type == "REQUEST_CHAT_LIST") { 
				console.log("data.message_type == REQUEST_CHAT_LIST");
				iframe.contentWindow.postMessage(data, '*');
				ws.send(JSON.stringify({
					message_type: "CHECK_UNREAD"
				}));
				
			} else if(data.message_type == "START") {
				console.log("data.message_type == START");
				iframe.contentWindow.postMessage(data, '*');
			
            } else if(data.message_type == "SEND_MESSAGE") {
            	console.log("data.message_type == SEND_MESSAGE");
				iframe.contentWindow.postMessage(data, '*');
            	
			} else if (data.message_type == "NEW_MESSAGE") {
                // 새로운 메시지 처리 및 알림 표시
				alarmOn();
                iframe.contentWindow.postMessage(data, '*');
                
			} else if(data.message_type == "READ_MESSAGE") {
				alarmOff();
            	
			} else if(data.message_type == "ERROR") {
				// 사용자에게 오류 메세지 표시 및 채팅 모달 닫기
            	alert(data.message);
            	closeChatModal();
			} else if(data.message_type == "INIT") {
				alarmOn();
				iframe.contentWindow.postMessage(data, '*');
			}
			
		}
		
		// 알림 업데이트 함수
        function updateAlarm() {
            if (unreadMsg > 0) {
            	alarmOn();
                
            } else {
            	alarmOff();
            }
        }
		
        function alarmOn() {
        	$('#openChatModal > i').after('<span class="position-absolute badge-position bg-danger border border-light rounded-circle alerts"></span>');
        	$('#openChatModal2 > i').after('<span class="position-absolute badge-position-bt bg-danger border border-light rounded-circle alerts"></span>');
        }
        
        function alarmOff() {
        	$('#openChatModal .alerts').remove();
        	$('#openChatModal2 .alerts').remove();
        }
       
       
 
        
        
	</script>

</c:if>



<!-- =================================== top script end ===================================================== -->