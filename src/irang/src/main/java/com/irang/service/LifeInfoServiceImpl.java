package com.irang.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.irang.dto.CultureBoardVO;
import com.irang.dto.CultureDetailVO;

@Service
public class LifeInfoServiceImpl implements LifeInfoService {

	String serviceKey = "TXDDnvRPBkvVeaXE7sB3LcFX0YgEhaHRIlpbhdG5SC9S0Z1yG7pVr2AIjMXxYgTEUL3FgioNDfz7SgURU2PzRg%3D%3D";
	String waqiToken = "050bfd3c152790775310575657fc8f9db738a186";
	String openWhetherMapServicyKey = "2f6e39a89412479621cb1cf2a227d004";

	// 공연전시정보 api 리스트 조회
	@Override
	public ArrayList<CultureBoardVO> viewCultureList(String page) throws IOException {

		ArrayList<CultureBoardVO> cultureBoardList = new ArrayList<CultureBoardVO>();

		Calendar cld = new GregorianCalendar();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String today = date.format(cld.getTime());
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, +1);
		String nextMonth = date.format(cal.getTime());

		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?serviceKey=" + serviceKey
				+ "&sortStdr=1&from=" + today + "&to=" + nextMonth + "&cPage=" + page + "&rows=15";

		try {

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document xml = documentBuilder.parse(url);

			Element element = xml.getDocumentElement();
			NodeList list = element.getElementsByTagName("perforList");

			for (int i = 0; i < list.getLength(); i++) {
				CultureBoardVO cultureBoard = new CultureBoardVO();
				NodeList list2 = list.item(i).getChildNodes();
				cultureBoard.setSeq(list2.item(0).getTextContent());
				cultureBoard.setTitle(list2.item(1).getTextContent());
				cultureBoard.setStartDate(list2.item(2).getTextContent());
				cultureBoard.setEndDate(list2.item(3).getTextContent());
				cultureBoard.setPlace(list2.item(4).getTextContent());
				cultureBoard.setRealmName(list2.item(5).getTextContent());
				cultureBoard.setArea(list2.item(6).getTextContent());
				cultureBoard.setThumbnail(list2.item(7).getTextContent());
				cultureBoard.setGpsX(list2.item(8).getTextContent());
				cultureBoard.setGpsY(list2.item(9).getTextContent());

				cultureBoardList.add(cultureBoard);
			}

		} catch (ParserConfigurationException e) {

			e.printStackTrace();
		} catch (SAXException e) {

			e.printStackTrace();
		}

