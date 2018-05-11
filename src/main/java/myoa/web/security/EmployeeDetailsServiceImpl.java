package myoa.web.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.entity.Employee;
import myoa.entity.Function;

@Service("employeeDetailsService")
public class EmployeeDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private EmployeeBiz employeeBiz;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Employee employee = employeeBiz.fetchEmployeeByNr(username);
		List<Function> functions = employeeBiz.getFunctionById(employee.getId());
		List<SimpleGrantedAuthority> authority = new ArrayList<>();
		for(Function f : functions) {
			System.out.println(f.getCode());
			SimpleGrantedAuthority auth = new SimpleGrantedAuthority(f.getCode());
			authority.add(auth);
		}
		EmployeeDetailsImpl details = new EmployeeDetailsImpl(employee.getNr(), employee.getPassword(), employee, authority);
		return details;
	}

}
