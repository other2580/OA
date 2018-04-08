package myoa.entity;

public class RoleFunction {
	
	private int id;
	private int roleId;
	private int functionId;
	
	public RoleFunction() {}
	
	public RoleFunction(int id, int roleId, int functionId) {
		this.id = id;
		this.roleId = roleId;
		this.functionId = functionId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getFunctionId() {
		return functionId;
	}
	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}
	
}
