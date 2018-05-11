package myoa.biz.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.RoleBiz;
import myoa.entity.Function;
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
//		RoleBiz tar = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(RoleBiz.class);
//		Role list = tar.fetchRoleById(1);
//		for(Function function : list.getFunctions()) {
//			System.out.println(function.getCode());
//		}
		
		File file= new File("E:\\VS Code\\VSCodeSetup-x64-1.19.3.exe");  
		if (file.exists() && file.isFile()) {
            String fileName = file.getName();
            
            double pers = 1048576; //1024*1024  
            String s = "";
            long size = file.length();
            if(size>1024*1024)  
                s=String.format("%.2f", (double)size/pers)+"M";  
            else   
                s=String.format("%.2f", (double)size/(1024))+"KB";  
            
            System.out.println("文件"+fileName+"的大小是："+s);
            
            
        }
	}

}
