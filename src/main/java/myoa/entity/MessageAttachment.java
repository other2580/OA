package myoa.entity;

public class MessageAttachment {
	
	private int id;
	private String name;
	private String fileUrl;
	private Message message;
	

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public MessageAttachment() {}
	
	public MessageAttachment(int id, String name, String fileUrl) {
		this.id = id;
		this.name = name;
		this.fileUrl = fileUrl;		
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
	
}
