package myoa.mapper;

import org.apache.ibatis.annotations.Param;

public interface RoleFunctionMapper {
	
	/**
	 * 删除不存在的
	 * @param id 角色rid
	 * @param check 不存在的fid
	 */
	void delRoleFunction(@Param("roleId")int roleId, @Param("functionId")int functionId);
	
	
	
	/**
	 * 角色新增权限
	 * @param rid 角色id
	 * @param fid 权限id
	 */
	void addRoleFunction(@Param("roleId")int roleId, @Param("functionId")int functionId);

}
