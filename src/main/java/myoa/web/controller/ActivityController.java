package myoa.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ActivityController {

	@RequestMapping("/calendar")
	public String cctivity() {
		return "calendar";
	}
	
}
