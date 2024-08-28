package com.zerock.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.ChatRoom;
import com.zerock.test.dto.ChatRoom4;
import com.zerock.test.mapper.ChatRoomMapper;

@Service
public class ChatRoomService {
	
	@Autowired
	private ChatRoomMapper chatRoomMapper;
	
	public List<ChatRoom> getAllRooms() {
		return chatRoomMapper.selectAllRooms();
	}
	public void createRoom(ChatRoom chatRoom) {
		chatRoomMapper.insertRoom(chatRoom);
	}
	public ChatRoom getRoomById(int room_id) {
		return chatRoomMapper.selectRoomById(room_id);
	}
	public List<ChatRoom4> searchRoom(int product_idx){
		return chatRoomMapper.searchRoom(product_idx);
	}
	public void insertchatRoom(ChatRoom4 chatRoom4) {
		chatRoomMapper.insertchatroom(chatRoom4);
	}
	public List<ChatRoom4> getRoom(String userid) {
		return chatRoomMapper.getRoom(userid);
	}
	public ChatRoom4 findChatRoomByParticipants(String sender,String seller_id,int product_idx) {
		return chatRoomMapper.findChatRoomByParticipants(sender, seller_id, product_idx);
	}
	public void deleteChatRoom(int room_id) {
		chatRoomMapper.deleteChatRoom(room_id);
	}
	public ChatRoom4 getroomdetail(int room_id) {
		return chatRoomMapper.getroomdetail(room_id);
	}
}
