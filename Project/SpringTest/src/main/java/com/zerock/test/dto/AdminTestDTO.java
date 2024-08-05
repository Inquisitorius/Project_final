package com.zerock.test.dto;

public class AdminTestDTO 
{
	private int test_idx;	
	private String test_text;
	
	public AdminTestDTO()
	{
		
	}	
	
	public AdminTestDTO(int test_idx, String test_text) {
		super();
		this.test_idx = test_idx;
		this.test_text = test_text;
	}

	public int getTest_idx() {
		return test_idx;
	}
	public void setTest_idx(int test_idx) {
		this.test_idx = test_idx;
	}
	public String getTest_text() {
		return test_text;
	}
	public void setTest_text(String test_text) {
		this.test_text = test_text;
	}
	
	
}
