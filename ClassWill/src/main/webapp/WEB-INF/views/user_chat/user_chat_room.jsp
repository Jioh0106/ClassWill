<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>1:1 채팅방</title>

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
		background: #D5D5D5;
	}
	
	.user-chat {
		padding: 0;
		margin: 0 auto;
		height: 100vh;
		display: flex; 
		flex-direction: column;
	}
	
	.chat-room-top {
		font-size: 18px;
		font-weight: bold;
		height: 55px;
		padding: 10px 10px;
		border-bottom: 1px solid #A6A6A6;
		background: rgb(246, 246, 246);
		align-items: center;
	}
	
	.receiver_name_top{
		font-size: 16px;
	
	}
	
	.chat-top-icon {
		border: none;
		background: none;
	}
	
	#chat-room-content {
		flex: 1;
		padding: 15px;
		overflow-y: auto;
	}
	
	.chatDate {
		font-size: 12px;
		text-align: center;
	}

    .receiver_msg, .my_msg {
        font-size: 14px;
        border-radius: 15px;
        padding: 10px;
        display: inline-block;
        max-width: 60%;
        word-wrap: break-word;
        
    }

    .receiver_msg {
        text-align: left;
        background:  #4C4C4C;
        color: white;
    }

    .my_msg {
        text-align: right;
        background: #FFA7A7;
        align-self: flex-end;
    }

    .send-time {
    	font-size: 10px;
    	margin: 0px 10px;
    	align-self: flex-end;
    }
    
    .chat-room-text {
        height: 100px; 
        background: white;
        display: flex;
    	align-items: flex-end; 
    }
    
    #send-msg-input {
		height: 100%;
	    width: 100%;
	    border: none;
	    outline: none;
	    padding: 10px;
	    font-size: 15px;
    }
    
    .chat-icon-area {
    	height: 50px;
    	padding: 10px;
    	width: 	100%; 
    	
    }
    
    #msg-send-btn {
    	background: #FFA7A7;
    	font-size: 13px;
    }
	
	.receiver_img {
		width: 30px;
		height: 30px;
	}
	
	.msg-area {
		margin: 8px 0px;
	}
	
	.receiver_name {
		font-size: 13px;
		margin: 5px;
	}
	
	.chat-icon-btm {
		font-size: 18px;
	}
	
</style>


</head>
<body>
	
	<div class="user-chat container-fluid">
		<!-- 채팅방 상단 -->
		<div class="chat-room-top d-flex justify-content-between">
			<button class="chat-top-icon" id="to-chat-list"><i class="bi bi-chevron-left"></i></button>
			<span class="receiver_name_top">${receiverInfo.member_nickname}</span>
			<button class="chat-top-icon pe-5"><i class="bi bi-three-dots-vertical"></i></button>
		</div>
		
		<!-- 채팅 내역 -->
		<div class="d-flex flex-column" id="chat-room-content">
			<!-- 날짜 -->
<!-- 			<div class="d-flex flex-row justify-content-center"> -->
<!-- 				<span class="chatDate">2024년 7월 4일 목요일</span> -->
<!-- 			</div>	 -->
<!-- 		<!-- 주고 받은 메시지 -->		 
			
		</div>
		
		<!-- 메시지 입력창 -->
		<div class="chat-room-text d-flex flex-column">
			<input type="text" id="send-msg-input" class="d-flex flex-row" placeholder="메시지 보내기" onkeypress="checkEnter(event, this)">
			<div class="chat-icon-area flex-row d-flex justify-content-end">
