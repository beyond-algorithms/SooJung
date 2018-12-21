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

	// ��ü�Խñ� ��� ������ �̵�
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

	// �����Խ��� ��� ������ �̵�
	@RequestMapping(value = "/list/bulletin", method = RequestMethod.GET)
	public String bulletinBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("�����Խ���"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "�����Խ���"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// �丮�Խ��� ��� ������ �̵�
	@RequestMapping(value = "/list/cook", method = RequestMethod.GET)
	public String cookBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("�丮"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "�丮"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// ����/�౹�Խ��� ��� ������ �̵�
	@RequestMapping(value = "/list/treat", method = RequestMethod.GET)
	public String treatBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("����/�౹"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "����/�౹"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// �����/��ġ���Խ��� ��� ������ �̵�
	@RequestMapping(value = "/list/kinder", method = RequestMethod.GET)
	public String kinderBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("�����/��ġ��"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "�����/��ġ��"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// �ӽ�/���Խ��� ��� ������ �̵�
	@RequestMapping(value = "/list/preg", method = RequestMethod.GET)
	public String pregBoardList(Locale locale, Model model, Criteria criteria) throws Exception {

		logger.info("boardList");

		criteria.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countCategoryContents("�ӽ�/���"));

		model.addAttribute("boards", boardService.categoryPaging(criteria, "�ӽ�/���"));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	// ��ȸ ������ �̵�
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

	// ��� ������ �̵�
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {

		logger.info("write GET...");

		return "/board/write";
	}

	// ��� ó��
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO boardVO) throws Exception {

		logger.info("write POST...");
		logger.info(boardVO.toString());

		boardService.create(boardVO);

		return "redirect:/board/list/all";
	}

	// ���� ������ �̵�
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("contentIdx") int contentIdx, HttpSession httpSession, Model model)
			throws Exception {

		logger.info("modify GET...");

		BoardVO content = boardService.read(contentIdx);
		UserVO login = (UserVO) httpSession.getAttribute("login");

		// �ۼ��ڿ� �α��� ������ ������ Ȯ��
		if (login.getUser_nickname().equals(content.getBoard_writer())) {
			model.addAttribute("content", content);
			return "/board/modify";
		}

		return "/notAuth";
	}

	// ���� ó��
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(@RequestParam("contentIdx") int contentIdx, BoardVO boardVO) throws Exception {

		logger.info("modify POST...");
		logger.info(boardVO.toString());

		boardService.update(contentIdx, boardVO);

		return "redirect:/board/read?contentIdx=" + contentIdx;
	}

	// ���� ó��
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("contentIdx") int contentIdx, HttpSession httpSession) throws Exception {

		logger.info("delete" + contentIdx);

		BoardVO content = boardService.read(contentIdx);
		UserVO login = (UserVO) httpSession.getAttribute("login");

		// �ۼ��ڿ� �α��� ������ ������ Ȯ��
		if (login.getUser_nickname().equals(content.getBoard_writer())) {
			boardService.delete(contentIdx);
			return "redirect:/board/list/all";
		}
		return "/notAuth";
	}
}
