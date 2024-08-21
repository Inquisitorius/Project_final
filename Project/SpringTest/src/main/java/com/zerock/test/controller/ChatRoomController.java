package com.zerock.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.test.dto.ChatRoom;
import com.zerock.test.service.ChatRoomService;

@Controller
public class ChatRoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@GetMapping("/chat/rooms")
	public String getAllRooms(Model model) {
		List<ChatRoom> rooms = chatRoomService.getAllRooms();
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
	
	/*
	 * @PostMapping("/chat/room1") public List<ChatRoom> createroom2() {
	 * 
	 * }
	 */
	
	 @GetMapping("/chat/room/{room_id}")
	 @ResponseBody
	    public ChatRoom getRoomById(@PathVariable("room_id") int room_id) {
	        return chatRoomService.getRoomById(room_id);
	    } 
	 
	
}
