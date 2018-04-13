package myoa.entity;

import java.util.Date;

public class Document {
	
	private int id;
	private String name;
	private String description;
	private Date CreateTime;
	private String type;
	private String fileUrl;
	private Employee employee;
	private int parentId;
	
	public Document() {}
	
	public Document(int id, String name, String description, Date createTime, String type,
			String fileUrl, int parentId) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.CreateTime = createTime;
		this.type = type;
		this.fileUrl = fileUrl;
		this.parentId = parentId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Date createTime) {
		CreateTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
