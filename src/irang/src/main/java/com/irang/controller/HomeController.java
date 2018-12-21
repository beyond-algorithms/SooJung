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

import com.irang.service.BoardService;
import com.irang.service.LifeInfoService;
import com.irang.service.PlaceBoardService;
 
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private LifeInfoService lifeInfoService;
    
    @Inject
    private BoardService boardService;
    
    @Inject
    private PlaceBoardService placeBoardService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        // 날씨
		HashMap<String, String> temperature = lifeInfoService.getCurTemperature("seoul,kr");
		
		model.addAttribute("temp", temperature.get("temp"));
		model.addAttribute("temp_min", temperature.get("temp_min"));
		model.addAttribute("temp_max", temperature.get("temp_max"));
		model.addAttribute("icon", temperature.get("icon"));
        
		// 공연전시정보
		model.addAttribute("cultureBoardList", lifeInfoService.viewCultureList("1"));
		
		// 게시판
        model.addAttribute("boardList", boardService.listAll());

        // 장소추천
        model.addAttribute("placeBoardList", placeBoardService.listAll());

        return "home";
    }
}
 
