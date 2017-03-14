package com.empMgr.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.*;

import com.empMgr.service.*;
import com.icia.di.*;

public class EmpMgrController {
	//AnnotationRunner는 value, method, listAjax()란 메소드이름
	@RequestMapping(value="/employee/list", method="GET")
	public static ModelAndView list(HttpServletRequest req) {
		EmpMgrService service = (EmpMgrService)req.getServletContext().getAttribute("service");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.readEmpList(req));
		mav.setView("/view/list.jsp");
		return mav;
	}
	@RequestMapping(value="/employee/list", method="AJAX")
	public static ModelAndView listAjax(HttpServletRequest req) {
		//서비스나 DAO는 여러개 만들 필요가 없다. 하나만 만들자
		//1. 전부 다 static 메소드
		//2. singleton -> 생각보다 어렵다
		//3. 프론트컨트롤러가 만들어서 저장해둔다
		EmpMgrService service = (EmpMgrService)req.getServletContext().getAttribute("service");
		ServletContext ctx = req.getServletContext();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.readEmpList(req));
		//AJAX는 결과를 출력하는 뷰가 존재하지 않는다
		//일반적인 jsp는 내용과 디자인이 함께 클라이언트로
		//AJAX는 데이터만 주고 받는다. 뷰는 클라이언트가 알아서...
		return mav;
	}
	@RequestMapping(value="/employee/view", method="GET")
	public static ModelAndView view(HttpServletRequest req) {
		EmpMgrService service = (EmpMgrService)req.getServletContext().getAttribute("service");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.readEmployee(req));
		mav.setView("/view/view.jsp");
		return mav;
	}
	@RequestMapping(value="/employee/view", method="AJAX")
	public static ModelAndView viewAjax(HttpServletRequest req) {
		EmpMgrService service = (EmpMgrService)req.getServletContext().getAttribute("service");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.readEmployee(req));
		return mav;
	}
}
