package myoa.entity;

public class MessageAttachment {
	
	private int id;
	private String name;
	private String fileUrl;
	private int messageId;
	
	public MessageAttachment() {}
	
	public MessageAttachment(int id, String name, String fileUrl, int messageId) {
		this.id = id;
		this.name = name;
		this.fileUrl = fileUrl;
		this.messageId = messageId;
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
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	
}
