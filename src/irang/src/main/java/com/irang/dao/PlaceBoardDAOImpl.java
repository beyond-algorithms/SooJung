package com.irang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.irang.commons.paging.Criteria;
import com.irang.dto.PlaceBoardVO;

@Repository
public class PlaceBoardDAOImpl implements PlaceBoardDAO {
	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.irang.mapper.placeBoardMapper";
    
    @Override
    public List<PlaceBoardVO> listAll() throws Exception {
        
    	return sqlSession.selectList(Namespace+".listAll");
    }
    
    @Override
	public List<PlaceBoardVO> listPaging(Criteria criteria) throws Exception{
		
    	return sqlSession.selectList(Namespace + ".listPaging", criteria);
    };
    
    @Override
	public int countContents(Criteria criteria) throws Exception{
		
    	return sqlSession.selectOne(Namespace + ".countContents", criteria);
	};

	@Override
	public List<PlaceBoardVO> listSearch(String searchItem) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("searchItem", searchItem);

		return sqlSession.selectList(Namespace + ".listSearch", parameters);
	}

	@Override
	public PlaceBoardVO read(Integer contentIdx) throws Exception {
		
		return sqlSession.selectOne(Namespace+".read", contentIdx);
	}

}
