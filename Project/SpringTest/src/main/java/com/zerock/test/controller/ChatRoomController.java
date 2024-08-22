package com.zerock.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.test.dto.ChatRoom;
import com.zerock.test.dto.ChatRoom4;
import com.zerock.test.service.ChatRoomService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatRoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@GetMapping("/chat/rooms")
	public String getAllRooms(Model model) {
		List<ChatRoom4> rooms = chatRoomService.getAllRooms();
		model.addAttribute("rooms",rooms);
		return "chat";
	}
	
	@PostMapping("/chat/room")
	public String createRoom(@RequestParam("room_id") int room_id, @RequestParam("name") String name) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoom_id(room_id);
		chatRoom.setName(name);
		chatRoomService.createRoom(chatRoom);
		return "redirect:chat";
	}
	
	@PostMapping("/chat/room1") 
	@ResponseBody
	public String createroom2(@RequestBody String room_name,@RequestBody int product_idx,
			@RequestBody String sender,@RequestBody String product_seller) {
	ChatRoom4 chatRoom = new ChatRoom4();
	chatRoom.setRoom_name(room_name);
	chatRoom.setProduct_idx(product_idx);
	chatRoom.setSender(sender);
	chatRoom.setProduct_seller(product_seller);
	 
	 System.out.println("chatroom4 : " +room_name);
	 System.out.println("chatroom4 : " +product_idx);
	 System.out.println("chatroom4 : " +sender);
	 System.out.println("chatroom4 : " +product_seller);
	 
	 log.info("chatroom4 : " +room_name);
	 log.info("chatroom4 : " +product_idx);
	 log.info("chatroom4 : " +sender);
	 log.info("chatroom4 : " +product_seller);
	 
	 return "redirect:chat";
	}
	 
	 @GetMapping("/chat/room/{room_id}")
	 @ResponseBody
	    public ChatRoom getRoomById(@PathVariable("room_id") int room_id) {
	        return chatRoomService.getRoomById(room_id);
	    } 
}
