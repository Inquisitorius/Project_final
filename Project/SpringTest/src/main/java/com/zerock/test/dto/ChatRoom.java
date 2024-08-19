package com.zerock.test.dto;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;

@Slf4j	
public class ChatRoom {
	
	 private int room_id;
	 private String name;
	 
	public int getRoom_id() {
		return room_id;
	}
	public String getName() {
		return name;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
