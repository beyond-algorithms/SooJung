package com.irang.service;

import com.irang.dto.LoginDTO;
import com.irang.dto.UserVO;

public interface UserService {
    
	// ȸ�� ���� ó��
	void register(UserVO userVO) throws Exception;
	
	// �α��� ó��
	UserVO login(LoginDTO loginDTO) throws Exception;
}
 