<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>1:1 채팅 목록</title>

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
		background:#F6F6F6;
	}
	
	.user-chat {
		padding: 0;
		margin: 0 auto;
		height: 100vh;
		display: flex; 
		flex-direction: column;
	}

	.chat-List-top {
		font-size: 20px;
		font-weight: bold;
		height: 55px;
		padding: 10px 10px;
		border-bottom: 1px solid #A6A6A6;
		background:  #D5D5D5;
		align-items: center;
	}
	
	.chat-top-filter {
		font-size: 12px;
		border-radius: 20px;
		border: 1px solid gray;
		padding: 5px 10px;;
		margin-left: 10px;
	}
	
	#chat-close {
		font-size: 30px;
		color: gray;
		font-weight: bold;
	}
	
	#chat-list-content{
		overflow-y: auto;
	}
	
	.chat-list {
		height: 65px;
		border-bottom: 1px solid #A6A6A6;
		margin: 0;
		overflow: hidden;
		cursor: pointer;
		position: relative;
		flex-shrink: 0;
		
	}
	
	.receiver_img_area {
		padding: 0px;
		align-content:center;
		text-align:center;
	}
	
	.receiver_img {
		width: 40px;
		height: 40px;
	}
	
	.receiver_name {
		font-weight: bold;
		font-size: 15px;
	}
	
	.chat-list {
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.send-time-area {
		padding: 0 10px;
		text-align:right;
		
	}
	.send-time {
		color: gray;
		font-size: 12px;
	}
	
	.last_msg {
		font-size: 13px;
		text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
	    max-width: 100%;
	}
	
	
	.badge-position-chat {
		position: absolute; 
		top:43px; /* 위로 이동 */ 
		right: 40px; /* 오른쪽으로 이동 */ 
	    transform: translate(50%, -50%); /* 적절한 위치로 조정 */
	    display: flex;
	    align-items: center;
	    justify-content: center;
		font-size: 12px;
	}
	
</style>



</head>
<body>
	
	<div class="user-chat container-fluid">
		
		<div class="chat-List-top d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-center">
				<span class="px-2">채팅</span>
				<button class="btn btn-outline-dark chat-top-filter">전체</button>
				<button class="btn btn-outline-dark chat-top-filter">안 읽은 메시지</button>
			</div>
		</div>
		
		<div id="chat-list-content">
		
			<div class="d-flex justify-content-center m-5">채팅 내역이 존재하지 않습니다.</div>
			
		</div> <!-- chat-list-content -->

	</div> <!-- user-chat -->
	
	<script type="text/javascript">
		let member_email = "${sessionScope.member.member_email}";
		const listmessage = {
				message_type: "INIT"
		};
		window.parent.postMessage(listmessage, '*');
		
		
		$(function() {
			
			// 부모창(top.jsp)으로부터 전송된 메시지 수신/처리 후 다시 보내기
			$(window).on("message", function(event) {
				const data = event.originalEvent.data;
				console.log("data : " + data);
				
				if(data.message_type == "REQUEST_ROOM_LIST") {
					$("#chat-list-content").empty();
					for(let room of JSON.parse(data.chat_message)) {
					    $("#chat-list-content").append(
					    		'<div class="chat-list row room_code_'+ room.chat_room_code +'" onclick="location.href = \'user-chat-room?receiver_code=' + room.member_code + '\'">'
							+		'<div class="receiver_img_area col-2">'
							+			'<img src="${pageContext.request.contextPath}/resources/upload/'+ room.member_img +'" class="receiver_img">'
							+		'</div>'
							+		'<div class="d-flex flex-column col-7 p-0" >'
							+			'<span class="receiver_name d-flex flex-row">' + room.member_nickname +'</span>'
							+			'<span class="last_msg d-flex flex-row">' + room.chat_message + '</span>'
							+		'</div>'
							+		'<div class="send-time-area col-3 d-flex align-items-start justify-content-end">'
							+			'<span class="send-time">' + formatSendTime(room.send_time) + '</span>'
							+		'</div>'
							+	'</div>'			
					    );
					    if(room.unread_count != null) {
					    	$('.room_code_' + room.chat_room_code + ' .send-time').after(
							    		' <span class="position-absolute badge-position-chat badge rounded-pill bg-danger"> '
							+					room.unread_count+ '<span class="visually-hidden">unread messages</span>'
							+			'</span>' 
					    	);
					    	
					    }
					    
					}
					
				} else if(data.message_type == "INIT") { 
					let listmessage = {
							message_type: "INIT"
					};
					window.parent.postMessage(listmessage, '*');
				}
				
			});
			
			
		});
		
		function formatSendTime(send_time) {
		    // 현재 날짜 구하기 (로컬 시간 기준)
		    var today = new Date();
		    var today_date = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);

		    // send_time에서 날짜 부분과 시간 부분 분리
		    var send_date = send_time.slice(0, 10);  // yyyy-mm-dd 부분 추출
		    var send_time_part = send_time.slice(11, 19);  // hh:mm:ss 부분 추출

		    // 오늘 날짜와 비교
		    if (send_date !== today_date) {
		        // 오늘이 아닌 경우
		        return send_date;
		    } else {
		        // 오늘인 경우
		        // 시간 부분을 오전/오후 hh:mm 형식으로 변환
		        var hour = parseInt(send_time_part.slice(0, 2), 10);
		        var minute = send_time_part.slice(3, 5);
		        var period = (hour < 12) ? "오전" : "오후";
		        hour = (hour % 12) || 12;  // 0시를 12시로 변경

		        return period + " " + hour + ":" + minute;
		    }
		}

		
		
		
	
	</script>

	
    <!-- JavaScript Libraries -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
</body>
</html>