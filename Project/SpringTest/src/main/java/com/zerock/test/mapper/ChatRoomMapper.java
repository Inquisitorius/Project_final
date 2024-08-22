package com.zerock.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zerock.test.dto.ChatRoom;
import com.zerock.test.dto.ChatRoom4;

@Mapper
public interface ChatRoomMapper {
	List<ChatRoom4> selectAllRooms();
	
    void insertRoom(ChatRoom chatRoom);
    
    ChatRoom selectRoomById(int room_id);
    
    void deleteRoom(int room_id);
    
    ChatRoom getRoomById(@Param("room_id") int roomId);
    
    List<ChatRoom4> searchRoom(int product_idx);
    
    void insertchatroom(ChatRoom4 chatRoom4);
}
