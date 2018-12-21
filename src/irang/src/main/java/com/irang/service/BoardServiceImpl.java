package com.irang.service;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.irang.commons.paging.Criteria;
import com.irang.dao.BoardDAO;
import com.irang.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> listAll() throws Exception {

		return dao.listAll();
	}

	@Override
	public List<BoardVO> listPaging(Criteria criteria) throws Exception {
		
		return dao.listPaging(criteria);
	}

	@Override
	public int countContents(Criteria criteria) throws Exception {
		
		return dao.countContents(criteria);
	}

	@Override
	public List<BoardVO> categoryPaging(Criteria criteria, String board_category) throws Exception {
		
		return dao.categoryPaging(criteria, board_category);
	}

	@Override
	public int countCategoryContents(String board_category) throws Exception {
		
		return dao.countCategoryContents(board_category);
	}

	@Override
	public BoardVO read(Integer contentIdx) throws Exception {
		
		dao.updateViewCnt(contentIdx);
		return dao.read(contentIdx);
	}
	
	@Override
	public BoardVO readNext(Integer contentIdx) throws Exception {
		
		return dao.readNext(contentIdx);
	}

	@Override
	public BoardVO readPrev(Integer contentIdx) throws Exception {
		
		return dao.readPrev(contentIdx);
	}

	@Override
	public void create(BoardVO boardVO) throws Exception {

		Calendar cld = new GregorianCalendar();
		Date now = cld.getTime();
		boardVO.setBoard_datetime(now);
		boardVO.setBoard_content(boardVO.getBoard_content().replace("\r\n", "<br>"));
		dao.create(boardVO);
	}

	@Override
	public void update(Integer contentIdx, BoardVO boardVO) throws Exception {

		dao.update(contentIdx, boardVO);
	}

	@Override
	public void delete(Integer contentIdx) throws Exception {

		dao.delete(contentIdx);
	}

}
