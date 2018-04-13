package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.biz.RoleBiz;
import myoa.entity.Role;
import myoa.mapper.RoleMapper;

@Service
public class RoleBizImpl implements RoleBiz{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public void add(Role role) {
		roleMapper.add(role);
	}

	@Override
	public void delete(int id) {
		roleMapper.delete(id);
	}

	@Override
	public void update(Role role) {
		roleMapper.update(role);
	}

	@Override
	public Role fetchRoleById(int id) {
		return roleMapper.fetchRoleById(id);
	}

	@Override
	public Role fetchRoleByName(String name) {
		return roleMapper.fetchRoleByName(name);
	}

	@Override
	public List<Role> fetchAllRole() {
		return roleMapper.fetchAllRole();
	}
	
	public static void main(String[] args) {
		RoleBiz tar = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(RoleBiz.class);
		List<Role> list = tar.fetchAllRole();
		for(Role role : list) {
			System.out.println(role.getName());
		}
	}

}
