/*=========================
   StudentController.java
=========================*/
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
public class JoinController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/checkjoin.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String checkjoin(Model model, HttpSession session)
	{
		String result = null;
		
		if((String)session.getAttribute("code")!=null)
		{
			// 로그인된 회원이 직접 페이지 요청
			session.removeAttribute("code");
			
			return "redirect:adminloginform.action";
		}

		result = "/WEB-INF/views/CheckJoin.jsp";

		return result;
	}

	@RequestMapping(value = "/joinform.action", method = RequestMethod.POST)
	public String joinform(Model model, HttpServletRequest request)
	{
		String result = null;
		
		String[] arr = request.getParameterValues("chk");
		
		if(arr[0] == null || arr[1] == null)
		{
			result = "redirect:main.action";
		}
		else 
		{
			model.addAttribute("arr", arr);
			result = "/WEB-INF/views/JoinForm.jsp";
		}

		return result;
	}
	
	@RequestMapping(value = "/join.action", method = RequestMethod.POST)
	public String join(Model model, MyPageDTO dto, HttpSession session, String ssn1, String ssn2)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
		String result = null;
		
		try 
		{ 
			String ssn = ssn1 + ssn2;
			dto.setSsn(ssn);
			dao.join(dto);
			
			session.setAttribute("id", dao.login(dto));
			session.setAttribute("code", dao.searchCode(dao.login(dto)));
			session.setAttribute("nick", dao.searchNick(dao.login(dto)));

			model.addAttribute("msg", "회원가입이 완료되었습니다."); 
			model.addAttribute("url","/main.action");
		
		} catch (NullPointerException e) 
		{ 
			model.addAttribute("msg", "�쉶�썝媛��엯 �떎�뙣");
			model.addAttribute("url", "/checkjoin.action");
		}
		
		result = "/WEB-INF/views/Alert.jsp";
		return result;
	}
	
	@RequestMapping(value = "/idajax.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String idList(Model model, String idName)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		String str = "";

		for (MyPageDTO dto : dao.idlist())
		{
			if (dto.getId().equals(idName))
			{
				str = "이미 사용중인 아이디가 존재합니다.";
				break;
			} else
			{
				str = "사용 가능한 아이디입니다.";
			}
		}

		model.addAttribute("result", str);

		result = "/WEB-INF/views/IdAjax.jsp";

		return result;
	}

}