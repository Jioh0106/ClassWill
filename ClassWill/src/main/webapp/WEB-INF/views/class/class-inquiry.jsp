<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/creator/creator-review-form.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<style>
.custom-confirm-button {
    background-color: #1E90FF !important; /* 예 버튼 색상 */
    color: #fff !important;
}
.custom-cancel-button {
    background-color: #FF4500 !important; /* 아니요 버튼 색상 */
    color: #fff !important;
}
</style>
</head>
<body>
		<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">클래스문의</h4>
					<div>
<%-- 						<p>🔸참여클래스 : ${classInquiryInfo.class_name}</p> --%>
<%-- 						<p>🔸작성자 : ${classInquiryInfo.member_nickname}</p> --%>
					</div>
					<form id="inquiryForm">
						<div class="mb-3">
							<label for="inquiry-subject">제목</label>
							<input type="text" name="class_inquiry_subject" id="inquiry-subject" class="form-control" required> 
	<!-- 						<input type="text" name="inquiry-subject" id="inquiry-subject" class="form-control">  -->
						</div>
						<div class="mb-3">
							<label for=inquiry-content>내용</label>
							<textarea rows="10"  name="class_inquiry_content" id="inquiry-content" class="form-control" cols="50" required> 
							</textarea> 
						</div>
						<hr class="mb-4">
							<input type="hidden" name="class_code" id="class-code-input" value="${classInquiryInfo.class_code}"> <!-- hidden input으로 class_code 전달 -->
							<input type="hidden" name="member_code" id="member-code-input" value="${member_code}">
						
						<div class="mb-4 creator-inquiry-form-btn writeInquiry" align="center">
							<input type="button" value="작성하기" onclick="submitInquiryForm(event, '${classInquiryInfo.class_code}')" class="btn btn-primary btn-lg btn-block">
							<input type="button" value="돌아가기" class="btn btn-primary btn-lg btn-block" onclick="window.close()">
						</div>
						
					</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; WillClass</p>
		</footer>
	</div>
	
	<script type="text/javascript">
	
	function submitInquiryForm(event, class_code) {
		
	    event.preventDefault();
	    
	    const form = document.getElementById('inquiryForm');
	    
	    const formData = new FormData(form);
	    
	    // class_inquiry_subject 값 콘솔에 출력
	    const classInquirySubject = formData.get('class_inquiry_subject');
	    const classInquiryContent = formData.get('class_inquiry_content');
	    console.log("class_inquiry_subject:", classInquirySubject); 
	    console.log("class_inquiry_content:", classInquiryContent); 

	    // class_code 추가
	    formData.append('class_code', class_code);
	    
	    console.log("FormData:", formData); // formData에 데이터가 올바르게 추가되었는지 확인
	    console.log("class_code:", class_code); // formData에 데이터가 올바르게 추가되었는지 확인
	    
	    // 폼 데이터의 유효성 검사
	    if (!classInquirySubject || !classInquiryContent) {
	        Swal.fire('알림', '문의 제목과 내용을 모두 입력해주세요.', 'warning');
	        return; // 함수 종료
	    }
	    
	    fetch('submit-inquiry', {
	        method: 'POST',
	        body: formData
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error('Network response was not ok');
	        }
	        return response.json();
	    })
	    .then(data => {
	        if (data.success) {
	            // 성공적으로 데이터가 처리된 후 화면을 업데이트
	            updateUIWithSuccessMessage(data.message);
	        } else {
	            // 오류 발생 시 오류 메시지 표시
	            Swal.fire('오류', '문의 제출 중 오류가 발생했습니다.', 'error');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        Swal.fire('오류', '서버 요청 중 오류가 발생했습니다.', 'error');
	    });
	}
	
	function updateUIWithSuccessMessage(message) {
	    Swal.fire('성공', message, 'success')
	        .then(() => {
	            // 창을 닫고 페이지를 리로드
	            window.close();
	            window.opener.location.reload();
	        });
	}
	</script>

</body>
</html>