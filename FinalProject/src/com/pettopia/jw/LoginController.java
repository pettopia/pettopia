/*=========================
   StudentController.java
=========================*/
package com.pettopia.jw;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pettopia.mh.IMyPageDAO;
import com.pettopia.mh.MyPageDTO;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/loginform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginform(HttpSession session, HttpServletRequest request)
	{
		String rq_url = (String)request.getHeader("REFERER");
		
		session.setAttribute("rq_url", rq_url);	// 로그인 이전의 페이지로 돌아가기위한 session 값
			
		// 현재 로그인된 상태라면 세션 제거 후 로그인 폼으로 이동
		if ( (String)session.getAttribute("code")!=null
				|| (String)session.getAttribute("id")!=null)
		{
			session.removeAttribute("id");
			session.removeAttribute("code");
			session.removeAttribute("nick");
		}
		
		return "/WEB-INF/views/LoginForm.jsp";
	}

	
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(Model model, MyPageDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
		
	
		// 로그인 성공 여부에 따른 분기(구분)
		if (dao.login(dto) == null)
		{
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/loginform.action");

			result = "/WEB-INF/views/Alert.jsp";
		} 
		else
		{
			session.setAttribute("code", dao.searchCode(dao.login(dto)));
			session.setAttribute("id", dao.login(dto));
			session.setAttribute("nick", dao.searchNick(dao.login(dto)));
			
			// 회원이 세션이 끊긴 채로 접근하여 loginform 으로 넘어온 경우
			// 원래 페이지로 되돌려주기
			if(session.getAttribute("rq_url")!=null)
			{
				String url = (String)session.getAttribute("rq_url");
				session.removeAttribute("rq_url");
				
				return "redirect:" + url;
			}
			
			result = "redirect:main.action";
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/loginanddiary.action", method = RequestMethod.GET)
	public String loginanddiary(Model model)
	{
		String result = null;

		result = "/WEB-INF/views/LoginFormDiary.jsp";

		return result;
	}

	@RequestMapping(value = "/logindiary.action", method = RequestMethod.POST)
	public String logindiary(MyPageDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		// 로그인 성공 여부에 따른 분기(구분)
		if (dao.login(dto) == null)
		{
			// 로그인 실패 → 로그인 폼을 다시 요청할 수 있도록 안내
			result = "redirect:loginanddiary.action";
		} 
		else
		{
			session.setAttribute("id", dao.login(dto));
			session.setAttribute("code", dao.searchCode(dao.login(dto)));
			session.setAttribute("nick", dao.searchNick(dao.login(dto)));
			result = "redirect:mypetdiary.action";

		}
		
		
		
		String codes = (String)session.getAttribute("code");
		
		result = "redirect:mypetdiary.action?code="+codes;

		return result;
	}

}