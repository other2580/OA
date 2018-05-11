package myoa.entity;

public class Department {
	
	private int id;
	private String name;
	private String fixedPhone;
	private String movePhone;
	private String fax;
	private String description;
	private int status;
	
	
	public Department(){}
	public Department(int id, String name, String fixedPhone, String movePhone, String fax, String description,
			int status) {
		super();
		this.id = id;
		this.name = name;
		this.fixedPhone = fixedPhone;
		this.movePhone = movePhone;
		this.fax = fax;
		this.description = description;
		this.status = status;
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
	public String getFixedPhone() {
		return fixedPhone;
	}
	public void setFixedPhone(String fixedPhone) {
		this.fixedPhone = fixedPhone;
	}
	public String getMovePhone() {
		return movePhone;
	}
	public void setMovePhone(String movePhone) {
		this.movePhone = movePhone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	
}
