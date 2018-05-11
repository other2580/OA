package myoa.entity;

public class MessageReception {
	
	private int id;
	/*private int messageId;
	private int receiverId;*/
	private int isRead;
	private int status;
	private Message message;
	private Employee employee;
	
	
	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public MessageReception() {}
	
	public MessageReception(int id,int isRead, int status) {
		this.id = id;
		this.isRead = isRead;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
