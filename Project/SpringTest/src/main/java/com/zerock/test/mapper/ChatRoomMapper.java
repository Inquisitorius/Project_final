package com.zerock.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zerock.test.dto.ChatRoom;

@Mapper
public interface ChatRoomMapper {
	List<ChatRoom> selectAllRooms();
	
    void insertRoom(ChatRoom chatRoom);
    
    ChatRoom selectRoomById(int room_id);
    
    void deleteRoom(int room_id);
    
    ChatRoom getRoomById(@Param("room_id") int roomId);
}
