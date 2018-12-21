package com.irang.service;

import java.util.List;

import com.irang.commons.paging.Criteria;
import com.irang.dto.BoardVO;

public interface BoardService {

	List<BoardVO> listAll() throws Exception;

	List<BoardVO> listPaging(Criteria criteria) throws Exception;

	int countContents(Criteria criteria) throws Exception;

	List<BoardVO> categoryPaging(Criteria criteria, String board_category) throws Exception;

	int countCategoryContents(String board_category) throws Exception;

	BoardVO read(Integer contentIdx) throws Exception;
	
	BoardVO readNext(Integer contentIdx) throws Exception;
	
	BoardVO readPrev(Integer contentIdx) throws Exception;

	void create(BoardVO boardVO) throws Exception;

	void update(Integer contentIdx, BoardVO boardVO) throws Exception;

	void delete(Integer contentIdx) throws Exception;
}
