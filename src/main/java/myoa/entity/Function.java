package myoa.entity;

public class Function {
	
	private int id;
	private String name;
	private String code;
	private int isMenuItem;
	private String menuLogo;
	private String menuEntry;
	private int parentId;

	public Function() {}

	public Function(int id, String name, String code, int isMenuItem, String menuLogo, 
			String menuEntry, int parentId) {
		this.id = id;
		this.name = name;
		this.code = code;
		this.isMenuItem = isMenuItem;
		this.menuLogo = menuLogo;
		this.menuEntry = menuEntry;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getIsMenuItem() {
		return isMenuItem;
	}
	public void setIsMenuItem(int isMenuItem) {
		this.isMenuItem = isMenuItem;
	}

	public String getMenuLogo() {
		return menuLogo;
	}
	public void setMenuLogo(String menuLogo) {
		this.menuLogo = menuLogo;
	}
	public String getMenuEntry() {
		return menuEntry;
	}

	public void setMenuEntry(String menuEntry) {
		this.menuEntry = menuEntry;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
}
