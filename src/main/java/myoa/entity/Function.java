package myoa.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 功能
 * 
 * @author 34761
 *
 */
public class Function {
	private int id;
	private String name; // 功能名称
	private String code; // 功能编码
	private int isMenuItem; // 是否是菜单项
	private String menuLogo; // 菜单项的Logo
	private String menuEntry; // 菜单项入口Url
	// private int parentId; // 父级功能ID
	private Function parent; // 父级对象
	private List<Function> functions = new ArrayList<>(); // 功能集合

	public Function() {

	}

	public Function(int id, String name, String code, int isMenuItem, String menuLogo, String menuEntry,
			Function parent, List<Function> functions) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.isMenuItem = isMenuItem;
		this.menuLogo = menuLogo;
		this.menuEntry = menuEntry;
		this.parent = parent;
		this.functions = functions;
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

	public Function getParent() {
		return parent;
	}

	public void setParent(Function parent) {
		this.parent = parent;
	}

	public List<Function> getFunctions() {
		return functions;
	}

	public void setFunctions(List<Function> functions) {
		this.functions = functions;
	}
	
}
