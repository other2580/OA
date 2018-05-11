package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.FunctionBiz;
import myoa.entity.Function;
import myoa.mapper.FunctionMapper;

@Service
@Transactional(readOnly=true,timeout=60)
public class FunctionBizImpl implements FunctionBiz {

	@Autowired
	private FunctionMapper functionMapper;
	
	@Override
	public List<Function> fetchFunctions() {
		return functionMapper.fetchFunctions();
	}

	@Override
	public List<Function> fetchChildrenFunctions(int parentId) {
		return functionMapper.fetchChildrenFunctions(parentId);
	}
	
	@Override
	public List<Integer> fetchByFunctionId() {
		return functionMapper.fetchByFunctionId();
	}
	
	@Override
	public Function fetchByRoleId(int id) {
		return functionMapper.fetchByRoleId(id);
	}
	
	@Override
	public int fetchParentIdById(int id) {
		return functionMapper.fetchParentIdById(id);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, timeout=60)
	public void add(Function function) {
		functionMapper.add(function);
	}

	@Override
	public List<Integer> fetchById(int id) {
		return functionMapper.fetchById(id);
	}
	
}
