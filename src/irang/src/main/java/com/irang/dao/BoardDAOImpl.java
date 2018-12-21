package com.irang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.irang.commons.paging.Criteria;
import com.irang.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.irang.mapper.boardMapper";

	@Override
	public List<BoardVO> listAll() throws Exception {

		return sqlSession.selectList(Namespace + ".listAll");
	}

	@Override
	public List<BoardVO> listPaging(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(Namespace + ".listPaging", criteria);
	}

	@Override
	public int countContents(Criteria criteria) throws Exception {
		
		return sqlSession.selectOne(Namespace + ".countContents", criteria);
	}
	
	@Override
	public List<BoardVO> categoryPaging(Criteria criteria, String board_category) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("board_category", board_category);
		parameters.put("criteria", criteria);
		
		return sqlSession.selectList(Namespace + ".categoryPaging", parameters);
	}

	@Override
	public int countCategoryContents(String board_category) throws Exception {
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("board_category", board_category);

		return sqlSession.selectOne(Namespace + ".countCategoryContents", parameters);
	}

	@Override
	public BoardVO read(Integer contentIdx) throws Exception {

		return sqlSession.selectOne(Namespace + ".read", contentIdx);
	}
	
	@Override
	public BoardVO readNext(Integer contentIdx) throws Exception {
		
		HashMap<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("contentIdx", contentIdx);

		return sqlSession.selectOne(Namespace + ".readNext", parameters);
	}
	
	@Override
	public BoardVO readPrev(Integer contentIdx) throws Exception {
		
		HashMap<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("contentIdx", contentIdx);
		
		return sqlSession.selectOne(Namespace + ".readPrev", parameters);
	}

	@Override
	public void create(BoardVO boardVO) throws Exception {

		sqlSession.insert(Namespace + ".create", boardVO);
	}

	@Override
	public void update(Integer contentIdx, BoardVO boardVO) throws Exception {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("contentIdx", contentIdx);
		parameters.put("boardVO", boardVO);

		sqlSession.update(Namespace + ".update", parameters);
	}

	@Override
	public void delete(Integer contentIdx) throws Exception {

		sqlSession.delete(Namespace + ".delete", contentIdx);
	}

	@Override
	public void updateViewCnt(Integer contentIdx) throws Exception {

		sqlSession.update(Namespace + ".updateViewCnt", contentIdx);
	}

}
