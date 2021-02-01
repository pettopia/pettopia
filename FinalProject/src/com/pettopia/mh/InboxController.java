package com.pettopia.mh;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InboxController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/inbox.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String inbox(Model model, HttpSession session)
	{
		IInboxDAO dao = sqlSession.getMapper(IInboxDAO.class);
		
		String result = null;

		model.addAttribute("list",dao.receivelist((String)session.getAttribute("code")));
		model.addAttribute("count", dao.inboxcount((String)session.getAttribute("code")));
		result = "/WEB-INF/views/Inbox.jsp";

		return result;
	}

	
	@RequestMapping(value = "/sendinbox.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String sendinbox(Model model, HttpSession session)
	{
		IInboxDAO dao = sqlSession.getMapper(IInboxDAO.class);

		String result = null;

		model.addAttribute("list",dao.sendlist((String)session.getAttribute("code")));
		model.addAttribute("count", dao.sendcount((String)session.getAttribute("code")));

		result = "/WEB-INF/views/SendInbox.jsp";

		return result;
	}
	
	
	@RequestMapping(value = "/writemsg.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String writemsg(Model model, HttpSession session)
	{
		IInboxDAO dao = sqlSession.getMapper(IInboxDAO.class);

		String result = null;

		result = "/WEB-INF/views/WriteMsg.jsp";

		return result;
	}
	
	

}
