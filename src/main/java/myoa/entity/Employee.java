package myoa.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import myoa.web.until.ConvertTime;

public class Employee {
	
	private int id;//ID
	private String nr;//员工编号
	private String password;//员工登录密码
	private String name;//姓名
	private int gender;//性别（0-女，1-男）
	private String email;//邮件
	private Date entryDate;//入职日期
	private Department department;//部门ID
	private int isManager;//是否部门主管
	private int status;//员工状态（0-注销，1-可用，2-暂停）

	private Role role;
	private List<Role> roles = new ArrayList<>(); // 角色集合
	
	
	public Employee() {}
	public Employee(int id, String nr, String password, String name, int gender, String email, Date entryDate,
			Department department, int isManager, int status, Role role, List<Role> roles) {
		super();
		this.id = id;
		this.nr = nr;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.entryDate = entryDate;
		this.department = department;
		this.isManager = isManager;
		this.status = status;
		this.role = role;
		this.roles = roles;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNr() {
		return nr;
	}


	public void setNr(String nr) {
		this.nr = nr;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getGender() {
		return gender;
	}


	public void setGender(int gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEntryDate() {
		return entryDate;
	}
	
	
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	
	
	public Department getDepartment() {
		return department;
	}


	public void setDepartment(Department department) {
		this.department = department;
	}


	public int getIsManager() {
		return isManager;
	}


	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}


	public List<Role> getRoles() {
		return roles;
	}


	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	

}
