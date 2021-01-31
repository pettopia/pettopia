/*=========================
   StudentController.java
=========================*/
package com.pettopia.mh;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController
{
	@Autowired
	private SqlSession sqlSession;

	//마이페이지 홈 
	@RequestMapping(value = "/mypage.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String mypagelist(Model model, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		//세션의 code 값을 확인 후 펫시터 코드 반환 (펫시터 유무)
		if(dao.isps((String)session.getAttribute("code")) != null)
		{
			session.setAttribute("ps", dao.isps((String)session.getAttribute("code")));
		}
		model.addAttribute("list", dao.list((String) session.getAttribute("id")));

		result = "/WEB-INF/views/MyPage.jsp";

		return result;
	}
	
	@RequestMapping(value = "/mypage_ps.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String mypagepslist(Model model, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		model.addAttribute("list", dao.list((String) session.getAttribute("id")));

		result = "/WEB-INF/views/MyPage_ps.jsp";

		return result;
	}

	@RequestMapping(value = "/checkpwform.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String checkpwform(Model model, String n)
	{
		String result = null;

		model.addAttribute("n", n);

		result = "/WEB-INF/views/CheckPwForm.jsp";

		return result;
	}

	@RequestMapping(value = "/checkpw.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String checkpw(Model model, MyPageDTO dto, HttpSession session, String n)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		if (dao.login(dto) == null)
		{
			model.addAttribute("msg", "비밀번호를 확인하세요");
			model.addAttribute("url", "/checkpwform.action");
			result = "/WEB-INF/views/Alert.jsp";
		} else
		{
			if (n.equals("1"))
			{
				model.addAttribute("list", dao.list((String) session.getAttribute("id")));
				model.addAttribute("member_code_seq", (String)session.getAttribute("code"));
				result = "/WEB-INF/views/MyInfEditForm.jsp";
			} else if (n.equals("2"))
			{
				model.addAttribute("list", dao.list((String) session.getAttribute("id")));
				result = "/WEB-INF/views/ChangePwForm.jsp";
			}

		}

		return result;
	}

	// 회원정보 수정액션
	@RequestMapping(value = "/myinfedit.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String myinfedit(Model model, MyPageDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		session.setAttribute("id", dto.getId());
		session.setAttribute("code", dto.getMember_code_seq());
		
		try 
		{ 
			dao.modify(dto);
			model.addAttribute("msg", "회원정보 수정 성공"); 
			model.addAttribute("url","/mypage.action");
		
		} catch (NullPointerException e) 
		{ 
			model.addAttribute("msg", "회원정보 수정 실패");
			model.addAttribute("url", "/WEB-INF/views/MyInfEditForm.jsp");
		}	
		
		result = "/WEB-INF/views/Alert.jsp";
		return result;
	}

	// 비밀번호 변경폼
	@RequestMapping(value = "/changepwform.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String changepwform(Model model)
	{
		String result = null;

		result = "/WEB-INF/views/ChangePwForm.jsp";

		return result;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changepw.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String changepw(Model model, LoginDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		result = "redirect:changepwform.action";

		try
		{
			dao.modifyPw(dto);

			model.addAttribute("msg", "비밀번호 변경 성공! 다시 로그인해주세요");
			model.addAttribute("url", "/logout.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "비밀번호 변경 실패");
			model.addAttribute("url", "/changepwform.action");
		}

		result = "/WEB-INF/views/Alert.jsp";

		return result;
	}

	@RequestMapping(value = "/jusopopup.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String jusopopup(Model model, HttpSession session)
	{
		String result = null;

		result = "/WEB-INF/views/jusoPopup.jsp";

		return result;
	}

	@RequestMapping(value = "/nickajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String nickList(Model model, String nickName)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		String str = "";

		for (MyPageDTO dto : dao.nicklist())
		{
			if (dto.getNick().equals(nickName))
			{
				str = "이미 사용중인 이름이 존재합니다.";
				break;
			} else
			{
				str = "사용할 수 있는 이름입니다.";
			}
		}

		model.addAttribute("result", str);

		result = "/WEB-INF/views/NickAjax.jsp";

		return result;
	}

	
	@RequestMapping(value = "/myboardlist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myboardlist(Model model, HttpSession session)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		model.addAttribute("list", dao.myboard((String)session.getAttribute("code")));

		result = "/WEB-INF/views/MyBoardList.jsp";

		return result;
	}
	
	
	@RequestMapping(value = "/myreplylist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myreplylist(Model model, HttpSession session)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		model.addAttribute("list", dao.myreply((String)session.getAttribute("code")));

		result = "/WEB-INF/views/MyReplyList.jsp";

		return result;
	}
	

}