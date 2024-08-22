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
	
	public List<ChatRoom4> getAllRooms() {
		return chatRoomMapper.selectAllRooms();
	}
	public void createRoom(ChatRoom chatRoom) {
		chatRoomMapper.insertRoom(chatRoom);
	}
	public ChatRoom getRoomById(int room_id) {
		return chatRoomMapper.selectRoomById(room_id);
	}
	public void deleteRoom(int room_id) {
		chatRoomMapper.deleteRoom(room_id);
	}
	public List<ChatRoom4> searchRoom(int product_idx){
		return chatRoomMapper.searchRoom(product_idx);
	}
	public void insertchatRoom(ChatRoom4 chatRoom4) {
		chatRoomMapper.insertchatroom(chatRoom4);
	}
}
