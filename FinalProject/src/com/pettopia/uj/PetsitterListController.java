package com.pettopia.uj;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pettopia.jw.IPetProfileDAO;
import com.pettopia.mh.IMyPageDAO;

@Controller
public class PetsitterListController
{
// sqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
// 원칙적으로는 setter 구성해서 주입해야하지만 @Autowired 를 통해 자동주입할 수 있게 됨
   @Autowired
   private SqlSession sqlSession;

// 『@RequestMapping(value = "요청주소", method = 전송방식)』
// 이 때, 전송 방식은 submit 액션인 경우에만 POST
// 나머지 모든 전송 방식은 GET 으로 처리한다.

	
	
	
   // 펫시터 리스트 action 처리
	@RequestMapping(value = "/petsitter.action", method = RequestMethod.GET)
	public String PetsitterList(Model model, HttpSession session, PetsitterListDTO dto)
	{
		String result = null;
		String code = (String)session.getAttribute("code");

		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);
		IPetsitterDAO dao1 = sqlSession.getMapper(IPetsitterDAO.class);
		

       
		
		try
		{
			HashMap<String, Object> paramMap = new HashMap<String, Object>();	
			
			
			// 게시물을 검색했을 경우
			paramMap.put("keyword", dto.getKeyword());
			
//			System.out.println(dto.getKeyword());
			System.out.println(paramMap);
			System.out.println(dao.profilelistsearch(paramMap));
			
			model.addAttribute("profile", dao.profilelistsearch(paramMap));

//			model.addAttribute("profile", dao.profile());
			
			if(code != null)	
			{
				model.addAttribute("psregcode", dao1.searchPsRegCode(code));
			}
			

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		result = "/WEB-INF/views/PetsitterList.jsp";

		return result;
	}
	
	
	
	// 펫시터 신청 action 처리
	@RequestMapping(value = "/petsitterreq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petsitterreq(Model model, HttpSession session, String code)
	{
		String result = null;
		
		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);
		IPetsitterDAO dao1 = sqlSession.getMapper(IPetsitterDAO.class);
		
		if((String)session.getAttribute("code") != null)	
		{
			
			model.addAttribute("psregcode", dao1.searchPsRegCode((String)session.getAttribute("code")));
			
		}

		result = "WEB-INF/views/PetsitterDocu.jsp";

		return result;
	}
	
	
	
	// 펫시터 프로필 상세보기 action 처리
	@RequestMapping(value = "/petsitterprofileview.action", method = RequestMethod.GET)
	public String petsitterprofileview(String seq, Model model)
	{
		String result = null;

		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);

		
		model.addAttribute("ps_profile_seq", dao.psprofileview(seq));

		result = "WEB-INF/views/PetsitterView.jsp";

		return result;
	}
	
	
	
	
}