package com.pettopia.uj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.ibatis.session.SqlSession;

import com.pettopia.mh.IMyPageDAO;
import com.pettopia.mh.MyPageDTO;



@Controller
public class PsLoginCotroller
{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "/petsitterloginform.action", method = RequestMethod.GET)
	public String petsitterloginform(Model model)
	{
		String result = null;

		result = "/WEB-INF/views/LoginFormPetsitter.jsp";

		return result;
	}
	
	
	// 펫시터 신청으로 접속 시, 로그인 확인 후 접속 처리
	@RequestMapping(value = "/loginpetsitter.action", method = RequestMethod.POST)
	public String loginpetsitter(MyPageDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);


		// 로그인 성공 여부에 따른 분기(구분)
		if (dao.login(dto) == null)
		{
			// 로그인 실패 → 로그인 폼을 다시 요청
			result = "redirect:petsitterloginform.action";
		} 
		else
		{
			session.setAttribute("id", dao.login(dto));
			session.setAttribute("code", dao.searchCode(dao.login(dto)));
			result = "redirect:petsitterreq.action";
		}
		
		String code = (String)session.getAttribute("code");
		
		result = "redirect:petsitterreq.action"; 		
		
		return result;
	}

}
