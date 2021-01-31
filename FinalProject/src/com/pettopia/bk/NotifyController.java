/*==========================
	NotifyController.java
==========================*/

package com.pettopia.bk;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class NotifyController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 새 알람 조회
	@RequestMapping(value = "notify.action", method = RequestMethod.GET)
	public String board(Model model, HttpSession session)
	{
		INotifyDAO dao = sqlSession.getMapper(INotifyDAO.class);
		
		model.addAttribute("newNotifyList", dao.newNotifyList((String)session.getAttribute("code")));
		model.addAttribute("count", dao.newNotifyCount((String)session.getAttribute("code")));
		model.addAttribute("nick", (String)session.getAttribute("nick"));
		
		return "WEB-INF/views/Notify.jsp";
	}
	
	
}
