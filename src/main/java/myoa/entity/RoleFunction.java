package myoa.entity;

/**
 * 角色功能关系
 * 
 * @author 34761
 *
 */
public class RoleFunction {
	private int id;
	// private int roleId; // 角色Id
	// private int functionId; // 功能Id
	private Role role; // 角色对象
	private Function function; // 功能对象

	public RoleFunction() {
	}

	public RoleFunction(int id, Role role, Function function) {
		super();
		this.id = id;
		this.role = role;
		this.function = function;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Function getFunction() {
		return function;
	}

	public void setFunction(Function function) {
		this.function = function;
	}
}

