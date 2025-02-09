<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스윌 공지사항</title>
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

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	
	body {
		background: black; 
	}
	
	article {
		margin: 0 auto;
		padding: 0 auto;
		color: white;
	}
	
	.privacy_info {
		width: 1200px;
		padding: 50px;
	}
	
	h5  {
		color: #747d88;
	}
	
	

</style>
</head>
<body>
	<header>
       	<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
	</header>
	
	<article>
		<div class="container privacy_info">
			<h3>개인 정보 처리 방침</h3>
			<br>
			<h4>클래스윌 개인정보 처리방침</h4>
			<br>
			<p>클래스윌은 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.</p>
			
			<h5>제1조(개인정보의 처리목적)</h5>
			<p>클래스윌은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</p>
			
			1. 홈페이지 회원 가입 및 관리<br>
			회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다.<br>
			<br>
			2. 재화 또는 서비스 제공<br>
			물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다.<br>
			<br>
			3. 고충처리<br>
			민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.<br>
			<br>
			4. 이벤트<br>
			클래스윌에서 자체 진행하는 이벤트를 위해 개인정보를 이벤트에서 정한 기간동안에 한하여 개인정보를 처리합니다.<br>
			<br>
			
			<h5>제2조(개인정보의 처리 및 보유기간)</h5>
			
			<p>① 클래스윌은 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.</p>
			
			<p>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>
			
			1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지<br>
			다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>
			1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지<br>
			2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br>
			<br>
			2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지<br>
			다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지<br>
			1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록<br>
			- 표시․광고에 관한 기록 : 6월<br>
			- 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년<br>
			- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년<br>
			2)「통신비밀보호법」제41조에 따른 통신사실확인자료 보관<br>
			- 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년<br>
			- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월<br>
			<br>
			3. 이벤트 진행 및 이벤트 당첨 상품 안내 : 이벤트에서 정한 기간 동안<br>
			다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>
			1) 이벤트 상품 수령 응답을 하지 않은 경우 (당첨 안내 1달 이후에도 미응답시 미당첨 처리)<br>
			<br>
			
			<h5>제3조(개인정보의 제3자 제공) </h5>
			
			<P>① 클래스윌은 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
			
			<h5>제4조(개인정보처리의 위탁)</h5>
			
			<P>① 현재 개인정보 위탁처리 중이지 않습니다.</p>
			
			<p>② 클래스윌은 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p>
			<p>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
			
			<h5>제5조(정보주체의 권리․의무 및 행사방법)</h5>
			
			<p> ① 정보주체는 클래스윌에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
			1. 개인정보 열람요구<br>
			2. 오류 등이 있을 경우 정정 요구<br>
			3. 삭제요구<br>
			4. 처리정지 요구<br>
			<p>② 제1항에 따른 권리 행사는 클래스윌에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 클래스윌은 이에 대해 지체없이 조치하겠습니다.</p>
			<p>③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 클래스윌은 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p>
			<p>④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
			<p>⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 클래스윌이 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.</p>
			
			<h5>제6조(처리하는 개인정보 항목) 클래스윌은 다음의 개인정보 항목을 처리하고 있습니다.</h5>
			
			1. 홈페이지 회원 가입 및 관리<br>
			․필수항목 : 성명, 아이디, 비밀번호, 이메일주소<br>
			<br>
			2. 재화 또는 서비스 제공<br>
			․필수항목 : 성명, 아이디, 비밀번호, 이메일주소,<br>
			․선택항목 : 관심분야, 과거 신청내역<br>
			<br>
			3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br>
			․IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등<br>
			<br>
			
			<h5>제7조(개인정보의 파기)</h5> 
			
			<p>① 클래스윌은 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</p>
			<p>② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</p>
			<p>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.</p>
			1. 파기절차<br>
			클래스윌은 파기 사유가 발생한 개인정보를 선정하고, 클래스윌의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
			2. 파기방법<br>
			클래스윌은 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
			<br>
			
			<h5>제8조(개인정보의 안전성 확보조치)</h5> 
			
			<p>클래스윌은 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</p>
			1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등<br>
			2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치<br>
			3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제<br>
			<br>
			
			<h5>제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</h5>
			
			<p> ① 회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.</p>
			<p>② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</p>
			가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>
			나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>
			다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
			<br>
			
			<h5>제10조(개인정보 보호책임자)</h5>
			
			<p> ① 클래스윌은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
			
			▶ 개인정보 보호책임자<br>
			성명 : 김부기<br>
			직책 : 대표<br>
			연락처 : 051-803-0909, Eamil : boogimovie@gmail.com<br>
			※ 개인정보 보호 담당부서로 연결됩니다.<br>
			<br>
			▶ 개인정보 보호 담당자<br>
			성명 : 김부기<br>
			직책 : 대표<br>
			연락처 : 010-2553-1705, Eamil : hello-admin@mochaclass.com<br>
			<br>
			
			<p>② 정보주체께서는 클래스윌의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 클래스윌은 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.
			
			<h5>제11조(개인정보 열람청구)</h5> 
			
			<p>정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 클래스윌은 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.</p>
			
			▶ 개인정보 열람청구 접수․처리 부서<br>
			부서명 : 개발팀<br>
			담당자 : 김부기<br>
			연락처 : 051-803-0909, Eamil : boogimovie@gmail.com<br>
			<br>
			
			<h5>제12조(권익침해 구제방법) 정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.</h5>
			
			<p>[아래의 기관은 클래스윌와는 별개의 기관으로서, 클래스윌의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.]</p>
			
			▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)<br>
			- 소관업무 : 개인정보 침해사실 신고, 상담 신청<br>
			- 홈페이지 : privacy.kisa.or.kr<br>
			- 전화 : (국번없이) 118<br>
			- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터<br>
			
			<br>▶ 개인정보 분쟁조정위원회<br>p>
			- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>
			- 홈페이지 : www.kopico.go.kr<br>
			- 전화 : (국번없이) 1833-6972<br>
			- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층<br>
			<br>
			▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)<br>
			<br>
			<p>▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)</p>
			
			<h5>제13조(영상정보처리기기 설치․운영)</h5>
			<p>① 클래스윌 은(는) 영상정보처리기기를 설치․운영하고 있지 않습니다.</p>
			
			<h5>제14조(개인정보 처리방침 변경)</h5>
			<p>① 이 개인정보 처리방침은 2020. 2. 6부터 적용됩니다.</p>
			<p>② 이벤트 내용 추가 - 2020. 9. 6 부터 적용 (1조 4항, 2조 3항)</p>
		
		</div>
	</article>

	<footer>
      	<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
	</footer>
</body>
</html>