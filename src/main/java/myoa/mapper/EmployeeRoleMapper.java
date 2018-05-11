package myoa.mapper;

import org.apache.ibatis.annotations.Param;

public interface EmployeeRoleMapper {

	/**
	 * 删除不存在的
	 * @param id 
	 * @param rid 
	 */
	void delEmployeeRole(@Param("id")int id, @Param("rid")int rid);
	
	
	
	/**
	 * 添加员工角色权限
	 * @param rid 
	 * @param rid 
	 */
	void addEmployeeRole(@Param("id")int id, @Param("rid")int rid);
	
}
