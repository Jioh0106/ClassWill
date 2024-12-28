package itwillbs.p2c3.class_will.handler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import itwillbs.p2c3.class_will.service.ChatService;
import itwillbs.p2c3.class_will.vo.ChatMessageVO;
import itwillbs.p2c3.class_will.vo.ChatRoomVO;
import itwillbs.p2c3.class_will.vo.MemberVO;

public class MyWebSocketHandler extends TextWebSocketHandler {
	// 클라이언트 정보 저장을 위한 Map 객체 생성
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	// --------------------------------------------------------------------------------------
	// 접속한 사용자의 HttpSession 객체의 세션 아이디와 WebSocketSession 아이디를 관리할 객체 생성
	// 사용자마다 갱신될 가능성이 있는 WebSocketSession 객체를 HttpSession 객체의 sId 에 연결하여
	// WebSocketSession 객체가 갱신되더라도 갱신된 정보를 세션 아이디를 통해 구별
	private Map<String, String> userSessions = new ConcurrentHashMap<String, String>();
	// => userSession 의 key 에 해당하는 value - users 의 key 와 연결됨
	//    users 의 key 에 해당하는 value 접근 시 해당 사용자의 WebSocketSession 객체에 접근하게됨
	// --------------------------------------------------------------------------------------
	private Gson gson = new Gson();
	// --------------------------------------------------------------------------------------
	
	@Autowired
	private ChatService chatService;
	
	// --------------------------------------------------------------------------------------
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 최초로 웹소켓 연결 시 WebSocket 객체가 생성되며, 이 때 자동으로 호출되는 메서드
		System.out.println("웹소켓 연결됨(afterConnectionEstablished)");
		
		// Map 객체(users)에 클라이언트 정보 저장
		users.put(session.getId(), session);
		System.out.println("클라이언트 목록(" + users.keySet().size() + "명) : " + users);
		
		// HttpSession 객체의 정보 확인을 위해 WebSocketSession 객체의 getAttributes() 메서드 호출
		System.out.println("세션(HttpSession) 아이디 : " + (MemberVO)session.getAttributes().get("member"));
		
		MemberVO member = (MemberVO)session.getAttributes().get("member");
		
