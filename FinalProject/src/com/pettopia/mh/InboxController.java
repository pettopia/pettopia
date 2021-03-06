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

	//톡톡함으로 이동
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

	//보낸톡톡함으로 이동
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
	
	//톡톡보내기 창으로 이동
	@RequestMapping(value = "/writemsg.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String writemsg(Model model, HttpSession session)
	{

		String result = null;

		result = "/WEB-INF/views/WriteMsg.jsp";

		return result;
	}
	
	//톡톡 insert action
	@RequestMapping(value = "/sendmsg.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String sendmsg(Model model, InboxDTO dto, HttpSession session, HttpServletRequest request)
	{
		IInboxDAO dao = sqlSession.getMapper(IInboxDAO.class);

		String result = null;

		dto.setMember_code_seq1((String)session.getAttribute("code"));
		dto.setMember_code_seq2(dao.findcode(request.getParameter("nick")));
		
		try
		{
			dao.add(dto);
			model.addAttribute("msg", "톡톡보내기 완료");
			model.addAttribute("url", "/writemsg.action");
			
		}catch(NullPointerException e)
		{
			model.addAttribute("msg", "톡톡보내기 실패");
			model.addAttribute("url", "/inbox.action");
		}
		
		result = "/WEB-INF/views/Alert.jsp";
		
		return result;
	}
	
	

}