		return cultureBoardList;
	}

	@Override
	public CultureDetailVO viewCultureDetail(String seq) throws IOException {

		CultureDetailVO cultureDetail = new CultureDetailVO();

		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?serviceKey=" + serviceKey
				+ "&seq=" + seq;

		try {

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document xml = documentBuilder.parse(url);

			Element element = xml.getDocumentElement();
			NodeList body = element.getElementsByTagName("perforInfo");
			NodeList perforInfo = body.item(0).getChildNodes();

			cultureDetail.setSeq(perforInfo.item(0).getTextContent());
			cultureDetail.setTitle(perforInfo.item(1).getTextContent());
			cultureDetail.setStartDate(perforInfo.item(2).getTextContent());
			cultureDetail.setEndDate(perforInfo.item(3).getTextContent());
			cultureDetail.setPlace(perforInfo.item(4).getTextContent());
			cultureDetail.setRealmName(perforInfo.item(5).getTextContent());
			cultureDetail.setArea(perforInfo.item(6).getTextContent());
			cultureDetail.setPrice(perforInfo.item(8).getTextContent());
			cultureDetail.setContents(perforInfo.item(9).getTextContent());
			cultureDetail.setUrl(perforInfo.item(11).getTextContent());
			cultureDetail.setPhone(perforInfo.item(12).getTextContent());
			cultureDetail.setImgUrl(perforInfo.item(13).getTextContent());

		} catch (ParserConfigurationException e) {

			e.printStackTrace();
		} catch (SAXException e) {

			e.printStackTrace();
		}

		return cultureDetail;

	}

	// 생활기상지수조회서비스 api 식중독 지수 조회
	@Override
	public Object getFsn(String areaNo) throws Exception {

		Calendar cld = new GregorianCalendar();
		cld.add(Calendar.DATE, -1);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String yesterdayStr = date.format(cld.getTime()) + "18";

		String addr = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList?serviceKey=" + serviceKey
				+ "&time=" + yesterdayStr + "&areaNo=" + areaNo + "&_type=json";

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		try {
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			JSONObject responseObj = (JSONObject) obj.get("Response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject tmpObj = (JSONObject) bodyObj.get("indexModel");

			return tmpObj.get("tomorrow");
		} catch (Exception e) {
			return "--";
		}
	}

	// 생활기상지수조회서비스 api 자외선 지수 조회
	@Override
	public Object getUltrvLifeList(String areaNo) throws Exception {

		Calendar cld = new GregorianCalendar();
		cld.add(Calendar.DATE, -1);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String yesterdayStr = date.format(cld.getTime()) + "18";

		String addr = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getUltrvLifeList?serviceKey="
				+ serviceKey + "&areaNo=" + areaNo + "&time=" + yesterdayStr + "&_type=json";

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		try {
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			JSONObject responseObj = (JSONObject) obj.get("Response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject tmpObj = (JSONObject) bodyObj.get("indexModel");

			return tmpObj.get("tomorrow");
		} catch (Exception e) {
			return "--";
		}
	}

	// 생활기상지수조회서비스 api 체감온도 조회
	@Override
	public Object getSensorytemLifeList(String areaNo) throws Exception {

		Calendar cld = new GregorianCalendar();
		cld.add(Calendar.DATE, -1);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String yesterdayStr = date.format(cld.getTime()) + "18";

		String addr = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getSensorytemLifeList?serviceKey="
				+ serviceKey + "&areaNo=" + areaNo + "&time=" + yesterdayStr + "&_type=json";

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		try {
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			JSONObject responseObj = (JSONObject) obj.get("Response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject tmpObj = (JSONObject) bodyObj.get("indexModel");

			return tmpObj.get("h18");
		} catch (Exception e) {
			return "--";
		}
	}

	// waqi api 미세먼지 정보 출력
	@Override
	public Object getFineDust(String area) throws Exception {

		String addr = "http://api.waqi.info/feed/" + area + "/?token=" + waqiToken;

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		try {

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			JSONObject responseObj = (JSONObject) obj.get("data");
			JSONObject bodyObj = (JSONObject) responseObj.get("iaqi");
			JSONObject tmpObj = (JSONObject) bodyObj.get("pm10");

			return tmpObj.get("v");

		} catch (Exception e) {
			return "--";
		}
	}

	// waqi api 초미세먼지 정보 출력
	@Override
	public Object getUltraFineDust(String area) throws Exception {

		String addr = "http://api.waqi.info/feed/" + area + "/?token=" + waqiToken;

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		try {
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			JSONObject responseObj = (JSONObject) obj.get("data");
			JSONObject bodyObj = (JSONObject) responseObj.get("iaqi");
			JSONObject tmpObj = (JSONObject) bodyObj.get("pm25");

			return tmpObj.get("v");
		} catch (Exception e) {
			return "--";
		}
	}

	// openweather api 현재온도 정보 출력
	@Override
	public HashMap<String, String> getCurTemperature(String area) throws Exception {

		String[] tag = { "temp", "temp_min", "temp_max" };

		HashMap<String, String> temperature = new HashMap<String, String>();

		String addr = "http://api.openweathermap.org/data/2.5/weather?appid=" + openWhetherMapServicyKey + "&q=" + area;

		URL url = new URL(addr);
		BufferedReader bf;
		String line = "";
		String result = "";

		bf = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = bf.readLine()) != null) {
			result = result.concat(line);
		}

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(result);

		// 현재온도, 최저,최고 온도값 저장
		JSONObject tmpObj = (JSONObject) obj.get("main");

		double tmpTemp = 0;

		for (int i = 0; i < 3; i++) {
			tmpTemp = (double) tmpObj.get(tag[i]) - 273.15;
			tmpTemp = Double.parseDouble(String.format("%.1f", tmpTemp));
			temperature.put(tag[i], String.valueOf(tmpTemp));
		}

		// 현재 날씨 아이콘, 설명 정보 저장
		JSONArray tmpArray = (JSONArray) obj.get("weather");
		JSONObject infoTemp = (JSONObject) tmpArray.get(0);

		temperature.put("icon", (String) infoTemp.get("icon"));
		temperature.put("weatherState", (String) infoTemp.get("description"));

		return temperature;
	}

	// 현재 날짜 조회
	@Override
	public String getTodayDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date todayDate = new Date();
		String today = simpleDateFormat.format(todayDate);
		
		return today;
	}

}
