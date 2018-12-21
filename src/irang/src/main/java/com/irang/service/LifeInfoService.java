package com.irang.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.irang.dto.CultureBoardVO;
import com.irang.dto.CultureDetailVO;

public interface LifeInfoService {
	
	ArrayList<CultureBoardVO> viewCultureList(String page) throws IOException;
	
	CultureDetailVO viewCultureDetail(String seq) throws IOException;
	
	Object getFsn(String areaNo) throws Exception;
	
	Object getUltrvLifeList(String areaNo) throws Exception;
	
	Object getSensorytemLifeList(String areaNo) throws Exception;
	
	Object getFineDust(String area) throws Exception;
	
	Object getUltraFineDust(String area) throws Exception;
	
	HashMap<String, String> getCurTemperature(String area) throws Exception;
	
	String getTodayDate();
}
