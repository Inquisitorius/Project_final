package com.zerock.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.zerock.test.dto.Chat_message;
import com.zerock.test.service.ChatMessageService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ChatController {
	private final ChatMessageService chatMessageService;
	private final SimpMessagingTemplate messagingTemplate;

	@Autowired
	public ChatController(ChatMessageService chatMessageService, SimpMessagingTemplate messagingTemplate) {
		this.chatMessageService = chatMessageService;
		this.messagingTemplate = messagingTemplate;
	}

	@MessageMapping("/chat/message")
	public void sendMessage(@RequestBody Chat_message chatMessage) {
		 
	    System.out.println("Message Type: " + chatMessage.getMessageType());
	    System.out.println("Room ID: " + chatMessage.getRoom_id());
	    System.out.println("Sender: " + chatMessage.getSender());
	    System.out.println("Message: " + chatMessage.getMessage());
		
	    if ("JOIN".equals(chatMessage.getMessageType())) {
	        chatMessage.setMessage(chatMessage.getSender() + "님이 입장하였습니다.");
	    } else if ("TALK".equals(chatMessage.getMessageType())) {
	        // For 'TALK' messageType or others, you might want to set a default message.
	        System.out.println("saveMessage : " + chatMessage.getMessage());
	        chatMessage.setMessage(chatMessage.getMessage());
	        chatMessage.setMessageType(chatMessage.getMessageType());
	        chatMessage.setRoom_id(chatMessage.getRoom_id());
	        chatMessage.setSender(chatMessage.getSender());
	    	chatMessageService.saveMessage(chatMessage);
	    } else {
	    		System.out.println("excpetion 오류 ");
	    }
	     
	    System.out.println("Send	ing message: " + chatMessage.getSender() + ", Message: " + chatMessage.getMessage());
	    log.info("chatmessage:sendmessage :" + chatMessage.getSender() + ", Message: " + chatMessage.getMessage());
	    
	    messagingTemplate.convertAndSend("/sub/chat/room/" + chatMessage.getRoom_id(), chatMessage);
	}
	
	/*
	 * String destination = "/sub/chat/rooms/" + chat_message.getRoom_id();
	 * chatMessageService.saveMessage(chat_message);
	 * messagingTemplate.convertAndSend(destination, chat_message);
	 */

	private boolean isJoin(Chat_message messageType) {
		return "JOIN".equals(messageType.getMessageType());
	}


	@GetMapping("/messages/{room_id}")
	@ResponseBody
    public List<Chat_message> getMessages(@PathVariable("room_id") int room_id) {
    	System.out.println("Fetching messages for room id: " + room_id);
    	log.info("fetching messageadsad: adsaddas" + room_id);
        List<Chat_message> messages = chatMessageService.getMessagesByRoom(room_id);
        log.info("fetching messageadsad: chatservaeqwd" + messages);
        System.out.println("Messages: " + messages);
        return messages;
    }


	@GetMapping("/chat1/{room_id}")
	public String getChatPage1(@PathVariable("room_id") int room_id, Model model) {
		// 방 ID를 모델에 추가하여 JSP 페이지로 전달
		model.addAttribute("currentRoomId", room_id);
		// 필요한 다른 데이터가 있으면 여기에 추가
		return "chat1"; // JSP 파일명
	}
}
