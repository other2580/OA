package myoa.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.RoleFunctionBiz;
import myoa.mapper.RoleFunctionMapper;

@Service
public class RoleFunctionBizImpl implements RoleFunctionBiz{

	@Autowired
	private RoleFunctionMapper rf;
	
	@Override
	public void delRoleFunction(int rid, int fid) {
		rf.delRoleFunction(rid, fid);
	}

	@Override
	public void addRoleFunction(int rid, int fid) {
		rf.addRoleFunction(rid, fid);
	}
	
}
