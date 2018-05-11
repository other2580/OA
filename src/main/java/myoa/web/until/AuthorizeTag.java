package myoa.web.until;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class AuthorizeTag extends TagSupport {
	
	private Object code;

	public Object getCode() {
		return code;
	}
	public void setCode(Object code) {
		this.code = code;
	}

	@Override
	public int doStartTag() throws JspException {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, String> map1 = new HashMap<>();
		Map<String, String> map2 = new HashMap<>();
		for(GrantedAuthority str : userDetails.getAuthorities()) {
			map1.put(str.getAuthority(), str.getAuthority());
		}
		String[] str = this.code.toString().split(",");
		for(String s : str) {
			map2.put(s, s);
		}
		for(Map.Entry<String, String> m :map1.entrySet()){
            	String m1value = m.getValue() == null?"":m.getValue();
                String m2value = map2.get(m.getKey())==null?"":map2.get(m.getKey());
            if (m1value.equals(m2value)) 
            	return EVAL_BODY_INCLUDE;
		}
		return SKIP_BODY;
	}
	
	
}
