package myoa.entity;

import java.util.ArrayList;
import java.util.List;

public class Role {
	private int id;
	private String name; // 角色名称
	private List<Function> functions = new ArrayList<>(); // 功能集合

	public Role() {}

	public Role(int id, String name, List<Function> functions) {
		super();
		this.id = id;
		this.name = name;
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

	public List<Function> getFunctions() {
		return functions;
	}

	public void setFunctions(List<Function> functions) {
		this.functions = functions;
	}
	
}
