package myoa.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.biz.FunctionBiz;
import myoa.biz.RoleBiz;
import myoa.biz.RoleFunctionBiz;

@Controller
public class FunctionController {

	@Autowired
	private FunctionBiz functionBiz;
	@Autowired
	private RoleBiz roleBiz;
	@Autowired
	private RoleFunctionBiz roleFunctionBiz;
	
	@PreAuthorize("hasAuthority('security-role')")
	@RequestMapping("/permissions")
	public String permissions(Model model){
		model.addAttribute("role", roleBiz.fetchAllRole());
		model.addAttribute("functioNot", functionBiz.fetchByFunctionId());
		model.addAttribute("function", functionBiz.fetchFunctions());
		return "permissions";
	}
	
	@ResponseBody
	@RequestMapping("/roleFunction")
	public List<Integer>  roleFunction(@RequestParam(name="id",required=true,defaultValue="0")int id){
		return functionBiz.fetchById(id);
	}
	
	
	@RequestMapping("/addFunction")
	public String addFunction(int [] checked, int roleId) {
		System.out.println(roleId+"    123");
		
		List<Integer> oldId = functionBiz.fetchById(roleId);
		List<Integer> newId = new ArrayList<>();
		
		for(int i=0; i<checked.length; i++) {
			if(oldId.indexOf(checked[i]) != -1) {
				oldId.remove(oldId.indexOf(checked[i]));
			}else {
				newId.add(checked[i]);
			}
		}
		
		if(oldId.size() > 0) {
			//删除不存在的权限
			for(Integer fid : oldId) {
				roleFunctionBiz.delRoleFunction(roleId, fid);
			}
		}
		
		if(newId.size() > 0) {
			//新增角色权限
			for(Integer item : newId) {
				roleFunctionBiz.addRoleFunction(roleId, item);
			}
		}
		
		return "redirect:permissions";
	}
	
}
























