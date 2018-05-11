package myoa.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.biz.EmployeeRoleBiz;
import myoa.biz.RoleBiz;
import myoa.entity.Department;
import myoa.entity.Employee;
import myoa.entity.Role;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@Autowired
	private RoleBiz roleBiz;
	
	@Autowired
	private EmployeeRoleBiz employeeRoleBiz;
	
	
	@PreAuthorize("hasAuthority('organization-employee')") 	
	@RequestMapping("/empTable")
	public String empTable(Integer dids,String name,String nr, Integer page, Model model) {
		final int pageSize=4; 
		dids = dids==null?0:dids;
		page = page==null?1:page;
		List<Employee> employees = employeeBiz.getEmployeesPagings(dids, name,nr, page, pageSize);
		int rows = employeeBiz.fetchEmployeesRows(dids, name,nr);
		int totalPages = rows%pageSize==0?rows/pageSize:rows/pageSize+1;
		model.addAttribute("departments",departmentBiz.fetchDepartmentAll());
		model.addAttribute("employees", employees);
		model.addAttribute("pageNum", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("empRole", roleBiz.fetchAllRole());
		
		return "empTable";
	}
	

	@RequestMapping("/addEmployee")
	public String addEmployee(Integer id, Model model) {
		model.addAttribute("departments",departmentBiz.fetchDepartmentAll());
		id = id==null?0:id;
		if(id>0) {
			model.addAttribute("employee", employeeBiz.fetchEmployeeById(id));
			System.out.println(employeeBiz.fetchEmployeeById(id).getEmail());
		}
		return "addEmployee";
	}
	
	
	@RequestMapping("/empSave")
	public String save(Employee employee, int departmentId, Date entryDate2) throws UnsupportedEncodingException {
		Department dep = new Department();
		dep.setId(departmentId);
		employee.setDepartment(dep);
		employee.setEntryDate(entryDate2);
		
		if(employee.getId()>0) {
			employeeBiz.update(employee);
			System.out.println("修改成功");
		}else {
			//散列加密
			String pwd = employee.getPassword();
			Md5PasswordEncoder md5 = new Md5PasswordEncoder();  
	 	 	String password = md5.encodePassword(pwd, employee.getNr()); 
	 	 	employee.setPassword(password);
	 	 	
			employeeBiz.add(employee);
			System.out.println("添加成功");
		}
		
		return "redirect:/empTable?name="+ URLEncoder.encode(employee.getName(),"UTF-8");
	}	
	
	
	@RequestMapping("/delEmp")
	public String delEmp(Integer id) {
		employeeBiz.delete(id);
		return "redirect:empTable";
	}
	
	
	@PreAuthorize("hasAuthority('security-user')") 	
	@RequestMapping("/empRole")
	public String empRole(Integer dids,String name,String nr, Integer page, Model model) {
		final int pageSize=4; 
		dids = dids==null?0:dids;
		page = page==null?1:page;
		List<Employee> employees = employeeBiz.getEmployeesPagings(dids, name,nr, page, pageSize);
		int rows = employeeBiz.fetchEmployeesRows(dids, name,nr);
		int totalPages = rows%pageSize==0?rows/pageSize:rows/pageSize+1;
		model.addAttribute("departments",departmentBiz.fetchDepartmentAll());
		model.addAttribute("employees", employees);
		model.addAttribute("pageNum", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("empRole", roleBiz.fetchAllRole());
		return "empRole";
	}
	
	
	@ResponseBody
	@RequestMapping("/findEmpRole")
	public int [] findEmpRole(int id){
		Employee emp = employeeBiz.fetchEmployeeById(id);
		List<Role> role = emp.getRoles();
		int[] num=new int[role.size()];
		for(int i=0; i<role.size(); i++) {
			num[i] = role.get(i).getId();
		}
		return num;
	}
	
	
	@RequestMapping("/addEmpRole")
	public String addEmpRole(int [] checked, int roleId) {
		System.out.println(roleId+"  123");
		Employee emp = employeeBiz.fetchEmployeeById(roleId);
		List<Role> role = emp.getRoles();
		List<Integer> num = new ArrayList<Integer>();
		for(int i=0; i<role.size(); i++) {
			num.add(role.get(i).getId());
		}
		List<Integer> oldId = num;
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
			for(Integer rid : oldId) {
				employeeRoleBiz.delEmployeeRole(roleId, rid);
			}
		}
		
		if(newId.size() > 0) {
			//新增角色权限
			for(Integer item : newId) {
				System.out.println(item);
				employeeRoleBiz.addEmployeeRole(roleId, item);
			}
		}
		
		return "redirect:empRole";
	}
	

	//检查密码
	@ResponseBody
	@RequestMapping(value="/checkPwd", method = RequestMethod.GET)
	public int checkPwd(Model model,String password) {			
			EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
			//散列加密
			Md5PasswordEncoder md5 = new Md5PasswordEncoder();  
	 	 	password = md5.encodePassword(password, userDetails.getEmployee().getNr());
	 	 	
			int result=employeeBiz.checkPwd(userDetails.getEmployee().getId(), password);			
			return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePwd", method = RequestMethod.POST)
	public Map<String,Object> updatePwd(String password) {
		System.out.println(password);
		Map<String,Object> model = new HashMap<>();
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//散列加密
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();  
	 	password = md5.encodePassword(password, userDetails.getEmployee().getNr());
		employeeBiz.updatePwd(userDetails.getEmployee().getId(), password);
		model.put("ok", true);
		return model;
	}
	
}

















