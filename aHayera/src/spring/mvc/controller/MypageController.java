package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.CustomerVO;
import spring.mvc.service.CustomerService;
import spring.mvc.service.MypageServiceImple;

@Controller
public class MypageController {  
	
	@Autowired
	private MypageServiceImple service;
	
	CustomerVO vo;
	
	@RequestMapping("/mypage.do")
	public void getAllById( Model m, HttpSession session) {
		System.out.println("마이페이지 연결");
			String customer_id = (String)session.getAttribute("login");
			vo.setCustomer_id(customer_id);
			
			CustomerVO result = service.getAllById(vo);
			m.addAttribute("result", vo);
		
		
	}
	
	/*
	 * @Autowired private CustomerService customerserive;
	 * 
	 * @RequestMapping(value="/login.do",produces =
	 * "application/text;charset=utf-8")
	 * 
	 * @ResponseBody 
	 * public String login(CustomerVO vo, Model m,HttpSession session)
	 * { CustomerVO result = customerserive.login(vo); session.setAttribute("login",
	 * result.getCustomer_id()); if(result==null || result.getCustomer_id()==null) {
	 * return "0"; }else { return "1"; } }
	 */
}