		// Map 객체(userSession)에 사용자 정보 저장
		userSessions.put(member.getMember_email(), session.getId());
		System.out.println("사용자 목록(" + userSessions.keySet().size() + "명) : " + userSessions);
		
	} // afterConnectionEstablished()
	
	// ====================================================================================
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("수신된 메세지 : " + message.getPayload());
		
		// 수신된 메세지 변환
		ChatMessageVO chatMessage = gson.fromJson(message.getPayload(), ChatMessageVO.class);
		System.out.println("chatMessage : " + chatMessage);
		System.out.println("메세지 수신 시각 : " + getLocalDateTimeForNow());
		// ---------------------------------------------------------------------------------
		MemberVO member = (MemberVO)session.getAttributes().get("member");
		String sender_email = member.getMember_email();
		String receiver_email = chatMessage.getReceiver_email();
		System.out.println("송신자 : " + sender_email + ", 수신자 : " + receiver_email);
		
		// ChatMessage2 객체에 송신자 설정(HttpSession 객체의 세션 아이디 활용)
		chatMessage.setSender_email(sender_email);
		// ---------------------------------------------------------------------------------
		// 수신된 메세지 타입 판별
		
		
		if(chatMessage.getMessage_type().equals(ChatMessageVO.TYPE_CHECK_UNREAD)) {
			System.out.println("handleTextMessage - TYPE_CHECK_UNREAD 읽지 않은 메시지 확인 요청");
			
			boolean isUnreadMessage = chatService.selectUnreadMessage(sender_email)  == null ? false : true;
			if(isUnreadMessage) { // 읽지 않은 메시지가 있으면
				chatMessage.setMessage_type(ChatMessageVO.TYPE_READ_MESSAGE);
			} else {
				chatMessage.setMessage_type(ChatMessageVO.TYPE_UNREAD_MESSAGE);
			}
			sendMessage(session, chatMessage, true);
			
		
			
		} else if(chatMessage.getMessage_type().equals(ChatMessageVO.TYPE_INIT)) {
			System.out.println("handleTextMessage - TYPE_INIT 채팅방 리스트 요청");
			
			List<Map<String, String>> roomList = chatService.selectRoomList(sender_email);
			System.out.println("roomList ========== " + roomList);
			try {
				if(roomList.size() > 0) {
					chatMessage.setChat_message(gson.toJson(roomList));
					chatMessage.setMessage_type(ChatMessageVO.TYPE_REQUEST_ROOM_LIST);
					sendMessage(session, chatMessage, true);
				}
			} catch (Exception e) {
				System.out.println("채팅 내역 없음");
				e.printStackTrace();
			}
			
			
		} else if(chatMessage.getMessage_type().equals(ChatMessageVO.TYPE_INIT_COMPLETE)) {
			System.out.println("handleTextMessage - TYPE_INIT_COMPLETE 채팅방 정보 요청");
			
			if(!receiver_email.equals("")) {
				System.out.println("receiver_email (수신자) 있음!");
				
				boolean isConnectUser = userSessions.get(receiver_email) == null ? false : true;
				System.out.println("현재 접속 여부 : " + userSessions.get(receiver_email));
				boolean isExistUser = false;
				
				if(!isConnectUser) { // 현재 접속중인 상대방이 아닐 경우
					isExistUser = chatService.selectMemberEmail(receiver_email) == null ? false : true;
					System.out.println("receiver_email(수신자) 계정 정보 DB 존재 여부 : " + isExistUser);
					
					if(!isExistUser) { // DB 에도 상대방이 존재하지 않을 경우
						ChatMessageVO errorMessage = new ChatMessageVO(0, 0, ChatMessageVO.TYPE_ERROR, sender_email, receiver_email, "사용자가 존재하지 않습니다.", "", "");
						sendMessage(session, errorMessage, true);
						return; 	// 메세지 송신자에게 오류 메세지 전송 후 메서드 종료
					}
				}
				
				// 상대방이 존재할 경우 채팅방 조회
				ChatRoomVO chatRoom = chatService.selectChatRoom(sender_email, receiver_email);
				
				if(chatRoom == null) {
					System.out.println("채팅방 없음! - 새로운 채팅방 생성 필요!");
					// 새로운 채팅방 생성
					chatService.insertChatRoom(sender_email, receiver_email);
					chatRoom = chatService.selectChatRoom(sender_email, receiver_email);
					// 새로운 채팅방 정보 저장해서 새 채팅방에서 시작하기
					chatMessage.setChat_room_code(chatRoom.getChat_room_code());
					chatMessage.setMessage_type(ChatMessageVO.TYPE_START);
					sendMessage(session, chatMessage, true);
					
				} else {
					System.out.println("채팅방 있음! - 기존 채팅 내역 조회 요청됨");
					chatMessage.setChat_room_code(chatRoom.getChat_room_code());
					List<Map<String, String>> chatMessageList = chatService.getChatMessageList(chatRoom.getChat_room_code());
					
					// 기존 채팅 내역 판별
					if(chatMessageList.size() > 0) {
						// 기존 채팅 내역이 있으면 채팅 내용 리스트 보내기
						chatMessage.setChat_message(gson.toJson(chatMessageList));
						chatMessage.setMessage_type(ChatMessageVO.TYPE_REQUEST_CHAT_LIST);
						sendMessage(session, chatMessage, true);
					}
					
					// 기존 채팅 내역이 없으면 조회된 채팅방에서 시작하기
					chatMessage.setMessage_type(ChatMessageVO.TYPE_START);
					sendMessage(session, chatMessage, true);
					
				}
				
				
			} else {
				System.out.println("receiver_email (수신자) 없음!");
			}
				
		} else if(chatMessage.getMessage_type().equals(ChatMessageVO.TYPE_SEND_MESSAGE)) {
			System.out.println("TYPE_SEND_MESSAGE - 보낸 메세지 처리 : " + chatMessage);
			
			chatMessage.setSend_time(getLocalDateTimeForNow());
			chatMessage.setIs_read("false");
			
			chatService.insertChatMessage(chatMessage);
			sendMessage(session, chatMessage, true);
			
			System.out.println("수신자의 WebSocketSession 아이디 : " + userSessions.get(receiver_email));
			if(userSessions.get(receiver_email) != null) {
				WebSocketSession receiver_ws = users.get(userSessions.get(receiver_email));
				
				chatMessage.setMessage_type(ChatMessageVO.TYPE_NEW_MESSAGE);
				System.out.println("TYPE_NEW_MESSAGE : " + chatMessage);
				Map<String, String> receiveMessage = chatService.selectNewMessage(chatMessage.getMessage_code());
				System.out.println("receiveMessage : " + receiveMessage);
				chatMessage.setChat_message(gson.toJson(receiveMessage));
				// sendMessage() 메서드 호출하여 메세지 전송 요청(수신자에게 전송하도록 false 전달)
				sendMessage(receiver_ws, chatMessage, false);
				
				chatMessage.setMessage_type(ChatMessageVO.TYPE_INIT);
				sendMessage(receiver_ws, chatMessage, false);
				
				
			}
			
			
		} else if(chatMessage.getMessage_type().equals(ChatMessageVO.TYPE_READ_MESSAGE)) {
			System.out.println("TYPE_READ_MESSAGE -  읽은 메시지 처리 : " + chatMessage);
			chatService.updateIsRead(chatMessage.getMessage_code());
			
			boolean isUnreadMessage = chatService.selectUnreadMessage(sender_email)  == null ? false : true;
			if(isUnreadMessage) { // 읽지 않은 메시지가 있으면
				chatMessage.setMessage_type(ChatMessageVO.TYPE_READ_MESSAGE);
			} else {
				chatMessage.setMessage_type(ChatMessageVO.TYPE_UNREAD_MESSAGE);
			}
			sendMessage(session, chatMessage, true);
			
		}
		
		
		
		
		
	} // handleTextMessage()
	
	
	// ====================================================================================
	// 현재 시스템 시각 정보를 "yyyy-MM-dd HH:mm:ss" 형식의 문자열로 리턴하는 메서드 정의
	private String getLocalDateTimeForNow() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return LocalDateTime.now().format(dtf);
	}
	
	// ====================================================================================
	// 각 웹소켓 세션(사용자)들에게 메세지를 전송하는 메서드 정의
	public void sendMessage(WebSocketSession session, ChatMessageVO chatMessage, boolean isToSender) throws Exception {
		// 클라이언트 목록이 저장된 Map 객체(users)에 저장되어 있는 모든 세션에게 수신된 메세지 전송
		// => Map 객체의 WebSocketSession 객체를 반복문을 통해 얻기 위해
		//    Map 객체의 values() 메서드 호출하면 Map 객체의 모든 WebSocketSession 객체를 얻을 수 있으며
		//    각각의 WebSocketSession 객체의 sendMessage() 메서드 호출하여 각 세션에 메세지 전송 가능
//			System.out.println(users.values());
		// WebSocketSession 객체의 sendMessage() 메서드를 호출하여 메세지 전송
		if(isToSender) { // 송신자에게 전송하는 메세지
			session.sendMessage(new TextMessage(gson.toJson(chatMessage)));
		} else { // 수신자에게 전송하는 메세지
//			for(WebSocketSession ws : users.values()) {}
			session.sendMessage(new TextMessage(gson.toJson(chatMessage)));
		}
	}
	
	// ====================================================================================
	// WebSocketSession 객체에서 HttpSession 객체에 저장된 세션 아이디를 문자열로 리턴하는 메서드 정의
	public String getSessionId(WebSocketSession session) {
		MemberVO member = (MemberVO)session.getAttributes().get("member");
		return member.getMember_email();
	}
	
	// ====================================================================================
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("웹소켓 연결 해제됨(afterConnectionClosed)");
		
		// 웹소켓 연결 해제 시 호출되는 메서드에서는
		// 클라이언트 정보 저장된 Map 객체(users) 내에서 종료 요청이 발생한 웹소켓 세션 객체 제거
		// => Map 객체의 remove() 메서드 호출하여 전달받은 세션 객체의 세션 아이디를 키로 지정
		users.remove(session.getId());
		System.out.println("클라이언트 목록(" + users.keySet().size() + "명) : " + users);
		
		// 사용자 정보 저장된 Map 객체(userSessions) 내에서 
		// 종료 요청이 발생한 웹소켓의 세션 아이디 제거(HttpSession 의 세션 아이디는 유지)
		userSessions.put(getSessionId(session), "");
		System.out.println("사용자 목록(" + userSessions.keySet().size() + "명) : " + userSessions);
	}
	
	// ====================================================================================
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("웹소켓 전송 오류 발생(handleTransportError)");
	}
	
	
	
	
	
}




