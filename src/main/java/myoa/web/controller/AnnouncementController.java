package myoa.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.entity.Announcement;
import myoa.entity.Employee;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class AnnouncementController {

	@Autowired
	private myoa.biz.AnnouncementBiz AnnouncementBiz;
	
	@PreAuthorize("hasAuthority('announcement-list')")
	@RequestMapping("/announcement")
	public String anncoun(Model model) {
		model.addAttribute("all", AnnouncementBiz.getAllAnnouncement());
		return "announcement";
	}
	
	@ResponseBody
	@RequestMapping("/fetchByStatus")
	public Announcement fetchByStatus(int id) {
		Announcement annun = AnnouncementBiz.fetchByStatus(id);
		return annun;
	}
	
	@RequestMapping("/register-Login")
	public String add(Model model,Announcement announcement,Integer status,String title) {	
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		
		announcement.setStatus(status);
		Employee emp = new Employee();
		emp.setId(userDetails.getEmployee().getId());
		announcement.setEmployee(emp);
		AnnouncementBiz.addAnnouncement(announcement);
		model.addAttribute("addError","成功提交“"+title+"”");
		return "redirect:announcement";
	}
	
	@PreAuthorize("hasAuthority('announcement-approve')")
	@RequestMapping("/updateStatus")
	public String updateStatus(int annunId) {
		Announcement ann = new Announcement(annunId, 2);
		AnnouncementBiz.updateAnnouncement(ann);
		return "redirect:announcement";
	}
	
	@ResponseBody
	@RequestMapping("/delAnnun")
	public Map<String, Object> delAnnun(int annunId) {
		Map<String, Object> map = new HashMap<>();
		try {
			AnnouncementBiz.delete(annunId);
			map.put("ok", true);
	        map.put("error", "删除成功！");
		} catch (Exception e) {
			map.put("ok", false);
	        map.put("error", "删除失败！");
		}
		return map;
	}
	
	@RequestMapping("/updateStatus0")
	public String updateStatus0(int annunId) {
		Announcement ann = new Announcement(annunId, 0);
		AnnouncementBiz.updateAnnouncement(ann);
		return "redirect:announcement";
	}
	
}
