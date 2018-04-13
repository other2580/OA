package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import myoa.entity.Employee;

@Repository
public interface EmployeeBiz {

	/**
	 * 新增员工
	 * 
	 * @param employee
	 *            员工对象
	 */
	void add(Employee employee);

	/**
	 * 删除员工
	 * 
	 * @param id
	 *            员工Id
	 */
	void delete(@Param("id") int id);

	/**
	 * 修改员工信息
	 * 
	 * @param employee
	 *            员工对象
	 */
	void update(Employee employee);

	/**
	 * 根据员工Id查询员工信息
	 * 
	 * @param id
	 *            员工Id
	 * @return null OR 员工对象
	 */
	Employee fetchEmployeeById(@Param("id") int id);

	/**
	 * 根据员工编号查询员工信息
	 * 
	 * @param nr
	 *            员工编号
	 * @return 员工对象
	 */
	Employee fetchEmployeeByNr(@Param("nr") String nr);

	/**
	 * 获取所有员工信息
	 * 
	 * @return 员工对象集合
	 */
	List<Employee> fetchAllEmployee();
	
	/**
	 * 登录
	 * 
	 * @return 员工对象
	 */
	Employee checkLogin(@Param("nr") String nr,@Param("password") String password);
	
}
