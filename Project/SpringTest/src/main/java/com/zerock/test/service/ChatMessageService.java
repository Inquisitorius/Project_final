package com.zerock.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.Chat_message;
import com.zerock.test.mapper.ChatMessageMapper;
import com.zerock.test.mapper.ChatRoomMapper;

@Service
public class ChatMessageService {

	@Autowired
	private ChatMessageMapper chatMessageMapper;
	
	public void saveMessage(Chat_message chat_message) {
		chatMessageMapper.insertMessage(chat_message);
	}
	public List<Chat_message> getMessagesByRoom(int room_id) {
	return chatMessageMapper.selectMessagesByRoom(room_id);
}
}

