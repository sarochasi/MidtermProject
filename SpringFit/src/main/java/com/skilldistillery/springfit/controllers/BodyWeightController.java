package com.skilldistillery.springfit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.BodyWeightDAO;

@Controller
public class BodyWeightController {
	
	@Autowired
	private BodyWeightDAO bodyWeightDao;
	
	@RequestMapping(path="SubmitWeight.do")
	public ModelAndView submitWeight() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("");
		return mv;
	}

}
