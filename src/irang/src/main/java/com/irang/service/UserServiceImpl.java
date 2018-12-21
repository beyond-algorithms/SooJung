package com.irang.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.irang.dao.UserDAO;
import com.irang.dto.LoginDTO;
import com.irang.dto.UserVO;
 
@Service
public class UserServiceImpl implements UserService {
 
    @Inject
    private UserDAO dao;

	@Override
	public void register(UserVO userVO) throws Exception {
		
		dao.register(userVO);
	}

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		
		return dao.login(loginDTO);
	}
}
