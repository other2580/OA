package myoa.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import myoa.biz.MessageReceptionBiz;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class UserController {

	@Autowired
	private  MessageReceptionBiz biz;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/index")
	public String index(Model model,HttpServletRequest request,HttpSession session) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//未读邮件
		request.getSession().setAttribute("user",userDetails.getEmployee());
		request.getSession().setAttribute("unRead",biz.fetchReRow(userDetails.getEmployee().getId(),0,-1));
		//model.addAttribute("user",userDetails.getEmployee());
		model.addAttribute("unRead",biz.fetchReRow(userDetails.getEmployee().getId(),0,-1));	
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/Logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:login";
	}
	
	
	@RequestMapping("/Role403")
	public String deny() {
		return "Role403";
	}
	
}
