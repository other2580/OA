package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import myoa.entity.Department;

@Repository
public interface DepartmentBiz {

	/**
	 * 新增
	 */
	void add(Department department);

	/**
	 * 删除
	 */
	void delete(@Param("id") int id);

	/**
	 * 修改信息
	 */
	void update(Department department);
	
	
	@Select("SELECT * FROM Department")
	List<Department> fetchDepartmentAll();
	
	
	Department fetchDepartmentById(@Param("id") int id);
	
	List<Department> findAll();
}
