
package com.pettopia.hj;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class WalkCreateController
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
@RequestMapping(value = "/walkcreate.action", method = RequestMethod.GET)
public String WalkCreate(Model model, HttpSession session)
{
	String result = null;
	
	IWalkCreateDAO dao = sqlSession.getMapper(IWalkCreateDAO.class);
	
	model.addAttribute("list", dao.list());
	model.addAttribute("doglist", dao.doglist((String)session.getAttribute("code")));
	model.addAttribute("addrlarname", dao.addrlarname());
	
	result = "/WEB-INF/views/WalkCreate.jsp";
	
	return result;
}


@RequestMapping(value = "/walkcreateinsert.action", method = RequestMethod.POST)
public String WalkCreateInsert(Model model, WalkCreateInsertDTO dto, HttpSession session)
{
	String result = null; 
	IWalkCreateInsertDAO dao = sqlSession.getMapper(IWalkCreateInsertDAO.class);
	
//	String pet_con_reg_seq = dao.list();
//	dto.setPet_con_reg_seq(pet_con_reg_seq);
	
	//model.addAttribute("list", dao.list());
	// seq, walk_nop_seq, walk_aim_seq, region_mid_seq
	//   , pet_con_reg_seq, pet_size_seq, walktitle, walkdate
	//   , walkplace, writedate, views, gender_op_seq, age_op_seq, contents;
	
	String date = dto.getWalkdate();
	dto.setWalkdate(date.replace("T", " "));
	
	String pet_size_seq = dao.list(dto.getPet_con_reg_seq());
	dto.setPet_size_seq(pet_size_seq);
	
	System.out.println(dto.getSeq());//null
	System.out.println(dto.getWalk_nop_seq());
	System.out.println(dto.getWalk_aim_seq());
	System.out.println(dto.getRegion_mid_seq());
	System.out.println(dto.getPet_con_reg_seq()); //null -- x 펫연결코드
	System.out.println(dto.getPet_size_seq()); //null -- x 펫크기
	System.out.println(dto.getWalktitle());
	System.out.println(dto.getWalkdate());
	System.out.println(dto.getWalkplace());
	System.out.println(dto.getWritedate());
	System.out.println(dto.getViews());//null
	System.out.println(dto.getGender_op_seq());
	System.out.println(dto.getAge_op_seq());//null
	System.out.println(dto.getContents());
	
	dao.walkinsert(dto);
	
	result = "redirect:walklist.action";
	
	return result;
}

/* ajax 처리를 이용 하여 중분류 div 생성 */
@RequestMapping(value = "/walkcreateajax.action", method = {RequestMethod.GET, RequestMethod.POST})
public String regionlist(Model model,String s)
{
   IWalkCreateDAO dao = sqlSession.getMapper(IWalkCreateDAO.class);
   
   String result = null;
   
   StringBuffer str = new StringBuffer();
   
                 
   model.addAttribute("addrmidname", dao.addrmidname(s));
   
   for(WalkCreateDTO dto : dao.addrmidname(s))
   {
  	 str.append("<option value="+dto.getRegion_mid_seq() + ">" + dto.getMidname() + "</option>");
   }
   /*
    * str.append("<option value= " + dto.getDiary_mid_id() + " >" + dto.getMidName() + "</option>");
    * */
   model.addAttribute("result",str);

   result = "/WEB-INF/views/WalkCreateAjax.jsp";

   return result;
}




}
