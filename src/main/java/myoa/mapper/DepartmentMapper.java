package myoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import myoa.entity.Department;

@Repository
public interface DepartmentMapper {

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
	
	
	List<Department> fetchDepartmentAll();
	
	Department fetchDepartmentById(@Param("id") int id);
	
	/**
	 * 查询所有部门信息
	 */
	@Select("select * from Department")
	List<Department> findAll();

}
