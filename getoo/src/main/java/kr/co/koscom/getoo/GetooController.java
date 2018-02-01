package kr.co.koscom.getoo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GetooController {

	@RequestMapping("/hi")
	public @ResponseBody String hi() {
		return "Hello, Spring Boot!";
	}
	
	@RequestMapping("/hello")
	public String index(Model model) {
		model.addAttribute("name", "getoo");
		return "hello";
	}
    

}