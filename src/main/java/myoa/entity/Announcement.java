package myoa.entity;

import java.util.Date;

import myoa.web.until.ConvertTime;

public class Announcement {
	
	private int id;
	private String title;
	private String content;
	private Date createTime;
	private Date lastEditTime;
	private int approverId;
	private Date approveTime;
	private int status;
	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Announcement() {}
	
	public Announcement(int id, String title, String content, Date createTime, Date lastEditTime,
			int approverId, Date approveTime, int status, Employee employee) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.lastEditTime = lastEditTime;
		this.approverId = approverId;
		this.approveTime = approveTime;
		this.status = status;
		this.employee = employee;
	}
	
	public Announcement(int id, int status) {
		this.id = id;
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastEditTime() {
		return lastEditTime;
	}
	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}
	public int getApproverId() {
		return approverId;
	}
	public void setApproverId(int approverId) {
		this.approverId = approverId;
	}
	public Date getApproveTime() {
		return approveTime;
	}
	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getStatusToString() {
		String str = "已审批";
		if(this.status == 2) {
			str = "已审批";
		}else if(this.status == 1) {
			str = "待审批";
		}
		return str;
	}
	
	
	public String getCreateTimeLong() {
		String time=ConvertTime.DateToLongStr(this.createTime);
		return time;
	}
	
	public String getLastEditTimeLong() {
		String time=ConvertTime.DateToLongStr(this.lastEditTime);
		return time;
	}
	
}
