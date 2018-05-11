package myoa.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.biz.EmployeeRoleBiz;
import myoa.mapper.EmployeeRoleMapper;

@Service
public class EmployeeRoleBizImpl implements EmployeeRoleBiz{

	@Autowired
	private EmployeeRoleMapper employeeRoleMapper;
	
	@Override
	public void delEmployeeRole(int id, int rid) {
		employeeRoleMapper.delEmployeeRole(id, rid);
	}

	@Override
	public void addEmployeeRole(int id, int rid) {
		employeeRoleMapper.addEmployeeRole(id, rid);
	}
	
	public static void main(String[] args) {
		EmployeeRoleBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(EmployeeRoleBiz.class);
		target.addEmployeeRole(1, 2);
	}
	
}
