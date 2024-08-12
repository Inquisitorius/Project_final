package com.zerock.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.dto.ServerInfoDTO;
import com.zerock.test.mapper.AdminMapper;

@Service
public class AdminService {
	private final AdminMapper mapper;
	
	public AdminService(AdminMapper mapper)
	{
		this.mapper = mapper;
	}
	
	public List<AdminTestDTO> getAllTables()
	{
		return mapper.selectAll();
	}
	
	public List<ServerInfoDTO> Get_ServerInfo(int cnt)
	{
		return mapper.Get_ServerInfo(cnt);
	}
	
	public int ServerLogUpdate(List<ServerInfoDTO> list)
	{
		//야랄하지말고 싹다 가져온다음 ?		
		return mapper.ServerLogUpdate(list);
	}
	
}
