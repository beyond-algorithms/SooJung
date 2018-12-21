package com.irang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.irang.commons.paging.Criteria;
import com.irang.dao.PlaceBoardDAO;
import com.irang.dto.PlaceBoardVO;

@Service
public class PlaceBoardServiceImpl implements PlaceBoardService {

    @Inject
    private PlaceBoardDAO dao;

	@Override
	public List<PlaceBoardVO> listAll() throws Exception {

		return dao.listAll();
	}

	@Override
	public List<PlaceBoardVO> listPaging(Criteria criteria) throws Exception{
		
		return dao.listPaging(criteria);
	};

	@Override
	public int countContents(Criteria criteria) throws Exception {
		return dao.countContents(criteria);
	}
	
	@Override
	public List<PlaceBoardVO> listSearch(String searchItem) throws Exception {

		return dao.listSearch(searchItem);
	}

	
	@Override
	public PlaceBoardVO read(Integer contentIdx) throws Exception {
		
		return dao.read(contentIdx);
	}


}
