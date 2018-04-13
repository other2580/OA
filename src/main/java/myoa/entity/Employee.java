package myoa.entity;

import java.util.ArrayList;
import java.util.List;

public class Employee {
	
	private int id;
	private String nr;
	private String password;
	private String name;
	private int gender;
	private String email;
	private Department department;
	private int isManager;
	private int status;
	private List<Role> roles = new ArrayList<>(); // 角色集合
	
	public Employee() {}
	
	public Employee(int id, String nr, String password, String name, int gender, Department department,String email, int isManager,
			int status, List<Role> roles) {
		this.id = id;
		this.nr = nr;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.department = department;
		this.email = email;
		this.isManager = isManager;
		this.status = status;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
