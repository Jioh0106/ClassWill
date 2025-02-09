<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>클래스윌 비밀번호 찾기</title>
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

<!-- Icon Font Stylesheet -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<style type="text/css">
	
	body {
		background: black; 
	}
	
	article {
		margin: 0 auto;
		padding: 0 auto;
		color: white;
	}
	
	.reset-form {
		padding: 30px;
		margin-top: 50px;
		margin-bottom: 100px;
	}
	
	@media (min-width: 576px) {
		.reset-form {
			padding: 30px 100px;;
		}
	    
	}
	
	@media (min-width: 992px) {
		.reset-form {
			width: 600px;
		}
	    
	}
	
	.btnLogin {
		padding: 0px 11px;
	}
	
	.regex{ 
		font-size: 13px;
		color: white;
	}
	
	p {
		font-size: 15px;
	}
	
	fieldset {
		width: 300px;
		margin: auto;
	}
	
	#goLogin u {
		font-style: none;
		color: white;
	}
	
</style>
</head>
<body>
	<header>
       	<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
	</header>
	
	<article>
		<div class="container reset-form text-center">
			<form action="reset-passwd" method="POST">
				<div class="my-5">
					<h2>비밀번호 재설정</h2>
				</div>
				<p>새로운 비밀번호를 설정해 주세요.</p>
				<fieldset>
					<div class="login-form-input mb-3">
						<input type="hidden" value="${member_email}" name="member_email"> 
						<div class="input-group">
							<span class="input-group-text" id="passwd-icon"><i class="bi bi-lock-fill"></i></span>
							<input type="password" id="member_pwd" name="member_pwd" class="form-control" placeholder="비밀번호"  required maxlength="20">
                            <span class="input-group-text btn btn-light" id="togglePassword"><a><i class="bi bi-eye-slash" id="toggleIcon"></i></a></span>
						</div>
						<div class="regex py-2" id="regex-pwd"></div>
					</div>
					<div class="d-grid gap-2btnLogin">
						<input type="submit" id="btnSub" value="변경하기" class="btn btn-outline-light btn-lg">
					</div>
				</fieldset>
			</form>
			<div class="mt-3 mb-3" id="goLogin">
				<a href="member-login" class="text-center"><u>기존 비밀번호로 로그인하기</u></a>
			</div>
		</div>
	</article>

	<footer>
      	<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
	</footer>
	
	
    <!-- JavaScript Libraries -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script>
	
	
	    document.getElementById('togglePassword').addEventListener('click', function (e) {
	        const passwordInput = document.getElementById('member_pwd');
	        const toggleIcon = document.getElementById('toggleIcon');
	        if (passwordInput.type === 'password') {
	            passwordInput.type = 'text';
	            toggleIcon.classList.remove('bi-eye-slash');
	            toggleIcon.classList.add('bi-eye');
	        } else {
	            passwordInput.type = 'password';
	            toggleIcon.classList.remove('bi-eye');
	            toggleIcon.classList.add('bi-eye-slash');
	        }
	    });
		
	    $(function() {
			 // 비밀번호 정규표현식
			$("#member_pwd").on("input", function() {
			      let inputPwd = $(this).val();
			
			      let regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,16}$/;
			
			      if (!regex.test(inputPwd)) {
			          $("#regex-pwd").text("6자리 이상 영문자, 숫자, 특수문자를 입력하세요.");
			          $("#regex-pwd").css("color", "#FF4848");
			          $("#btnSub").prop("disabled", true);
			      } else {
			      	 $("#regex-pwd").text("");
			      	$("#btnSub").prop("disabled", false);
			      }
			  });
			 
			 
			
		});
		
	</script>
</body>
</html>