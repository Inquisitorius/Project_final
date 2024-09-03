package com.zerock.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zerock.test.dto.Chat_message;

@Mapper
public interface ChatMessageMapper {

	void insertMessage(Chat_message chat_message);
	List<Chat_message> selectMessagesByRoom(int room_id);

}	
