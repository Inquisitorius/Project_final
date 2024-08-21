package com.zerock.test.mapper;

import java.util.ArrayList;
import java.util.List;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.dto.ServerInfoDTO;
import com.zerock.test.dto.UserDTO;

public interface AdminMapper 
{
	List<AdminTestDTO> selectAll();
	int ServerLogUpdate(List<ServerInfoDTO> list);
	int ServerLogUpdate2(ServerInfoDTO dto);
	List<ServerInfoDTO> Get_ServerInfo(int cnt);
	List<UserDTO> GetUserList();
	int UpdateUserInfo_Admin(UserDTO dto);
	int DeleteUserInfo_Admin(UserDTO dto);
	int get_imgseqCurr();
	int saveImgName(String filePath);
	List<String> getImgNameList();
}
