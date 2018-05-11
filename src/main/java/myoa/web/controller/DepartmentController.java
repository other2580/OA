package myoa.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.biz.DepartmentBiz;
import myoa.entity.Department;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentBiz departmentBiz;
	
	@PreAuthorize("hasAuthority('organization-department')") 
	@RequestMapping("/depTable")
	public String depTable(Model model) {
		model.addAttribute("departmenties",departmentBiz.fetchDepartmentAll());
		return "depTable";
	}
	
	
	@ResponseBody
	@RequestMapping("/findById")
	public Department findById(int id) {
		return departmentBiz.fetchDepartmentById(id);
	}
	
	
	@RequestMapping("/depSave")
	public String depSave(Department department) {
		if(department.getId() > 0) {
			departmentBiz.update(department);
		}else {
			departmentBiz.add(department);
		}
		return "redirect:depTable";
	}
	
	@ResponseBody
	@RequestMapping("/deleteDep")
	public boolean deleteDep(int id) {
		boolean flag = true;
		try {
			departmentBiz.delete(id);
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	
}
