package com.irang.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.irang.service.LifeInfoService;

@Controller
@RequestMapping("/info")
public class LifeInfoController {

	private static final Logger logger = LoggerFactory.getLogger(LifeInfoController.class);

	@Inject
	private LifeInfoService lifeInfoService;

	// 공연전시정보 리스트 페이지
	@RequestMapping(value = "/culture", method = RequestMethod.GET)
	public String infoView(Locale locale, Model model, @RequestParam("page") String page) throws Exception {

		logger.info("info");

		model.addAttribute("cultureBoardList", lifeInfoService.viewCultureList(page));
		model.addAttribute("curPage", Integer.parseInt(page));
		return "/info/info";
	}

	// 공연전시정보 상세 페이지
	@RequestMapping(value = "/culture/detail", method = RequestMethod.GET)
	public String infoDetailView(Locale locale, Model model, @RequestParam("seq") String seq) throws Exception {

		logger.info("info detail");

		model.addAttribute("cultureDetail", lifeInfoService.viewCultureDetail(seq));
		return "/info/info_detail";
	}

	// 날씨 정보 페이지
	@RequestMapping(value = "/weather", method = RequestMethod.GET)
	public String weatherView(@RequestParam("code1") String code1, @RequestParam("code2") String code2,
			@RequestParam("code3") String code3, Locale locale, Model model) throws Exception {

		logger.info("info weather");

		model.addAttribute("todayDate", lifeInfoService.getTodayDate());

		HashMap<String, String> temperature = lifeInfoService.getCurTemperature(code3);

		model.addAttribute("temp", temperature.get("temp"));
		model.addAttribute("temp_min", temperature.get("temp_min"));
		model.addAttribute("temp_max", temperature.get("temp_max"));
		model.addAttribute("icon", temperature.get("icon"));
		model.addAttribute("weatherState", temperature.get("weatherState"));
		model.addAttribute("fsn", lifeInfoService.getFsn(code1));
		model.addAttribute("ultrav", lifeInfoService.getUltrvLifeList(code1));
		model.addAttribute("sensorytem", lifeInfoService.getSensorytemLifeList(code1));
		model.addAttribute("curPage", code2);

		if (code2.equals("jeju")) {

			code2 = "korea/jeju/seongsan-eup";
		}

		model.addAttribute("fineDust", lifeInfoService.getFineDust(code2));
		model.addAttribute("ultraFineDust", lifeInfoService.getUltraFineDust(code2));

		return "/info/info_weather";
	}
}
