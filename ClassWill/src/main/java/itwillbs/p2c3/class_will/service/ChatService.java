package itwillbs.p2c3.class_will.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.class_will.mapper.ChatMapper;
import itwillbs.p2c3.class_will.vo.ChatMessageVO;
import itwillbs.p2c3.class_will.vo.ChatRoomVO;
import itwillbs.p2c3.class_will.vo.MemberVO;

@Service
public class ChatService {
	
	@Autowired
	private ChatMapper chatMapper;

	public MemberVO selectMemberInfo(int member_code) {
		return chatMapper.selectMemberInfo(member_code);
	}

	public ChatRoomVO selectChatRoom(String sender_email, String receiver_email) {
		return chatMapper.selectChatRoom(sender_email, receiver_email);
	}

	public void insertChatRoom(ChatRoomVO newChatRoom) {
		chatMapper.insertChatRoom(newChatRoom);
	}

	public void insertChatMessage(ChatMessageVO chatMessage) {
		chatMapper.insertChatMessage(chatMessage);
	}

	public String selectMemberEmail(String member_email) {
		return chatMapper.selectMemberEmail(member_email);
	}

	public void insertChatRoom(String sender_email, String receiver_email) {
		chatMapper.insertChatRoom(sender_email, receiver_email);
	}

	public List<Map<String, String>> getChatMessageList(int chat_room_code) {
		chatMapper.updateIsRead(chat_room_code, true); // 기존 채팅내역 불러올 때 전체 읽음 처리를 위해 트루
		return chatMapper.getChatMessageList(chat_room_code);
	}

	public List<Map<String, String>> selectUnreadMessage(String sender_email) {
		return chatMapper.selectUnreadMessage(sender_email);
	}

	public List<Map<String, String>> selectRoomList(String sender_email) {
		return chatMapper.selectRoomList(sender_email);
	}

	public Map<String, String> selectNewMessage(int message_code) {
		return chatMapper.selectNewMessage(message_code);
	}

//	public void updateIsRead(ChatMessageVO chatMessage) {
//		System.out.println("========================읽음표시");
//		chatMapper.updateIsRead(chatMessage, false);
//	}
	
	public void updateIsRead(int message_code) {
		System.out.println("========================읽음표시");
		chatMapper.updateIsRead(message_code, false); // 해당 채팅 단일 메세지만 읽음 처리 위해 false
	}
	
	

	
	
	
		

	
	
	
	
	
}
