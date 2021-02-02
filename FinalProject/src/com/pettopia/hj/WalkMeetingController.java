
package com.pettopia.hj;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WalkMeetingController
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
@RequestMapping(value = "/walkmeeting.action", method = RequestMethod.GET)
public String WalkMeeting(Model model,String walk_meeting_seq, HttpSession session)
{
	String result = null;
	
	IWalkMeetingDAO dao = sqlSession.getMapper(IWalkMeetingDAO.class);
	IWalkCreateDAO dao2 = sqlSession.getMapper(IWalkCreateDAO.class);
//	IWalkCreateDAO dao = sqlSession.getMapper(IWalkCreateDAO.class);
	
//	model.addAttribute("list", dao.list());
	String code = (String)session.getAttribute("code");
	model.addAttribute("doglist", dao2.doglist(code));
	
	//확인
	System.out.println(walk_meeting_seq);
	System.out.println(code);
	
	HashMap<Object, String> h = new HashMap<Object, String>();
	h.put("walk_meeting_seq", walk_meeting_seq);
	h.put("code", code);
	
	model.addAttribute("list", dao.list(walk_meeting_seq));
	model.addAttribute("before", dao.before(walk_meeting_seq));
	model.addAttribute("beforelist", dao.beforelist(walk_meeting_seq));
	model.addAttribute("next", dao.next(walk_meeting_seq));
	model.addAttribute("nextlist", dao.nextlist(walk_meeting_seq));
	model.addAttribute("views", dao.views(walk_meeting_seq));
	
	model.addAttribute("count",dao.count(h));
	model.addAttribute("countnum",dao.countnum(walk_meeting_seq));
	model.addAttribute("nicklist",dao.nicklist(walk_meeting_seq));
	
	result = "/WEB-INF/views/WalkMeeting.jsp";
	
	return result;
}


}
