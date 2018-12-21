package com.irang.service;

import java.util.List;

import com.irang.dto.BoardVO;

public interface HomeService {

	List<BoardVO> listAll() throws Exception;

}
