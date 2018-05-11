package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.DepartmentBiz;
import myoa.entity.Department;
import myoa.mapper.DepartmentMapper;

@Service
public class DepartmentBizImpl implements DepartmentBiz{

	@Autowired
	private DepartmentMapper departmentMapper;
	
	
	@Override
	public void add(Department department) {
		departmentMapper.add(department);
	}

	@Override
	public void delete(int id) {
		departmentMapper.delete(id);
	}

	@Override
	public void update(Department department) {
		departmentMapper.update(department);
	}

	@Override
	public List<Department> fetchDepartmentAll() {
		return departmentMapper.fetchDepartmentAll();
	}

	@Override
	public Department fetchDepartmentById(int id) {
		return departmentMapper.fetchDepartmentById(id);
	}

	@Override
	public List<Department> findAll() {
		// TODO Auto-generated method stub
		return departmentMapper.findAll();
	}

}
