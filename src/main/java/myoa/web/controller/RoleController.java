package myoa.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.biz.RoleBiz;
import myoa.entity.Role;

@Controller
public class RoleController {

	@Autowired
	private RoleBiz roleBiz;
	
	@ResponseBody
	@RequestMapping("/deleteRole")
	public Map<String, Object> deleteRole(int id){
		Map<String, Object> map = new HashMap<>();
		try {
			roleBiz.delete(id);
			map.put("ok", true);
            map.put("error", "删除成功！");
		} catch (Exception e) {
			map.put("ok", false);
            map.put("error", "该角色用户正在使用中无法删除！！！");
		}
		return map;
	}
	
	@RequestMapping("/updateRole")
	public String updateRole(Role role){
		if(role.getId() > 0) {
			roleBiz.update(role);
		}else {
			roleBiz.add(role);
		}
		return "redirect:permissions";
	}
	
}
