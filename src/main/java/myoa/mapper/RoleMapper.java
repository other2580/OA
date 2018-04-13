package myoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import myoa.entity.Role;

@Repository
public interface RoleMapper {

	/**
	 * 新增角色
	 * 
	 * @param role
	 *            角色对象
	 */
	void add(Role role);

	/**
	 * 删除角色
	 * 
	 * @param id
	 *            角色Id
	 */
	void delete(@Param("id") int id);

	/**
	 * 修改角色
	 * 
	 * @param role
	 *            角色对象
	 */
	void update(Role role);

	/**
	 * 根据角色Id获取角色
	 * 
	 * @param id
	 *            角色Id
	 * @return null OR Role
	 */
	Role fetchRoleById(@Param("id") int id);

	/**
	 * 根据角色名获取角色
	 * 
	 * @param name
	 *            角色名
	 * @return null OR Role
	 */
	Role fetchRoleByName(@Param("name") String name);

	/**
	 * 获取全部角色
	 * 
	 * @return 角色对象集合
	 */
	List<Role> fetchAllRole();
	
}
