package com.pettopia.jw;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController
{

	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session)
	{
		String result = null;
		
		session.removeAttribute("id");
		session.removeAttribute("code");
		session.removeAttribute("nick");
		session.removeAttribute("ps");
		result = "redirect:main.action";

		return result;
	}

	
}
