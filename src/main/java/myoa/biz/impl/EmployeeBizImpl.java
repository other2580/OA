package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.entity.Employee;
import myoa.mapper.EmployeeMapper;

@Service
public class EmployeeBizImpl implements EmployeeBiz{

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public void add(Employee employee) {
		employeeMapper.add(employee);
	}

	@Override
	public void delete(int id) {
		employeeMapper.delete(id);
	}

	@Override
	public void update(Employee employee) {
		employeeMapper.update(employee);
	}

	@Override
	public Employee fetchEmployeeById(int id) {
		return employeeMapper.fetchEmployeeById(id);
	}

	@Override
	public Employee fetchEmployeeByNr(String nr) {
		return employeeMapper.fetchEmployeeByNr(nr);
	}

	@Override
	public List<Employee> fetchAllEmployee() {
		return employeeMapper.fetchAllEmployee();
	}

	@Override
	public Employee checkLogin(String nr, String password) {
		return employeeMapper.checkLogin(nr, password);
	}
	
	public static void main(String[] args) {
		EmployeeBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(EmployeeBiz.class);
		//修改员工
//		Employee employee = new Employee();
//		employee.setGender(1);
//		employee.setId(6);
//		target.update(employee);
		
		//添加新员工
//		Department department = new Department();
//		department.setId(1);
//		Employee employee = new Employee();
//		employee.setNr("Nr007");
//		employee.setPassword("123");
//		employee.setName("李大钊");
//		employee.setGender(1);
//		employee.setEmail("54446382@qq.comm");
//		employee.setDepartment(department);
//		employee.setIsManager(0);
//		employee.setStatus(1);
//		target.add(employee);
		
		//删除员工
//		target.delete(7);
		
//		System.out.println(target.fetchEmployeeById(1).getEmail());
		
//		System.out.println(target.fetchEmployeeByNr("Nr006").getEmail());
		
		List<Employee> list = target.fetchAllEmployee();
		for(Employee map : list) {
			System.out.println(map.getId()+"   "+map.getDepartment().getName());
		}
		
	}

}

















