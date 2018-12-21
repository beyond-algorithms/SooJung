package com.irang.service;

import java.util.List;

import com.irang.commons.paging.Criteria;
import com.irang.dto.PlaceBoardVO;

public interface PlaceBoardService {
	
	List<PlaceBoardVO> listAll() throws Exception;
	
	List<PlaceBoardVO> listPaging(Criteria criteria) throws Exception;
	
	int countContents(Criteria criteria) throws Exception;

	List<PlaceBoardVO> listSearch(String searchItem) throws Exception;

	PlaceBoardVO read(Integer contentIdx) throws Exception;

}
