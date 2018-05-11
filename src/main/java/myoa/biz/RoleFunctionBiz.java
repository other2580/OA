package myoa.biz;

public interface RoleFunctionBiz {
	
	/**
	 * 删除不存在的
	 * @param id 角色rid
	 * @param check 不存在的fid
	 */
	void delRoleFunction(int rid, int fid);
	
	
	
	/**
	 * 角色新增权限
	 * @param rid 角色id
	 * @param fid 权限id
	 */
	void addRoleFunction(int rid, int fid);

}
