
package com.pettopia.hj;

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
public class WalkController
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
/*
 * @RequestMapping(value = "/walkjoin.action", method = RequestMethod.POST)
 * public String WalkJoin(Model model, WalkJoinDTO dto, HttpSession session) {
 * String result = null; IWalkJoinDAO dao =
 * sqlSession.getMapper(IWalkJoinDAO.class);
 * 
 * // String pet_con_reg_seq = dao.list(); //
 * dto.setPet_con_reg_seq(pet_con_reg_seq);
 * 
 * //model.addAttribute("list", dao.list()); // seq, walk_nop_seq, walk_aim_seq,
 * region_mid_seq // , pet_con_reg_seq, pet_size_seq, walktitle, walkdate // ,
 * walkplace, writedate, views, gender_op_seq, age_op_seq, contents;
 * 
 * // String date = dto.getWalkdate(); // dto.setWalkdate(date.replace("T",
 * " ")); // // String pet_size_seq = dao.list(dto.getPet_con_reg_seq()); //
 * dto.setPet_size_seq(pet_size_seq); // //
 * System.out.println(dto.getSeq());//null //
 * System.out.println(dto.getWalk_nop_seq()); //
 * System.out.println(dto.getWalk_aim_seq()); //
 * System.out.println(dto.getRegion_mid_seq()); //
 * System.out.println(dto.getPet_con_reg_seq()); //null -- x 펫연결코드 //
 * System.out.println(dto.getPet_size_seq()); //null -- x 펫크기 //
 * System.out.println(dto.getWalktitle()); //
 * System.out.println(dto.getWalkdate()); //
 * System.out.println(dto.getWalkplace()); //
 * System.out.println(dto.getWritedate()); //
 * System.out.println(dto.getViews());//null //
 * System.out.println(dto.getGender_op_seq()); //
 * System.out.println(dto.getAge_op_seq());//null //
 * System.out.println(dto.getContents()); // // dao.walkinsert(dto);
 * 
 * result = "/WEB-INF/views/WalkMeeting.jsp";
 * 
 * return result; }
 */

@RequestMapping(value = "/walkjoin.action", method = RequestMethod.POST)
public String WalkJoin(Model model, WalkJoinDTO dto, HttpSession session, String walk_meeting_seq)
{
	String result = null; 
	IWalkJoinDAO dao = sqlSession.getMapper(IWalkJoinDAO.class);
//	IWalkMeetingDAO dao2 = sqlSession.getMapper(IWalkMeetingDAO.class);
//	String pet_con_reg_seq = dao.list();
//	dto.setPet_con_reg_seq(pet_con_reg_seq);
	
//	model.addAttribute("list", dao2.list(walk_meeting_seq));
	// seq, walk_nop_seq, walk_aim_seq, region_mid_seq
	//   , pet_con_reg_seq, pet_size_seq, walktitle, walkdate
	//   , walkplace, writedate, views, gender_op_seq, age_op_seq, contents;
	
//	model.addAttribute("walkjoinpart",dao.walkjoinpart(dto));
//	String pet_size_seq = dao.list(dto.getPet_con_reg_seq());
//	dto.setPet_size_seq(pet_size_seq);
	
	//산책참여코드, 산책모임코드, 펫연결코드
//	System.out.println(dto.getSeq());//null
//	System.out.println(dto.getWalk_nop_seq());
//	System.out.println(dto.getPet_con_reg_seq()); //null -- x 펫연결코드
	try 
    { 
		dao.walkjoin(dto);
       model.addAttribute("msg", "산책참여 완료"); 
       model.addAttribute("url","/WEB-INF/views/WalkMeeting.jsp");
    
    } catch (NullPointerException e) 
    { 
       model.addAttribute("msg", "산책참여 실패");
       model.addAttribute("url", "/WEB-INF/views/WalkMeeting.jsp");
    }
	System.out.println(dto.getPet_con_reg_seq());
	System.out.println(dto.getWalk_meeting_seq());
	System.out.println(walk_meeting_seq);

	
	
	
	
	
	
	result = "/WEB-INF/views/AlertAndClose.jsp";
	
	return result;
}


@RequestMapping(value = "/walkloginform.action", method = RequestMethod.GET)
public String walkloginform(Model model)
{
	String result = null;

	result = "/WEB-INF/views/LoginFormWalk.jsp";

	return result;
}

//검색 페이지 컨트롤러
@RequestMapping(value = "/walkfind.action", method = RequestMethod.GET)
public String WalkFind(Model model, HttpSession session)
{
	String result = null;
	
	IWalkFindDAO dao = sqlSession.getMapper(IWalkFindDAO.class);
	
	//model.addAttribute("list", dao.list());
	//model.addAttribute("doglist", dao.doglist((String)session.getAttribute("code")));
	model.addAttribute("addrlarname", dao.addrlarname());
	result = "/WEB-INF/views/WalkFind.jsp";
	
	return result;
}


//검색 폼 제출 컨트롤러
@RequestMapping(value = "/walkfindsubmit.action", method = RequestMethod.POST)
public String WalkFindSubmit(Model model, HttpSession session, WalkFindDTO dto)
{
	String result = null;
	IWalkFindDAO dao = sqlSession.getMapper(IWalkFindDAO.class);
	
	model.addAttribute("list", dao.list(dto));
	//model.addAttribute("doglist", dao.doglist((String)session.getAttribute("code")));
	
	
	result = "/WEB-INF/views/WalkListBoardSearch.jsp";
	
	return result;
}

@RequestMapping(value = "/walklogin.action", method = RequestMethod.POST)
public String WalkLogin(MyPageDTO dto, HttpSession session)
{
	String result = null;

	IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
			
	/*
	 * try { // 로그인 처리 → 대상에 따른 로그인 처리 방식 구분(분기) if (admin == null) { // 일반 사원 로그인
	 * name = dao.login(id, pw); } else { // 관리자 로그인 name = dao.loginAdmin(id, pw);
	 * }
	 * 	
	 * } catch (Exception e) { System.out.println(e.toString()); }
	 */

	// 로그인 성공 여부에 따른 분기(구분)
	if (dao.login(dto) == null)
	{
		// 로그인 실패 → 로그인 폼을 다시 요청할 수 있도록 안내
		result = "redirect:walklogin.action";
	} 
	else
	{
		session.setAttribute("id", dao.login(dto));
		session.setAttribute("code", dao.searchCode(dao.login(dto)));
		result = "redirect:walklist.action";

	}
	
	String codes = (String)session.getAttribute("code");
	
	result = "redirect:walklist.action?code="+codes;

	return result;
}


}
