package myoa.web.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import myoa.entity.Employee;

@SuppressWarnings("serial")
public class EmployeeDetailsImpl implements UserDetails {
	
	public EmployeeDetailsImpl(String username, String password, Employee employee, List<SimpleGrantedAuthority> authority) {
		this.username = username;
		this.password = password;
		this.employee = employee;
		this.authority = authority;
	}

	private String username;
	private String password;
	private Employee employee;

	private List<SimpleGrantedAuthority> authority;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authority;
	}
	
	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	public Employee getEmployee() {
		return employee;
	}

}
