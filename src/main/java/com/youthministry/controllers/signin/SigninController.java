package com.youthministry.controllers.signin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SigninController {

	@RequestMapping(value={"/","/Signin", "/signin"}, method=RequestMethod.GET)
	public String signin(HttpServletRequest request) {
		System.out.println(request.getServletPath());
		return "Signin";
	}
}