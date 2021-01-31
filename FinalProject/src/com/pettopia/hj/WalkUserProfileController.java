
package com.pettopia.hj;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class WalkUserProfileController
{
// sqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
// 원칙적으로는 setter 구성해서 주입해야하지만 @Autowired 를 통해 자동주입할 수 있게 됨
@Autowired
private SqlSession sqlSession;

// 매개변수를 등록하는 과정에서 매개변수 목록에 적혀있는
// 클래스의 객체 정보는 스프링이 제공한다.

// 사용자의 요청 주소와 메소드를 매핑하는 과정 필요
// 『@RequestMapping(value = "요청주소", method = 전송방식)』
// 이 때, 전송 방식은 submit 액션인 경우에만 POST
// 나머지 모든 전송 방식은 GET 으로 처리한다.
@RequestMapping(value = "/walkuserprofile.action", method = RequestMethod.GET)
public String WalkUserProfile(Model model,String walk_meeting_seq)
{
	String result = null;
	
	IWalkUserProfileDAO dao = sqlSession.getMapper(IWalkUserProfileDAO.class);
	
	model.addAttribute("list", dao.list(walk_meeting_seq));
	
	result = "/WEB-INF/views/WalkUserProfile.jsp";
	
	return result;
}

@RequestMapping(value = "/walkselectpet.action", method = RequestMethod.GET)
public String WalkSelectPet(Model model,HttpSession session,String code, String walk_meeting_seq)
{
	String result = null;
	
	IWalkCreateDAO dao = sqlSession.getMapper(IWalkCreateDAO.class);
//	IWalkJoinDAO dao2 = sqlSession.getMapper(IWalkJoinDAO.class);
	
//	model.addAttribute("walkjoinpart",dao2.walkjoinpart(dto));
	model.addAttribute("walk_meeting_seq", walk_meeting_seq);
	model.addAttribute("doglist", dao.doglist((String)session.getAttribute("code")));
//	System.out.println("--");
//	System.out.println(dto.getRes());
//	System.out.println(res);
//	System.out.println("--");
	result = "/WEB-INF/views/WalkSelectPet.jsp";
	
	return result;
}

}
















