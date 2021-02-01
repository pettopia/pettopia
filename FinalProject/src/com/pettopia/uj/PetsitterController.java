/*=========================
   PetsitterController.java
=========================*/
package com.pettopia.uj;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PetsitterController
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

	// 펫시터 신청 폼 액션 처리
	@RequestMapping(value = "/insertform.action", method = RequestMethod.GET)
	public String petsitterInsertForm1(Model model, HttpSession session)
	{
		String code = (String) session.getAttribute("code");

		String result = null;

		result = "/WEB-INF/views/PetsitterDocu.jsp";

		return result;

	}

	// 펫시터 프로필 폼 액션 처리
	@RequestMapping(value = "/petsitterform.action", method = RequestMethod.GET)
	public String petsitterInsertForm2(Model model, HttpSession session)
	{
		String code = (String) session.getAttribute("code");

		String result = null;

		result = "/WEB-INF/views/PetsitterInsertFormView.jsp";

		return result;

	}

	// 펫시터 신청 액션 처리
	@RequestMapping(value = "/petsitterinsert1.action", method = RequestMethod.POST)
	public String petsitterInsert1(PetsitterInsertDTO insertdto, HttpSession session)
	{

		IPetsitterInsertDAO dao = sqlSession.getMapper(IPetsitterInsertDAO.class);

		// 세션값을 받아 회원 고유 코드 저장
		String code = (String) session.getAttribute("code");
		insertdto.setCode(code);

		int result = -1;

		System.out.println(insertdto.getPscareer());
		System.out.println(insertdto.getFilepath());
		System.out.println(insertdto.getPromise_seq());
		System.out.println(insertdto.getAgree());

		try
		{
			result = dao.add(insertdto); // -- 펫시터 신청 INSERT

			// 펫시터 신청코드
			String ps_req_seq = dao.search0(insertdto);
			insertdto.setPs_req_seq(ps_req_seq);

			dao.add0(insertdto); // -- 경력증명서 테이블 INSERT
			dao.add1(insertdto); // -- 약관항목 동의 테이블 INSERT

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// System.out.println("result 가 0이면 인서트 실패, 1이면 성공. 지금 result 값 = " + result);

		return "redirect:petsitterlist.action";
	}

	// 펫시터 프로필 폼 액션 처리
	@RequestMapping(value = "/petsitterinsert2.action", method = RequestMethod.POST)
	public String petsitterInsert2(PetsitterInsertDTO insertdto, HttpSession session)
	{

		IPetsitterInsertDAO dao = sqlSession.getMapper(IPetsitterInsertDAO.class);

		// 세션값을 받아 회원 고유 코드 저장
		String code = (String) session.getAttribute("code");
		insertdto.setCode(code);
		
		
		int result = -1;
		// --코드 값 받아오는지 확인
		System.out.println(insertdto.getPs_reg_seq());
		System.out.println(insertdto.getPs_care_type_seq());
		System.out.println(insertdto.getPscontent());
		System.out.println(insertdto.getPs_service_seq());
		System.out.println(insertdto.getPs_open_seq());
		System.out.println(insertdto.getFilepath());
		System.out.println(insertdto.getPsaddrnumber());
		System.out.println(insertdto.getPsaddr1());
		System.out.println(insertdto.getPsaddr2());
		System.out.println(insertdto.getPsaddr3());
		System.out.println(insertdto.getBank_seq());
		System.out.println(insertdto.getPsaccountname());
		System.out.println(insertdto.getPsaccountnumber());
		//System.out.println(insertdto.getPs_profile_seq()); 
		System.out.println(insertdto.getPet_size_seq());
		System.out.println(insertdto.getCarepay());

		try
		{

			// 펫시터코드 값 저장
			String ps_reg_seq = dao.search1(insertdto);
			insertdto.setPs_reg_seq(ps_reg_seq);

			result = dao.add4(insertdto); // -- 펫시터 프로필 테이블 INSERT

			// 펫시터 프로필 코드 값 저장
			String ps_profile_seq = dao.search2(insertdto);
			insertdto.setPs_profile_seq(ps_profile_seq);

			String arr[] = insertdto.getPs_service_seq().split(",");

			// 이용서비스
			HashMap<Object, String> paramMap = new HashMap<Object, String>();
			paramMap.put("ps_profile_seq", ps_profile_seq);
			// paramMap.get("ps_profile_seq"); // 값 확인

			for (int i = 0; i < arr.length; i++)
			{
				paramMap.put("ps_service_seq", arr[i]);
				System.out.println(paramMap); // 출력해서 확인
				dao.add2(paramMap); // 이용서비스 insert
			}

			// 돌봄 환경 이미지 insert (사진 하나만 받기^^....?)
			dao.add3(insertdto);

			// 펫시터 이용 요금 등록
			String arr1[] = insertdto.getPet_size_seq().split(",");
			String arr2[] = insertdto.getCarepay().split(",");
			HashMap<Object, String> paramMap1 = new HashMap<Object, String>();

			paramMap1.put("ps_profile_seq", ps_profile_seq);

			for (int i = 0; i < arr1.length; i++)
			{
				paramMap1.put("pet_size_seq", arr1[i]);
				paramMap1.put("carepay", arr2[i]);
				System.out.println(paramMap1); // 출력해서 확인
				dao.add5(paramMap1); // 이용서비스 insert

			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// System.out.println("result 가 0이면 인서트 실패, 1이면 성공. 지금 result 값 = " + result);

		return "redirect:petsitterview2.action";
	}
	
	
	

	// list 액션 처리 시, 메인페이지로 이동
	@RequestMapping(value = "/petsitterlist.action", method = RequestMethod.GET)
	public String petsitterList(Model model)
	{
		String result = null;

		return "redirect:petsitter.action";

		// result = "WEB-INF/views/PetsitterList.jsp";
		

	}
	
	

	// 마이페이지 펫시터 뷰 보여지기 액션처리
	@RequestMapping(value = "/petsitterview2.action", method = RequestMethod.GET)
	public String petsitterView2(Model model, HttpSession session, PetsitterDTO dto) // Model 을 써도 됨
	{
		IPetsitterDAO dao = sqlSession.getMapper(IPetsitterDAO.class);

		HashMap<Object, String> paramMap = new HashMap<Object, String>();

		// 세션값을 받아 회원 고유 코드 저장
		

		//paramMap.put("ps_profile_seq", (String)session.getAttribute("ps"));	// seq : 펫시터프로필코드
		
		
		
			String code = (String) session.getAttribute("code");
			paramMap.put("code", code);	// code : 로그인한 멤버코드로


			// 펫시터 신청코드
			String ps_profile_seq = dao.search0(paramMap);	//search0으로 로그인한 회원코드 기준 ps_profile_seq 조회하여 변수만들기
			paramMap.put("ps_profile_seq", ps_profile_seq); // 해당 값 paramMap에 "ps_profile_seq"이름으로 저장

	
		
		System.out.println();
		// System.out.println(ps_profile_seq);
		// System.out.println(dao.search1(paramMap));
		//System.out.println(dao.list7(paramMap));
		//System.out.println(dao.promise(paramMap));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(paramMap.get("code"));
		System.out.println(paramMap.get("ps_profile_seq")); // <<-- 아까 이것도 왜 null이엇는지 모르겠어 그러네여 똑같이 쓴것같은데
		
		
		
		paramMap.get("ps_care_pay_seq");
		
		//System.out.println(dao.promise(paramMap));

		try
		{
			
			//model.addAttribut("ps_profile_seq" dao.search0(paramMap));
			model.addAttribute("petsitter", dao.search1(paramMap));
			model.addAttribute("sizetype", dao.list1(paramMap));
			model.addAttribute("caretype", dao.list2(paramMap));
			model.addAttribute("carepay", dao.list3(paramMap));
			model.addAttribute("pscontent", dao.search2(paramMap));
			model.addAttribute("service", dao.list4(paramMap));
			model.addAttribute("filepath", dao.list5(paramMap));
			model.addAttribute("review", dao.list6(paramMap));
			
			model.addAttribute("petname", dao.list7(paramMap));
			model.addAttribute("promise_seq", dao.promise(paramMap));
			

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return "WEB-INF/views/PetsitterView2.jsp";
	}

	
	
	
	
	// 펫시터 뷰 액션처리
	@RequestMapping(value = "/petsitterview.action", method = RequestMethod.GET)
	public String petsitterView(Model model, HttpSession session, String seq) // Model 을 써도 됨
	{
		IPetsitterDAO dao = sqlSession.getMapper(IPetsitterDAO.class);

		HashMap<Object, String> paramMap = new HashMap<Object, String>();

		// 세션값을 받아 회원 고유 코드 저장
		
		String code = (String) session.getAttribute("code");
		paramMap.put("code", code);	// code : 로그인한 멤버코드로

		//System.out.println(paramMap);
		
		//System.out.println(seq);
		

		paramMap.put("ps_profile_seq", seq);	// seq : 펫시터프로필코드

		// System.out.println(ps_profile_seq);
		// System.out.println(dao.search1(paramMap));
		//System.out.println(dao.list7(paramMap));
		//System.out.println(dao.promise(paramMap));
		System.out.println(paramMap.get("ps_profile_seq"));
		
		paramMap.get("ps_care_pay_seq");
		
		

		//System.out.println(dao.promise(paramMap));

		try
		{
			
			model.addAttribute("petsitter", dao.search1(paramMap));

			model.addAttribute("sizetype", dao.list1(paramMap));
			model.addAttribute("caretype", dao.list2(paramMap));
			model.addAttribute("carepay", dao.list3(paramMap));
			model.addAttribute("pscontent", dao.search2(paramMap));
			model.addAttribute("service", dao.list4(paramMap));
			model.addAttribute("filepath", dao.list5(paramMap));
			model.addAttribute("review", dao.list6(paramMap));
			
			model.addAttribute("petname", dao.list7(paramMap));
			model.addAttribute("promise_seq", dao.promise(paramMap));
			

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return "WEB-INF/views/PetsitterView.jsp";
	}
	
	
	

	// 펫시터 뷰에서 예약 액션처리 ? (데이터 넘기기)
	@RequestMapping(value = "/carereq.action", method = RequestMethod.POST)
	public String petsitterReq(PetsitterDTO dto, HttpSession session)
	{
		IPetsitterDAO dao1 = sqlSession.getMapper(IPetsitterDAO.class);

		HashMap<Object, String> paramMap = new HashMap<Object, String>();
		
		// 세션값을 받아 회원 고유 코드 저장
		String code = (String) session.getAttribute("code");
		paramMap.put("code", code);
		//System.out.println(paramMap);
		
		/* 
		 * 로그인한 회원의 펫 목록
		 * ArrayList<PetsitterDTO> ps_con_reg_seq = dao1.list7(paramMap);
		 * //paramMap.put("ps_care_pay_seq", ps_care_pay_seq);
		 * 
		 * for (PetsitterDTO dto1 : ps_con_reg_seq) {
		 * System.out.println(dto1.getPetname() + dto1.getPet_con_reg_seq()); }
		 */
		
		// 값 받아오는지 확인
		//System.out.println(dto.getPs_care_pay_seq());
		//System.out.println(dto.getPet_con_reg_seq()); 
		//System.out.println(dto.getStartdate());
		//System.out.println(dto.getEnddate());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(dto.getPromise_seq());
		System.out.println(dto.getAgree());
	
		
		try
		{
			
			// 펫시터코드 값 저장
			
			HashMap<Object, String> paramMap1 = new HashMap<Object, String>();
			
			paramMap1.put("code", code);

			paramMap1.put("ps_care_pay_seq", dto.getPs_care_pay_seq());
			paramMap1.put("pet_con_reg_seq", dto.getPet_con_reg_seq());
			paramMap1.put("startdate", dto.getStartdate());
			paramMap1.put("enddate", dto.getEnddate());

			paramMap1.put("promise_seq", dto.getPromise_seq());
			paramMap1.put("agree", dto.getAgree());
			
			
			dao1.addcarereq(paramMap1); 	// 이용서비스 insert
			dao1.promiseagree(paramMap1);	// 약관동의 INSERT 
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return "redirect:petsitterlist.action";
	}
	
	
	

}

