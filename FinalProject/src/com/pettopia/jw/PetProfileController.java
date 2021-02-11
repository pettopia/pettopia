/*==========================================
	PetProfileController.java
===========================================*/
package com.pettopia.jw;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pettopia.bk.FileDTO;
import com.pettopia.bk.IAdminDAO;
import com.pettopia.bk.IFileDAO;
import com.pettopia.bk.INotifyDAO;
import com.pettopia.bk.NotifyDTO;
import com.pettopia.mh.IMyPageDAO;
import com.pettopia.mh.MyPageDTO;


@Controller
public class PetProfileController
{
	@Autowired
	private SqlSession sqlSession;
	
	/* 펫 프로필 컨트롤러 */
	@RequestMapping(value = "/petprofilelist.action", method = RequestMethod.GET)
	public String petprofileList(String petId, Model model, HttpSession session)
	{
		String result = null;
		String code = (String)session.getAttribute("code");
		
		if(petId == null || code == null)
			return "redirect:petdiary.action";
			
		String str = "다이어리에서 체중을 등록하세요";
		
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		model.addAttribute("select", dao.select(petId));
		model.addAttribute("connect", dao.petConnect(petId));
		model.addAttribute("petdiaryselect", dao.petdiaryselect(petId));
		//model.addAttribute("weight", dao.weight(petId));		
		//model.addAttribute("weight", str);
		
		// 시간 value 값 넘겨주기 위한 코드
		String str1 = dao.select(petId).getBirth();
		
		// 공백 지우기
		str1 = str1.replaceAll(" " , "");		
		
		// StringBuffer로 재선언
		StringBuffer birth = new StringBuffer(str1);
		
		//System.out.println(birth);
		//--==>> 2015-10-0100:00:00
		
		// 분/초 단위 삭제
		birth.delete(10,19);
		
		//System.out.println(birth);
		//--==>> 2015-10-01
		
		// model 에 추가
		model.addAttribute("birth", birth);
		
		
		// 체중을 등록하지 않았을 경우
		if (dao.weight(petId) == null)
		{
			model.addAttribute("weight", str);
		}
		else
		{
			model.addAttribute("weight", dao.weight(petId));
		}
		
		//==================================================================
		// 펫 프로필 이미지 가져오기
		
		IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);
		FileDTO file = new FileDTO();
		file.setPetId(petId);
		
		if(Integer.parseInt(fileDao.petProfileImgCount(file)) == 0)
		{
			// 등록된 프로필 이미지가 없을 경우
			file.setFilepath("images/defaultPetProfile.png");
			model.addAttribute("img", file);
		}
		else
		{
			file = fileDao.petProfileImgSearch(file);
			String filepath = file.getFilepath();
			filepath = filepath.substring(filepath.indexOf("\\pds\\"));
			//System.out.println(filepath);
			file.setFilepath(filepath);
			
			model.addAttribute("img", file);
		}

		//==================================================================
		
		
		result = "WEB-INF/views/PetProfile.jsp";

