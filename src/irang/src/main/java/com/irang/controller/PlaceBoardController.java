package com.irang.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.irang.commons.paging.Criteria;
import com.irang.commons.paging.PageMaker;
import com.irang.dto.PlaceBoardVO;
import com.irang.service.PlaceBoardService;

@Controller
@RequestMapping("/place")
public class PlaceBoardController {

	private static final Logger logger = LoggerFactory.getLogger(PlaceBoardController.class);

	@Inject
	private PlaceBoardService placeBoardService;

	// 장소추천 목록 페이지 이동
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String placeBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("placeList");

		criteria.setPerPageNum(6);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(placeBoardService.countContents(criteria));

		model.addAttribute("placeBoardList", placeBoardService.listPaging(criteria));
		model.addAttribute("pageMaker", pageMaker);

		return "/place/list";
	}

	// 편의시설 유무 검색 페이지 이동
	@RequestMapping(value = "/list/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchPlaceBoardList(Locale locale, Model model, HttpServletRequest request) throws Exception {

		String[] searchItem = request.getParameterValues("searchItem");
		String queryCondition = "";

		for (int i = 0; i < searchItem.length; i++) {
			queryCondition += searchItem[i] + " = 'O' and ";
		}

		queryCondition = queryCondition.substring(0, queryCondition.length() - 5);

		model.addAttribute("placeBoardList", placeBoardService.listSearch(queryCondition));

		return "/place/search";
	}

	// 조회 페이지 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String contentView(@RequestParam("contentIdx") int contentIdx, Model model) throws Exception {

		logger.info("place read...");

		PlaceBoardVO content = placeBoardService.read(contentIdx);
		model.addAttribute("content", content);

		return "/place/read";
	}

}
