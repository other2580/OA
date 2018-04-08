package myoa.entity;

import java.util.Date;

public class Announcement {
	
	private int id;
	private String title;
	private String content;
	private int creatorId;
	private Date createTime;
	private Date lastEditTime;
	private int approverId;
	private Date approveTime;
	private int status;
	
	public Announcement() {}
	
	public Announcement(int id, String title, String content, int creatorId, Date createTime, Date lastEditTime,
			int approverId, Date approveTime, int status) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.creatorId = creatorId;
		this.createTime = createTime;
		this.lastEditTime = lastEditTime;
		this.approverId = approverId;
		this.approveTime = approveTime;
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
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
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
	
}
