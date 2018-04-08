package myoa.entity;

import java.util.Date;

public class Message {
	
	private int id;
	private String title;
	private String content;
	private int creatorId;
	private Date sendTime;
	private String receivers;
	private int level;
	private int status;
	private int isSent;
	
	public Message(){}
	
	public Message(int id, String title, String content, int creatorId, Date sendTime, String receivers, int level,
			int status, int isSent) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.creatorId = creatorId;
		this.sendTime = sendTime;
		this.receivers = receivers;
		this.level = level;
		this.status = status;
		this.isSent = isSent;
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
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getReceivers() {
		return receivers;
	}
	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIsSent() {
		return isSent;
	}
	public void setIsSent(int isSent) {
		this.isSent = isSent;
	}
	
}