		return result;
	}

	/* 회원의 펫 다이어리 조회 */
	@RequestMapping(value = "/mypetdiary.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petdiaryList(Model model, String code, HttpSession session)
	{
		String result = null;
		String member_code = (String) session.getAttribute("code");
		
		if (code==null||member_code==""||member_code==null)
			return "redirect:petdiary.action";

		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		model.addAttribute("petSelect", dao.petSelect(code));
		model.addAttribute("petShare", dao.petShare(code));
		model.addAttribute("sooncome", dao.sooncomediarylist(code));
		result = "WEB-INF/views/Diary.jsp";

		return result;
	}

	/* 다이어리 내용 상세 조회 */
	@RequestMapping(value = "/petdiarydetail.action", method = RequestMethod.GET)
	public String petdiarydetail(String diaryId, Model model)
	{
		String result = null;
		
		if (diaryId==null)
			return "redirect:petdiary.action";
		

		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		model.addAttribute("petdiarydetail", dao.selectdetail(diaryId));

		result = "WEB-INF/views/PetDiaryDetail.jsp";

		return result;
	}

	/* 다이어리 등록 폼 연결 컨트롤러 */
	@RequestMapping(value = "/petdiaryinsertform.action", method = RequestMethod.GET)
	public String petdiaryinsertform(Model model, String petId)
	{
		String result = null;
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		model.addAttribute("larname", dao.diarylarname());
		model.addAttribute("petId", petId);

		result = "WEB-INF/views/PetScheduleInsert.jsp";
		return result;
	}

	/* ajax 처리를 이용 하여 대분류(선택한 버튼) 에 따라 중분류 select 박스 안에 option 생성 */
	@RequestMapping(value = "/midnameajax.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String nickList(Model model, String s)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		String result = null;

		StringBuffer str = new StringBuffer();

		model.addAttribute("diarymidname", dao.diarymidname(s));

		for (PetDiarySelectDTO dto : dao.diarymidname(s))
		{
			str.append("<option value= " + dto.getDiary_mid_id() + ">" + dto.getMidName() + "</option>");
			
		}

		model.addAttribute("result", str);

		result = "/WEB-INF/views/MidNameAjax.jsp";

		return result;
	}

	/* 펫 다이어리 등록 */
	@RequestMapping(value = "/petdiaryinsert.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String petdiaryinsert(Model model, String petId, HttpSession session, PetDiaryInsertDTO insertdto)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		// System.out.println("petId : " + petId);

		// 세션값을 받아 회원 고유 코드 저장
		String code = (String) session.getAttribute("code");
		insertdto.setCode(code);
		
		String startdate = insertdto.getStartdate();
		insertdto.setStartdate(startdate.replace("T", " "));
		
		String enddate = insertdto.getEnddate();
		insertdto.setEnddate(enddate.replace("T", " "));
		
		
		// System.out.println("code : " + code);

		// 펫 고유코드 값 저장

		// System.out.println(insertdto.getTitle());
		// System.out.println(insertdto.getPlace());
		// System.out.println(insertdto.getStartdate());
		// System.out.println(insertdto.getEnddate());
		// System.out.println(insertdto.getDiary_mid_id());
		// System.out.println(insertdto.getContent());

		try
		{

			// 펫연결코드값 저장
			PetDiaryInsertDTO BKdto = new PetDiaryInsertDTO();
			BKdto.setCode(code);
			BKdto.setPetId(petId);

			String petconcode = dao.petconcode(BKdto);
			// System.out.println(petconcode);
			insertdto.setPetconcode(petconcode);

			dao.adddiary(insertdto);
			model.addAttribute("petId", petId);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return "redirect:petprofilelist.action";
	}

	/* 펫 다이어리 수정 폼 연결 컨트롤러 */
	@RequestMapping(value = "/petdiaryupdateform.action", method = RequestMethod.GET)
	public String petdiaryupdateform(Model model, String petId, String diaryId,PetDiaryInsertDTO insertdto)
	{
		//if (petId==null||diaryId==null)
		//	return "redirect:petdiary.action";
		
		String result = null;
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		model.addAttribute("larname", dao.diarylarname());
		model.addAttribute("petId", petId);
		model.addAttribute("petdiarydetail", dao.selectdetail(diaryId));
		model.addAttribute("diaryId", diaryId);
		//System.out.println(dao.selectdetail(diaryId).getStartDate());
		
		String str = dao.selectdetail(diaryId).getStartDate();
		str = str.replaceAll(" " , "");
		System.out.println(str);
				
		StringBuffer startdate = new StringBuffer(str);
		/* dao.selectdetail(diaryId).setStartDate(startdate.replace("", "T")); */
		
		startdate.insert(10, "T");
		/* 2021-01-23T00:00:00 */
		
		// 일정 시작날짜 년도 달 일 만 뽑아내기
		String std = startdate.substring(0,10);
		
		System.out.println(std);
		//--==>> 2021-02-03
		
		//--==>>  일정 시작날짜 시 분 만 뽑아내기
		String stdtime = startdate.substring(11);
		System.out.println(stdtime);
		//--==>> 01:00:00
		
		
		String etr = dao.selectdetail(diaryId).getEndDate();
		etr = etr.replaceAll(" " , "");
		System.out.println(etr);
							
		StringBuffer enddate = new StringBuffer(etr);
		/* dao.selectdetail(diaryId).setStartDate(startdate.replace("", "T")); */
		
		enddate.insert(10, "T");
		/* 2021-01-23T00:00:00 */
		
		// 일정 종료 날짜 년도 달 일 만 뽑아내기
		String etd = startdate.substring(0,10);
		System.out.println(etd);
		
		// 일정 종료 날짜 시 분 만 뽑아내기
		String etdtime = enddate.substring(11);
		System.out.println(etdtime);
		
		
		
		
		model.addAttribute("startdate", std);
		model.addAttribute("startdatetime", stdtime);
		
		model.addAttribute("enddate", etd);
		model.addAttribute("enddatetime", etdtime);
				
		System.out.println(startdate);
		/*
		 * String enddate = insertdto.getEnddate();
		 * insertdto.setEnddate(enddate.replace("", "T"));
		 */

		result = "WEB-INF/views/PetScheduleUpdate.jsp";
		return result;
	}

	/* 펫 다이어리 수정 */
    @RequestMapping(value = "/petdiaryupdate.action", method ={RequestMethod.GET, RequestMethod.POST}) 
    public String petdiaryupdate(Model model,HttpSession session,PetDiaryInsertDTO insertdto,String diaryId) 
    {
		if (diaryId==null)
			return "redirect:petdiary.action";
	  
    	IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
    	// 세션값을 받아 회원 고유 코드 저장 
    	String code = (String)session.getAttribute("code");
    	insertdto.setCode(code); 
    	
    	String startdate = insertdto.getStartdate();
		insertdto.setStartdate(startdate.replace("T", " "));
		
		String enddate = insertdto.getEnddate();
		insertdto.setEnddate(enddate.replace("T", " "));
    	
    	try 
    	{    		
    		dao.modifydiary(insertdto);	
    	} 
    	catch(Exception e) 
    	{ 
    		System.out.println(e.toString()); 
    	}
	  
	  
    	return "redirect:mypetdiary.action?code=" + code + "";
	 }

    
	/* 펫 다이어리 삭제 */
	@RequestMapping(value = "/petdiaryremove.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petdiaryremove(Model model, String diaryId, PetDiarySelectDTO selectdto, HttpSession session)
	{

		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		String code = (String) session.getAttribute("code");
		selectdto.setCode(code);

		model.addAttribute("diaryremove", dao.removediary(diaryId));

		return "redirect:mypetdiary.action?code=" + code + "";
	}
	
	/* 펫 체중 폼 연결 컨트롤러 */
	@RequestMapping(value = "/petweightlistform.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petweightlistform(Model model,String petId)
	{
		String result = null;
		if (petId==null)
			return "redirect:petdiary.action";
		
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		
		model.addAttribute("petweight", dao.petweight(petId));
		model.addAttribute("select", dao.select(petId));
		model.addAttribute("petId", petId);
		
		//==================================================================
		// 펫 프로필 이미지 가져오기
		
		IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);
		FileDTO file = new FileDTO();
		file.setPetId(petId);
		
		if(Integer.parseInt(fileDao.petProfileImgCount(file)) == 0)
		{
			// 등록된 프로필 이미지가 없을 경우
			file.setFilepath("images/defaultPetProfile.png");
			model.addAttribute("img", file);
		}
		else
		{
			file = fileDao.petProfileImgSearch(file);
			String filepath = file.getFilepath();
			filepath = filepath.substring(filepath.indexOf("\\pds\\"));
			//System.out.println(filepath);
			file.setFilepath(filepath);
			
			model.addAttribute("img", file);
		}
		//==================================================================

		result = "WEB-INF/views/PetWeightList.jsp";
		return result;
	}
	
	/* 펫 체중 입력폼 연결 컨트롤러 */
	@RequestMapping(value = "/petweightinsertform.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petweightinsertform(Model model,String petId)
	{
		String result = null;
		if (petId==null)
			return "redirect:petdiary.action";
		
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		
		model.addAttribute("petweight", dao.petweight(petId));
		model.addAttribute("select", dao.select(petId));
		model.addAttribute("petId", petId);

		//==================================================================
		// 펫 프로필 이미지 가져오기
		
		IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);
		FileDTO file = new FileDTO();
		file.setPetId(petId);
		
		if(Integer.parseInt(fileDao.petProfileImgCount(file)) == 0)
		{
			// 등록된 프로필 이미지가 없을 경우
			file.setFilepath("images/defaultPetProfile.png");
			model.addAttribute("img", file);
		}
		else
		{
			file = fileDao.petProfileImgSearch(file);
			String filepath = file.getFilepath();
			filepath = filepath.substring(filepath.indexOf("\\pds\\"));
			//System.out.println(filepath);
			file.setFilepath(filepath);
			
			model.addAttribute("img", file);
		}
		//==================================================================
		
		result = "WEB-INF/views/PetWeightInsertform.jsp";
		return result;
	}
	
	/* 펫 체중 등록 */
	@RequestMapping(value = "/petweightinsert.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petweightinsert(Model model, String petId, HttpSession session,PetDiaryInsertDTO insertdto)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);

		String code = (String) session.getAttribute("code");
		insertdto.setCode(code);
		System.out.println(code);
		System.out.println(petId);
		try
		{

			// 펫연결코드값 저장
			PetDiaryInsertDTO BKdto = new PetDiaryInsertDTO();
			BKdto.setCode(code);
			BKdto.setPetId(petId);
			String petconcode = dao.petconcode(BKdto);
			System.out.println(petconcode);
					
			insertdto.setPetconcode(petconcode);

			dao.addpetweight(insertdto);
			model.addAttribute("petId", petId);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

			return "redirect:petweightlistform.action";
	}
	
	/* 펫 등록 폼 연결 컨트롤러 */
	@RequestMapping(value = "/petprofileinsertform.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petprofileinsertform(Model model, HttpSession session)
	{
		String code = (String) session.getAttribute("code");
		
		// 로그인되지 않은 상태라면 로그인폼 요청
		if (code==""||code==null)
		{
			session.setAttribute("rq_url", "petprofileinsertform.action");
			return "redirect:loginform.action";
		}
		
		String result = null;
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		
		model.addAttribute("breed", dao.breed());
		model.addAttribute("petsize",dao.petsize());

		result = "WEB-INF/views/PetprofileInsert.jsp";
		return result;
	}
		
	/* 펫 등록 */
	@RequestMapping(value = "/petprofileinsert.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofileinsert(Model model,HttpSession session,PetprofileInsertDTO petprofileInsertdto)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		String code = (String) session.getAttribute("code"); 
		petprofileInsertdto.setCode(code);
			
						
		try
		{
			dao.addpet(petprofileInsertdto);
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}			
			return "redirect:mypetdiary.action?code=" + code + "";
	}
	

	/* 펫 수정 */
	@RequestMapping(value = "/petprofileupdateform.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petdiaryupdateform(Model model,String petId)
	{
		String result = null;
		if (petId==null)
			return "redirect:petdiary.action";
		
		
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		
		model.addAttribute("breed", dao.breed());
		model.addAttribute("petsize",dao.petsize());
		model.addAttribute("select", dao.select(petId));
		model.addAttribute("petId", petId);
		
		IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);
		FileDTO file = new FileDTO();
		file.setPetId(petId);
		
		if(Integer.parseInt(fileDao.petProfileImgCount(file)) == 1)	// 등록된 프로필이미지가 있다면
		{
			model.addAttribute("img", fileDao.petProfileImgSearch(file));
		}		
		
		// 시간 value 값 넘겨주기 위한 코드
		String str = dao.select(petId).getBirth();
		
		// 공백 지우기
		str = str.replaceAll(" " , "");
		
		// StringBuffer로 재선언
		StringBuffer birth = new StringBuffer(str);
		
		//System.out.println(birth);
		
		// 10번째 줄에 T 추가하기
		birth.delete(10,19);
		
		System.out.println(birth);
		// model 에 추가
		model.addAttribute("birth", birth);
		

		result = "WEB-INF/views/PetprofileUpdate.jsp";
		return result;
	}
	
	/* 펫 프로필 수정 */
	@RequestMapping(value = "/petprofileupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofileupdate(Model model,HttpSession session,PetprofileInsertDTO petprofileInsertdto, String petId, HttpServletRequest request)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		String code = (String) session.getAttribute("code"); 
		System.out.println(code);
		petprofileInsertdto.setCode(code);
		
		/*
		System.out.println(petprofileInsertdto.getPetName());
		System.out.println(petprofileInsertdto.getBreedId());
		System.out.println(petprofileInsertdto.getSizeId());
		System.out.println(petprofileInsertdto.getPetGender());
		System.out.println(petprofileInsertdto.getPetBirth());
		System.out.println(petprofileInsertdto.getPetGender());
		System.out.println(petprofileInsertdto.getPetNum());
		*/
		
		//==================================================================
		// form 태그 enctype="multipart/form-data" 속성 추가 후
		
		//String root = request.getSession().getServletContext().getRealPath("/");	// 프로젝트 절대경로
		//System.out.println(root);
		//String savePath = root + "pds" + File.separator + "petProfileImg";
		// 절대경로에 저장할 경우, 다른 팀원들이 업로드한 사진을 볼 수 없으므로 WebContent/img 폴더에 저장함.
		
		String savePath = "C:\\GitHub\\pettopia\\FinalProject\\WebContent\\img\\" + "pds" + File.separator + "petProfileImg";
		File dir = new File(savePath);
		
		if(!dir.exists())
			dir.mkdirs();
		
		int maxFileSize = 5*1024*1024;	// 최대 5MB
		String encType = "UTF-8";		// UTF-8 로 인코딩
		
		try
		{
			// MultipartRequest(request, 저장경로, 최대크기, 인코딩방식, 중복파일명처리정책)
			MultipartRequest req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());

			petId = req.getParameter("petId");

			System.out.println(req.getParameter("petId"));
			System.out.println(req.getParameter("petName"));
			System.out.println(req.getParameter("breedId"));
			System.out.println(req.getParameter("sizeId"));
			System.out.println(req.getParameter("petGender"));
			System.out.println(req.getParameter("petBirth"));
			System.out.println(req.getParameter("neutral"));
			System.out.println(req.getParameter("petNum"));
			System.out.println(req.getFilesystemName("file"));		// 서버에 저장된 파일명
			System.out.println(req.getOriginalFileName("file"));	// 업로드한 파일명
			
			petprofileInsertdto.setPetId(req.getParameter("petId"));
			petprofileInsertdto.setPetName(req.getParameter("petName"));
			petprofileInsertdto.setBreedId(req.getParameter("breedId"));
			petprofileInsertdto.setSizeId(req.getParameter("sizeId"));
			petprofileInsertdto.setPetGender(req.getParameter("petGender"));
			petprofileInsertdto.setPetBirth(req.getParameter("petBirth"));
			petprofileInsertdto.setNeutral(req.getParameter("neutral"));
			petprofileInsertdto.setPetNum(req.getParameter("petNum"));
			
			File file = req.getFile("file");
			if(file.exists())
			{
				System.out.println("이미지 크기 : " + file.length());
				
				IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);	// 파일 업로드 dao
				FileDTO fileDto = new FileDTO();
				
				fileDto.setPetId(req.getParameter("petId"));
				fileDto.setFilepath(savePath + File.separator + req.getFilesystemName("file"));
				
				//System.out.println(savePath + File.separator + req.getFilesystemName("file"));
				//System.out.println(Integer.parseInt(fileDao.petProfileImgCount(fileDto)));
				
				if(Integer.parseInt(fileDao.petProfileImgCount(fileDto)) == 0)	// 등록된 펫 이미지가 없으면
					fileDao.petProfileImgInsert(fileDto);
				else
					fileDao.petProfileImgUpdate(fileDto);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		//==================================================================
		
		try
		{
			dao.petmodify(petprofileInsertdto);
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

			return "redirect:petprofilelist.action?petId=" + petId + "";
	}
	
	/* 펫 프로필 삭제 */
	@RequestMapping(value = "/petprofiledelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofiledelete(Model model,HttpSession session,PetprofileInsertDTO petprofileInsertdto,String petId)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		String code = (String) session.getAttribute("code"); 
		petprofileInsertdto.setCode(code);
		System.out.println(petId);
		
		try
		{
			dao.petdelete(petId);
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

			return "redirect:mypetdiary.action?code=" + code + "";
	}
	
	/* 펫 공유폼 연결 컨트롤러 */
	@RequestMapping(value = "/petprofileshareform.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petprofileshareform(Model model,HttpSession session)
	{
		String result = null;
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		String code = (String) session.getAttribute("code"); 
		
		// 로그인되지 않은 상태라면 로그인폼 요청
		if (code==""||code==null)
		{
			session.setAttribute("rq_url", "petprofileshareform.action");
			return "redirect:loginform.action";
		}
		
		model.addAttribute("petSelect", dao.petSelect(code));
		

		result = "WEB-INF/views/PetprofileShare.jsp";
		return result;
	}
	
	/* 펫 공유신청 등록 */
	@RequestMapping(value = "/petprofileshare.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofileshare(Model model,HttpSession session,PetshareDTO petsharedto,String petId,String memberNick)	
	{
		if(petId==null||memberNick==null)
			return "redirect:loginform.action";
		
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		
		String code = (String) session.getAttribute("code"); 
				
		//System.out.println(petId);
		//System.out.println(memberNick);
		
		String membercode = dao.membercodeselect(memberNick);
		petsharedto.setMembercode(membercode);
		
		//System.out.println(membercode);
		
		try
		{
			dao.addpetshare(petsharedto);
			
			PetshareDTO dto = new PetshareDTO();	// 펫연결신청코드를 얻기위한 매개변수
			dto.setPetId(petId);
			dto.setMembercode(membercode);
			
			// 신청된 펫연결신청코드 조회
			String pet_con_req_seq = dao.searchPetConReqCode(dto);

			
			System.out.println("연결신청 후 펫연결신청코드 : " + pet_con_req_seq);

			// 알림 전송 dao, dto
			IAdminDAO adminDao = sqlSession.getMapper(IAdminDAO.class);
			NotifyDTO notify = new NotifyDTO();
			notify.setMember_reg_code(adminDao.searchMemberRegCode(membercode));
			System.out.println("알림받을 회원등록번호 : "+notify.getMember_reg_code());
			notify.setReference_code(pet_con_req_seq);	// 펫공유신청코드 전달
			notify.setNotify_type_code("NO-000001");	// 펫시터 공유 알림 코드
			
			adminDao.notifyInsert(notify);
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

			return "redirect:mypetdiary.action?code=" + code + "";
	}
	
	/* 공유 할 회원의 닉네임 확인 여부 ajax */
	@RequestMapping(value = "/nickajax1.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String nickList1(Model model,String nickName)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);
		
		String result = null;
		
		String str = "";
				
		for (MyPageDTO dto : dao.nicklist())
		{
			if (dto.getNick().equals(nickName))
			{
				str = "공유가능한 닉네임 입니다.";
				break;
			} else
			{
				str = "공유하지 못하는 닉네임 입니다";
			}
		}

		model.addAttribute("result", str);

		result = "/WEB-INF/views/NickAjax.jsp";

		return result;
	}
	
	/* 공유 수락 처리 - 펫 연결 등록 */
	@RequestMapping(value = "/petprofileshareok.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String petprofileshareOk(NotifyDTO notify, String pet_con_req_seq)
	{
		IPetProfileDAO dao = sqlSession.getMapper(IPetProfileDAO.class);
		INotifyDAO notifyDao = sqlSession.getMapper(INotifyDAO.class);
		
		notifyDao.notifyUpdate(notify);	// 읽은 알람으로 처리
		dao.petConReg(pet_con_req_seq);	// 펫 연결 등록
		
		return "redirect:notify.action";
	}
	
	/* 펫 프로필 이미지 등록 */
	
	
	
	
	
	
	
	
	
			

	

}