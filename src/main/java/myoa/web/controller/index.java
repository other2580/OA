package myoa.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class index {
	
	@RequestMapping("/index")
	public String aa() {
		return "index";
	}
}
