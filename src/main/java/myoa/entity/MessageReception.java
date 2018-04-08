package myoa.entity;

public class MessageReception {
	
	private int id;
	private int messageId;
	private int receiverId;
	private int isRead;
	private int status;
	
	public MessageReception() {}
	
	public MessageReception(int id, int messageId, int receiverId, int isRead, int status) {
		this.id = id;
		this.messageId = messageId;
		this.receiverId = receiverId;
		this.isRead = isRead;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public int getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
