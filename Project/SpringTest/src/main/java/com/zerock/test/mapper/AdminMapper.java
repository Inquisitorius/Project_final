package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.dto.ServerInfoDTO;

public interface AdminMapper 
{
	List<AdminTestDTO> selectAll();
	int ServerLogUpdate(List<ServerInfoDTO> list);
	int ServerLogUpdate2(ServerInfoDTO dto);
}
