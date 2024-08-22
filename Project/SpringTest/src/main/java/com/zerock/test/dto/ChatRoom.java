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
	/*
	room_id number PRIMARY key ,
	room_name varchar2(255) NULL,
	seller VARCHAR2(255) NOT NULL,
	sender varchar(255),
	room_status varchar2(50) 
	
	private int room_id ;
	private String room_name;
	private String seller;
	private String sender;
	private String room_status;
	
	CREATE TABLE chat_rooms (
	room_id number PRIMARY key ,
	room_name varchar2(255) NULL,
	seller VARCHAR2(255) NOT NULL,
	sender varchar(255),
	room_status varchar2(50) check(room_status IN ('활성화','비활성화'),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY seller 
	references products(products_seller),
	FOREIGN KEY sender
	REFERENCES userinfo(id)
);
	*/
}
