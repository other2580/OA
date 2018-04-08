package myoa.entity;

public class Employee {
	
	private int id;
	private String nr;
	private String password;
	private String name;
	private int gender;
	private int departmentId;
	private int isManager;
	private int status;
	
	public Employee() {}
	
	public Employee(int id, String nr, String password, String name, int gender, int departmentId, int isManager,
			int status) {
		this.id = id;
		this.nr = nr;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.departmentId = departmentId;
		this.isManager = isManager;
		this.status = status;
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
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
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
	
}
