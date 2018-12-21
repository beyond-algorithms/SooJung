package com.irang.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.irang.dto.LoginDTO;
import com.irang.dto.UserVO;
import com.irang.service.UserService;

@Controller
public class UserController {
    
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Inject
    private UserService userService;

    // 로그인 페이지 조회
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Locale locale, Model model) throws Exception{
 
        logger.info("login page");
        
        return "/login";
    }
    
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
    	
    	UserVO userVO = userService.login(loginDTO);
    	
    	if(userVO == null || !BCrypt.checkpw(loginDTO.getUser_password(), userVO.getUser_password())) {
    		return;
    	}
    	
    	model.addAttribute("user", userVO);
    }
    
    // 로그아웃 처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
    	
    	Object object = httpSession.getAttribute("login");
    	
    	if(object != null) {
    		httpSession.removeAttribute("login");
    		httpSession.invalidate();
    	}
    	return "/logout";
    }
    
    // 회원가입 페이지 조회
    @RequestMapping(value = "/register", method=RequestMethod.GET)
    public String register(Locale locale, Model model) throws Exception{
    	 
        logger.info("register page");
        
        return "/register";
    }
    
    // 회원가입 처리
    @RequestMapping(value = "/register", method=RequestMethod.POST)
    public String registerMember(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
    	
    	String hashedPw = BCrypt.hashpw(userVO.getUser_password(), BCrypt.gensalt());
    	userVO.setUser_password(hashedPw);
    	userService.register(userVO);
    	redirectAttributes.addFlashAttribute("msg", "회원가입 완료");
    	
    	return "redirect:/login";
    }
}