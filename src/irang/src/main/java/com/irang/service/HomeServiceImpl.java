package com.irang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.irang.dao.BoardDAO;
import com.irang.dto.BoardVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> listAll() throws Exception {

		return dao.listAll();
	}

}
