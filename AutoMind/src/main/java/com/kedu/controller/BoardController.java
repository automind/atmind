package com.kedu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/board/index";
	}
	
	@RequestMapping(value="/index-1", method = RequestMethod.GET)
	public String index1(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/board/index-1";
	}
	
	@RequestMapping(value="/index-2", method = RequestMethod.GET)
	public String index2(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/board/index-2";
	}
	
	@RequestMapping(value="/index-3", method = RequestMethod.GET)
	public String index3(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/board/index-3";
	}
	
	@RequestMapping(value="/index-4", method = RequestMethod.GET)
	public String index4(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/board/index-4";
	}
}
