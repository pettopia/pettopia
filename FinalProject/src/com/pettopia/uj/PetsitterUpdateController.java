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

import com.pettopia.jw.IPetProfileDAO;
import com.pettopia.jw.PetprofileInsertDTO;

@Controller
public class PetsitterUpdateController
{
	
	// sqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	// 원칙적으로는 setter 구성해서 주입해야하지만 
	// @Autowired 를 통해 자동주입할 수 있게 됨
	@Autowired
	private SqlSession sqlSession;
	
	// 펫시터 업데이트 폼 액션 처리
	@RequestMapping(value = "/psprofileupdateform.action", method = RequestMethod.GET)
	public String petsitterInsertForm(Model model, HttpSession session, PetsitterDTO dto)
	{
		
		IPetsitterDAO dao = sqlSession.getMapper(IPetsitterDAO.class);
		
		HashMap<Object, String> paramMap = new HashMap<Object, String>();
		// 로그인한 세션 값(회원고유코드) 저장
		String code = (String) session.getAttribute("code");
		
		// 회원 고유코드 = code / ps_profile_seq 얻어오기
		paramMap.put("code", code);

		paramMap.put("ps_profile_seq", dao.search0(paramMap));

		// System.out.println(paramMap.get("ps_profile_seq")); // 프로필코드 뿌려지는지 확인

		
		// 회원 고유코드 = code / ps_profile_seq 얻어오기
	

		
		try
		{
			/*
			 * System.out.println("@@@@@@@@@@@@@@@@@@");
			 * System.out.println(dao.list2(paramMap));
			 * System.out.println(dao.list4(paramMap));
			 * System.out.println("@@@@@@@@@@@@@@@@@@");
			 */
		
			// 돌봄형태
			model.addAttribute("caretype", dao.list2(paramMap));
			
			// 자기소개
			model.addAttribute("pscontent", dao.search2(paramMap));

			
			// 돌봄 환경(이용서비스)
			model.addAttribute("service", dao.list4(paramMap));
			
			// 프로필 공개여부
			model.addAttribute("ps_open_seq", dao.list9(paramMap));
			// 사진
			model.addAttribute("filepath", dao.list5(paramMap));
			
			// 프로필 전체
			model.addAttribute("petprofile", dao.updateView(paramMap));
			
			
			// 전체은행명
			model.addAttribute("selectbank", dao.selectbank());
					
			ArrayList<PetsitterDTO> petcareList = dao.list3(paramMap);
			
			for (PetsitterDTO dto1 : petcareList)
			{
//				System.out.println(dto1.getPet_size_seq() + " " + dto1.getCarepay());
			}
			
			PetsitterDTO size1 = new PetsitterDTO();	// 대형 요금
			PetsitterDTO size2 = new PetsitterDTO();	// 중형 요금
			PetsitterDTO size3 = new PetsitterDTO();	// 소형 요금
			
			for (PetsitterDTO dto1 : petcareList)
			{
				if(dto1.getPet_size_seq().equals("1"))
				{
					size1.setPet_size_seq("1");
					size1.setCarepay(dto1.getCarepay());
				}
				if(dto1.getPet_size_seq().equals("2"))
				{
					size2.setPet_size_seq("2");
					size2.setCarepay(dto1.getCarepay());
				}
				if(dto1.getPet_size_seq().equals("3"))
				{
					size3.setPet_size_seq("3");
					size3.setCarepay(dto1.getCarepay());
				}
			}
			
			// 이용요금 (견종크기 / 돌봄금액)
			//model.addAttribute("petcare", dao.list3(paramMap));		// petcare : CAREPAY, PS_CARE_PAY_SEQ
			model.addAttribute("size1", size1);
			model.addAttribute("size2", size2);
			model.addAttribute("size3", size3);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		String result = null;

		result = "/WEB-INF/views/MyPage_ps.jsp";

		return result;

	}
	
	/* 펫시터 프로필 수정 액션 */
	@RequestMapping(value = "/psprofileupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofileupdate(Model model,HttpSession session, PetsitterUpdateDTO petsitterUpdatedto)
	{
		IPetsitterUpdateDAO dao = sqlSession.getMapper(IPetsitterUpdateDAO.class);
		String code = (String) session.getAttribute("code"); 	
		petsitterUpdatedto.setCode(code);
		
		//System.out.println(code);
		
		String ps_profile_seq = dao.searchCode(code);
		petsitterUpdatedto.setPs_profile_seq(ps_profile_seq);
		//System.out.println(ps_profile_seq);
		
//		System.out.println(petsitterUpdatedto.getPs_care_type_seq());
//		System.out.println(petsitterUpdatedto.getPscontent());
//		System.out.println(petsitterUpdatedto.getPs_open_seq());
//		System.out.println(petsitterUpdatedto.getPsaddrnumber());
//		System.out.println(petsitterUpdatedto.getPsaddr1());
//		System.out.println(petsitterUpdatedto.getPsaddr2());
//		System.out.println(petsitterUpdatedto.getPsaddr3());
//		System.out.println(petsitterUpdatedto.getBank_seq());
//		System.out.println(petsitterUpdatedto.getPsaccountname());
//		System.out.println(petsitterUpdatedto.getPsaccountnumber());
			
		try
		{
			dao.psprofileupdate(petsitterUpdatedto);
			
			 HashMap<Object, String> paramMap = new HashMap<Object, String>();
	         paramMap.put("ps_profile_seq", ps_profile_seq);
			// 이용 서비스 삭제
			dao.removeservice(ps_profile_seq);
			
			// 이용 서비스 arr 배열 생성
			
			
	         // paramMap.get("ps_profile_seq"); // 값 확인
	         String arr[] = petsitterUpdatedto.getPs_service_seq().split(",");
	         for (int i = 0; i < arr.length; i++)
	         {
	            paramMap.put("ps_service_seq", arr[i]);
	            //System.out.println(paramMap); // 출력해서 확인
	            dao.serviceinsert(paramMap); // 이용서비스 insert
//	            System.out.println(paramMap);
	         }
			
	         
			//펫시터 이용 요금 삭제
			//dao.removecarepay(ps_profile_seq);
			
			//펫시터 이용 요금 등록
			 
			
	         //String arr1[] = petsitterUpdatedto.getPet_size_seq().split(",");
	         //String arr2[] = petsitterUpdatedto.getCarepay().split(",");
	         
	
	         
	         
//	         System.out.println(dao.searchCode(code));
	         
//	         System.out.println(dao.selpscarepay(paramMap2));
	    
	         /*
	         for (int i = 0; i < arr1.length; i++)
	         {
	        	 paramMap2.put("pet_size_seq", arr1[i]);
				 paramMap2.put("carepay", arr2[i]);
	            //System.out.println(paramMap1); // 출력해서 확인
	            dao.carepayinsert(paramMap2); // 이용서비스 insert
	         }
			*/
	         HashMap<String, Object> paramMap2 = new HashMap<String, Object>();	
	         paramMap2.put("ps_profile_seq", dao.searchCode(code)); // 펫시터 고유키
//	         paramMap2.put("ps_care_pay_seq", dao.selpscarepay(paramMap2));  //중복키가 여러개 나올 수 있음.
	         ArrayList<HashMap<String, Object>> dataList = dao.selpscarepayList(paramMap2);
	         ArrayList<HashMap<String, Object>> carePaySeq = dao.selpscarepay(paramMap2);
	         
	         for(int i=0; i<dataList.size(); i++) {
	        	 if(petsitterUpdatedto.getPet_size_seq1().equals("Y"))	// 대형 : MyPage_ps,jsp 에서 size 값들 받아올 때 숫자 형식인지 체크해야함. 일단 패스,,
	        	 {
	        		 paramMap2.put("pet_size_seq", "1");
	        		 paramMap2.put("carepay", petsitterUpdatedto.getSize1()); 
	        		 
	        		 if(dataList.get(i).get("PET_SIZE_SEQ").toString().equals("1")) {
	        			 System.out.println("대형 사이즈 update");
	        			 dao.uppscarepay(paramMap2); // 이용서비스 insert
	        		 }else {
	        			 System.out.println("대형 사이즈 insert");
	        			 dao.inpscarepay(paramMap2);
	        		 }
	        		 //paramMap2.put("ps_care_pay_seq", dao.selpscarepay(paramMap2).get("ps_care_pay_seq"));
	        	 }
	        	 
	        	 System.out.println(petsitterUpdatedto.getPet_size_seq2());
	        	 if(petsitterUpdatedto.getPet_size_seq2().equals("Y"))	// 중형 : MyPage_ps,jsp 에서 size 값들 받아올 때 숫자 형식인지 체크해야함. 일단 패스,,
	        	 {
	        		 System.out.println(petsitterUpdatedto.getSize2());
	        		 paramMap2.put("pet_size_seq", "2");
	        		 paramMap2.put("carepay", petsitterUpdatedto.getSize2());
	        		 
	        		 if(dataList.get(i).get("PET_SIZE_SEQ").toString().equals("2")) {
	        			 System.out.println("중형 사이즈 update");
	        			 dao.uppscarepay(paramMap2); // 이용서비스 insert
	        		 }else {
	        			 System.out.println("중형 사이즈 insert");
	        			 System.out.println(paramMap2);
	        			 dao.inpscarepay(paramMap2);
	        		 }
	        	 }
	        	 
	        	 if(petsitterUpdatedto.getPet_size_seq3().equals("Y"))	// 소형 : MyPage_ps,jsp 에서 size 값들 받아올 때 숫자 형식인지 체크해야함. 일단 패스,,
	        	 {
	        		 System.out.println("여기타냐");
	        		 paramMap2.put("pet_size_seq", "3");
	        		 paramMap2.put("carepay", petsitterUpdatedto.getSize3());
	        		 
	        		 if(dataList.get(i).get("PET_SIZE_SEQ").toString().equals("3")) {
	        			 System.out.println("소형 사이즈 update");
	        			 dao.uppscarepay(paramMap2); // 이용서비스 insert
	        		 }else {
	        			 System.out.println("소형 사이즈 insert");
	        			 dao.inpscarepay(paramMap2);
	        		 }
	        	 }
	         }
	         
	         
	         
					
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

			return "redirect:petsitterview2.action";
	}
	
	
	
	

}
