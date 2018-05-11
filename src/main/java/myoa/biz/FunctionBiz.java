package myoa.biz;

import java.util.List;

import myoa.entity.Function;

public interface FunctionBiz {
	
	List<Function> fetchFunctions();
	
	List<Function> fetchChildrenFunctions(int parentId);
	
	List<Integer> fetchByFunctionId();
	
	Function fetchByRoleId(int id);
	
	int fetchParentIdById(int id);
	
	void add(Function function);
	
	List<Integer> fetchById(int id);
}
