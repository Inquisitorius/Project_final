package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.AdminTestDTO;

public interface AdminMapper 
{
	List<AdminTestDTO> selectAll();
}
