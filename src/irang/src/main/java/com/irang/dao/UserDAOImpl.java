package com.irang.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.irang.dto.LoginDTO;
import com.irang.dto.UserVO;
 
@Repository
public class UserDAOImpl implements UserDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.irang.mapper.userMapper";

    // 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		
		sqlSession.insert(Namespace + ".register", userVO);
	}

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		
		return sqlSession.selectOne(Namespace + ".login", loginDTO);
	}
}