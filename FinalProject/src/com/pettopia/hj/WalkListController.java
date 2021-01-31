
package com.pettopia.hj;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class WalkListController
{
// sqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
// 원칙적으로는 setter 구성해서 주입해야하지만 @Autowired 를 통해 자동주입할 수 있게 됨
@Autowired
private SqlSession sqlSession;

// 『@RequestMapping(value = "요청주소", method = 전송방식)』
// 이 때, 전송 방식은 submit 액션인 경우에만 POST
// 나머지 모든 전송 방식은 GET 으로 처리한다.
@RequestMapping(value = "/walklist.action", method = RequestMethod.GET)
public String WalkList(Model model,HttpSession session)
{
	String result = null;
	String code = (String)session.getAttribute("code");
	
	
	System.out.println(code);
	
	
	IWalkListDAO dao = sqlSession.getMapper(IWalkListDAO.class);
	
	model.addAttribute("nearlist", dao.nearlist(code));
	model.addAttribute("newlist",dao.newlist());
	model.addAttribute("list",dao.list());
	
	
	result = "/WEB-INF/views/WalkList.jsp";
	
	return result;
}


@RequestMapping(value = "/walklistboard.action", method = RequestMethod.GET)
public String WalkListBoard(Model model, HttpSession session)
{
	String result = null;
	IWalkListDAO dao = sqlSession.getMapper(IWalkListDAO.class);
	
	model.addAttribute("list", dao.list());
	
	
	result = "/WEB-INF/views/WalkListBoard.jsp";
	
	return result;
}

}
