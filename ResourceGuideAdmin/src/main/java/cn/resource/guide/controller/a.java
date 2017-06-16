package cn.resource.guide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class a {

	@RequestMapping(value="/hello")
	public String Hello (){
		System.out.println("hello");
		return "index";
	}
}