<!-- 				<button type="button" class="btn chat-icon-btm p-0" id=""><i class="bi bi-paperclip"></i></button> -->
				<button type="button" class="btn" id="msg-send-btn"  onclick="send(this)" >전송</button>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
		let member_email = "${sessionScope.member.member_email}";
		let receiver_email = "${receiverInfo.member_email}";
		let receiver_img = "${receiverInfo.member_img}";
		let receiver_nickname = "${receiverInfo.member_nickname}";
		let chat_room_code;
		console.log("receiver_email : " + receiver_email);
		
		if(receiver_email != "") {
			const startMessage = {
					message_type: "INIT_COMPLETE",
					receiver_email : receiver_email
			};
			window.parent.postMessage(startMessage, '*');
		}
		
		
		function send(target) {
			let inputElement = $("#send-msg-input");
			let inputValue = $("#send-msg-input").val();
			console.log("inputValue : " + inputValue);
			
			// 입력 메세지가 비어있을 경우 작업 종료
			if(inputValue == "" || inputValue == null) {
				inputElement.focus();
				return;
			}
			
			const message = {
				message_type : "SEND_MESSAGE",
			    chat_room_code : chat_room_code,
			    sender_email : member_email,
			    receiver_email : receiver_email,
			    chat_message : inputValue
			};
			window.parent.postMessage(message, '*');
			
			// 채팅 입력창 초기화
			inputElement.val("");
			inputElement.focus();
			
		}
		
		function checkEnter(event, target) {
			console.log("checkEnter - event : " + event + ", target : " + target);
			// 누른 키의 코드값 가져오기
			let keyCode = event.keyCode;
			if(keyCode == 13) { // 엔터키 감지하여 send() 함수 호출
				send(target);
			}
		}
		
		function formatSendTime(send_time) {
		    // send_time에서 날짜 부분과 시간 부분 분리
		    var send_date = send_time.slice(0, 10);  // yyyy-mm-dd 부분 추출
		    var send_time_part = send_time.slice(11, 19);  // hh:mm:ss 부분 추출

	        // 시간 부분을 오전/오후 hh:mm 형식으로 변환
	        var hour = parseInt(send_time_part.slice(0, 2), 10);
	        var minute = send_time_part.slice(3, 5);
	        var period = (hour < 12) ? "오전" : "오후";
	        hour = (hour % 12) || 12;  // 0시를 12시로 변경

	        return period + " " + hour + ":" + minute;
		}
		
		function scrollToBottom() {
		    let chatContent = $("#chat-room-content");
		    chatContent.scrollTop(chatContent[0].scrollHeight);
		}

		
		$(function() {
			
			scrollToBottom(); 
			
			// 뒤로 가기 누르면 채팅 목록으로 가기
			$("#to-chat-list").on("click", function() {
				location.href = "user-chat-list";
			});
			
						
			// 부모창(top.jsp)으로부터 전송된 메시지 수신/처리 후 다시 보내기
			$(window).on("message", function(event) {
				const data = event.originalEvent.data;
				console.log("data : " + data);
				
				if(data.message_type == "REQUEST_CHAT_LIST") {
// 					$("#chat-room-content").remove();
					
					for(let msg of JSON.parse(data.chat_message)) {
						
						if(msg.sender_email == member_email) {
							$("#chat-room-content").append(
									 '<div class="d-flex flex-row justify-content-end msg-area">'
									+ 	 '<span class="send-time">'+ formatSendTime(msg.send_time) +'</span>'
									+ 	 '<span class="my_msg">'+ msg.chat_message +'</span>'
									+ '</div>'			 
							);
							scrollToBottom();
							
						} else {
							$("#chat-room-content").append(
									 '<div class="d-flex flex-row flex-column msg-area"> '
									+	 '<div class="d-flex flex-row mb-1"> '
									+		 '<img src="${pageContext.request.contextPath}/resources/upload/'+ receiver_img +'" class="receiver_img">'
									+		 '<span class="receiver_name">'+ receiver_nickname +'</span>'
									+	 '</div> '	
									+	 '<div class="d-flex flex-row"> '
									+		 '<span class="receiver_msg">'+ msg.chat_message +'</span> '
									+		 '<span class="send-time">'+ formatSendTime(msg.send_time) +'</span> '
									+	 '</div> '
									+ '</div> '		
							);
							scrollToBottom();
						}			
						
// 					    window.parent.postMessage(readMessage, '*');

					}
					
				    
				} else if(data.message_type == "START") {
					chat_room_code = data.chat_room_code;
					
				} else if(data.message_type == "SEND_MESSAGE") {
					if(data.sender_email == member_email) {
						$("#chat-room-content").append(
								 '<div class="d-flex flex-row justify-content-end msg-area">'
								+ 	 '<span class="send-time">'+ formatSendTime(data.send_time) +'</span>'
								+ 	 '<span class="my_msg">'+ data.chat_message +'</span>'
								+ '</div>'			 
						);
						scrollToBottom();
					}
					
			    } else if(data.message_type == "NEW_MESSAGE") {
					// 채팅방에 메세지 추가
					let parsedMessage = JSON.parse(data.chat_message);
					
					if(data.receiver_email == member_email) {
						$("#chat-room-content").append(
								 '<div class="d-flex flex-row flex-column msg-area"> '
								+	 '<div class="d-flex flex-row mb-1"> '
								+		 '<img src="${pageContext.request.contextPath}/resources/upload/'+ parsedMessage.member_img +'" class="receiver_img">'
								+		 '<span class="receiver_name">'+ parsedMessage.member_nickname +'</span>'
								+	 '</div> '	
								+	 '<div class="d-flex flex-row"> '
								+		 '<span class="receiver_msg">'+ parsedMessage.chat_message +'</span> '
								+		 '<span class="send-time">'+ formatSendTime(parsedMessage.send_time) +'</span> '
								+	 '</div> '
								+ '</div> '		
						);
						scrollToBottom();
						
					}
				    
				    const readMessage = {
				    	message_type: "READ_MESSAGE",
				        chat_room_code: parsedMessage.chat_room_code,
				        message_code: parsedMessage.message_code,
				        receiver_eamil : member_email
				    };
				    
				    window.parent.postMessage(readMessage, '*');
					
				} 
				
				
			});
			
			
			
		});
		
		
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