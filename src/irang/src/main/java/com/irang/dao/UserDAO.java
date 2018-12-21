package com.irang.dao;

import com.irang.dto.LoginDTO;
import com.irang.dto.UserVO;
 
public interface UserDAO {
    
	// ȸ������ ó��
	void register(UserVO userVO) throws Exception;
	
	// �α��� ó��
	UserVO login(LoginDTO loginDTO) throws Exception;
}
