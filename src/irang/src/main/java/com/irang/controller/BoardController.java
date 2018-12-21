package com.irang.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.irang.commons.paging.Criteria;
import com.irang.commons.paging.PageMaker;
import com.irang.dto.BoardVO;
import com.irang.dto.UserVO;
import com.irang.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;

	// 전체게시글 목록 페이지 이동
	@RequestMapping(value = "/list/all", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countContents(criteria));

		model.addAttribute("boards", boardService.listPaging(criteria));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 자유게시판 목록 페이지 이동
	@RequestMapping(value = "/list/bulletin", method = RequestMethod.GET)
	public String bulletinBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("자유게시판"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "자유게시판"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 요리게시판 목록 페이지 이동
	@RequestMapping(value = "/list/cook", method = RequestMethod.GET)
	public String cookBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("요리"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "요리"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 병원/약국게시판 목록 페이지 이동
	@RequestMapping(value = "/list/treat", method = RequestMethod.GET)
	public String treatBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("병원/약국"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "병원/약국"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 어린이집/유치원게시판 목록 페이지 이동
	@RequestMapping(value = "/list/kinder", method = RequestMethod.GET)
	public String kinderBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("어린이집/유치원"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "어린이집/유치원"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 임신/출산게시판 목록 페이지 이동
	@RequestMapping(value = "/list/preg", method = RequestMethod.GET)
	public String pregBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("임신/출산"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "임신/출산"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// 조회 페이지 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String contentView(@RequestParam("contentIdx") int contentIdx, Model model) throws Exception {

		logger.info("read...");

		BoardVO content = boardService.read(contentIdx);
		model.addAttribute("content", content);

		BoardVO preContent = boardService.readPrev(contentIdx);
		model.addAttribute("preContent", preContent);
		BoardVO postContent = boardService.readNext(contentIdx);
		model.addAttribute("postContent", postContent);

		return "/board/read";
	}

	// 등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {

		logger.info("write GET...");

		return "/board/write";
	}

	// 등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO boardVO) throws Exception {

		logger.info("write POST...");
		logger.info(boardVO.toString());

		boardService.create(boardVO);

		return "redirect:/board/list/all";
	}

	// 수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("contentIdx") int contentIdx, HttpSession httpSession, Model model)
			throws Exception {

		logger.info("modify GET...");

		BoardVO content = boardService.read(contentIdx);
		UserVO login = (UserVO) httpSession.getAttribute("login");

		// 작성자와 로그인 계정이 같은지 확인
		if (login.getUser_nickname().equals(content.getBoard_writer())) {
			model.addAttribute("content", content);
			return "/board/modify";
		}

		return "/notAuth";
	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(@RequestParam("contentIdx") int contentIdx, BoardVO boardVO) throws Exception {

		logger.info("modify POST...");
		logger.info(boardVO.toString());

		boardService.update(contentIdx, boardVO);

		return "redirect:/board/read?contentIdx=" + contentIdx;
	}

	// 삭제 처리
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("contentIdx") int contentIdx, HttpSession httpSession) throws Exception {

		logger.info("delete" + contentIdx);

		BoardVO content = boardService.read(contentIdx);
		UserVO login = (UserVO) httpSession.getAttribute("login");

		// 작성자와 로그인 계정이 같은지 확인
		if (login.getUser_nickname().equals(content.getBoard_writer())) {
			boardService.delete(contentIdx);
			return "redirect:/board/list/all";
		}
		return "/notAuth";
	}
}
