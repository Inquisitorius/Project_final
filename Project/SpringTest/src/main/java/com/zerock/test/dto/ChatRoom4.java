package com.zerock.test.dto;

import java.sql.Timestamp;

public class ChatRoom4 {
	
	private int room_id;
	private String room_name;
	private int product_idx;
	private String product_seller;
	private String sender;
	private String room_stauts;
	private Timestamp created_at;
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRoom_stauts() {
		return room_stauts;
	}
	public void setRoom_stauts(String room_stauts) {
		this.room_stauts = room_stauts;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public String getProduct_seller() {
		return product_seller;
	}
	public void setProduct_seller(String product_seller) {
		this.product_seller = product_seller;
	}
	
	
}
