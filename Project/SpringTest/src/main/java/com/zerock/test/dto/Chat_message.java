package com.zerock.test.dto;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Setter
@Getter
@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Chat_message {
	   
		private int id;
	    private String messageType;
	    private int room_id;
	    private String sender;
	    private String message;
	    private Timestamp timestamp;
	   
	    
	    public String getMessageType() {
			return messageType;
		}
		public void setMessageType(String messageType) {
			this.messageType = messageType;
		}
		public int getRoom_id() {
			return room_id;
		}
		public void setRoom_id(int room_id) {
			this.room_id = room_id;
		}
		public String getSender() {
			return sender;
		}
		public void setSender(String sender) {
			this.sender = sender;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		
		
		@Override
		public String toString() {
			return "Chat_message [messageType=" + messageType + ", room_id=" + room_id + ", sender=" + sender
					+ ", message=" + message + "]";
		}

		
		
	}
	
	
