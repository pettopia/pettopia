/*=========================
   StudentController.java
=========================*/
package com.pettopia.mh;

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
import com.pettopia.bk.IFileDAO;

@Controller
public class MyPageController
{
	@Autowired
	private SqlSession sqlSession;

	//마이페이지 홈 
	@RequestMapping(value = "/mypage.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String mypagelist(Model model, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		//세션의 code 값을 확인 후 펫시터 코드 반환 (펫시터 유무)
		if(dao.isps((String)session.getAttribute("code")) != null)
		{
			session.setAttribute("ps", dao.isps((String)session.getAttribute("code")));
		}
		model.addAttribute("list", dao.list((String) session.getAttribute("id")));

		//==================================================================
		// 프로필 이미지 가져오기
		
		IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);
		FileDTO file = new FileDTO();
		file.setCode((String)session.getAttribute("code"));	// 회원고유코드
		file.setCode(fileDao.memberRegSeq(file));			// 회원등록코드
		//System.out.println("회원등록코드 확인 : " + file.getCode());
		
		if(Integer.parseInt(fileDao.profileImgCount(file)) == 0)
		{
			// 등록된 프로필 이미지가 없을 경우
			file.setFilepath("images/defaultProfile.png");
			model.addAttribute("img", file);
		}
		else
		{
			file = fileDao.profileImgSearch(file);
			String filepath = file.getFilepath();
			filepath = filepath.substring(filepath.indexOf("\\pds\\"));
			//System.out.println(filepath);
			file.setFilepath(filepath);
			
			model.addAttribute("img", file);
		}
		//==================================================================

		result = "/WEB-INF/views/MyPage.jsp";

		return result;
	}
	
	@RequestMapping(value = "/myprofileimgupdateform.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String myprofileimg(Model model, HttpSession session)
	{
		String result = null;

		result = "/WEB-INF/views/MyProfileImg.jsp";

		return result;
	}
	
	@RequestMapping(value = "/myprofileimgupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String myprofileimgupdate(Model model, HttpSession session, HttpServletRequest request)
	{
		String result = null;

		model.addAttribute("code", session.getAttribute("code"));

		//==================================================================
		// form 태그 enctype="multipart/form-data" 속성 추가 후
		
		//String root = request.getSession().getServletContext().getRealPath("/");	// 프로젝트 절대경로
		//System.out.println(root);
		//String savePath = root + "pds" + File.separator + "petProfileImg";
		// 절대경로에 저장할 경우, 다른 팀원들이 업로드한 사진을 볼 수 없으므로 WebContent/img 폴더에 저장함.
		
		String savePath = "C:\\GitHub\\pettopia\\FinalProject\\WebContent\\img\\" + "pds" + File.separator + "memberProfileImg";
		File dir = new File(savePath);
		
		if(!dir.exists())
			dir.mkdirs();
		
		int maxFileSize = 5*1024*1024;	// 최대 5MB
		String encType = "UTF-8";		// UTF-8 로 인코딩
		
		try
		{
			// MultipartRequest(request, 저장경로, 최대크기, 인코딩방식, 중복파일명처리정책)
			MultipartRequest req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());

			//System.out.println(req.getFilesystemName("file"));		// 서버에 저장된 파일명
			//System.out.println(req.getOriginalFileName("file"));	// 업로드한 파일명
			
			File file = req.getFile("file");
			if(file.exists())
			{
				//System.out.println("이미지 크기 : " + file.length());
				
				IFileDAO fileDao = sqlSession.getMapper(IFileDAO.class);	// 파일 업로드 dao
				FileDTO fileDto = new FileDTO();
				
				fileDto.setCode((String)session.getAttribute("code"));	// 회원고유코드로 set
				fileDto.setCode(fileDao.memberRegSeq(fileDto));			// 회원등록코드를 얻어 다시 set
				fileDto.setFilepath(savePath + File.separator + req.getFilesystemName("file"));
				
				if(Integer.parseInt(fileDao.profileImgCount(fileDto)) == 0)	// 등록된 펫 이미지가 없으면
					fileDao.profileImgInsert(fileDto);
				else
					fileDao.profileImgUpdate(fileDto);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		//==================================================================

		result = "/WEB-INF/views/Complete.jsp";

		return result;
	}
	
	@RequestMapping(value = "/mypage_ps.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String mypagepslist(Model model, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		model.addAttribute("list", dao.list((String) session.getAttribute("id")));

		result = "/WEB-INF/views/MyPage_ps.jsp";

		return result;
	}

	@RequestMapping(value = "/checkpwform.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String checkpwform(Model model, String n)
	{
		String result = null;

		model.addAttribute("n", n);

		result = "/WEB-INF/views/CheckPwForm.jsp";

		return result;
	}

	@RequestMapping(value = "/checkpw.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String checkpw(Model model, MyPageDTO dto, HttpSession session, String n)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		if (dao.login(dto) == null)
		{
			model.addAttribute("msg", "비밀번호를 확인하세요");
			model.addAttribute("url", "/checkpwform.action");
			result = "/WEB-INF/views/Alert.jsp";
		} else
		{
			if (n.equals("1"))
			{
				model.addAttribute("list", dao.list((String) session.getAttribute("id")));
				model.addAttribute("member_code_seq", (String)session.getAttribute("code"));
				result = "/WEB-INF/views/MyInfEditForm.jsp";
			} else if (n.equals("2"))
			{
				model.addAttribute("list", dao.list((String) session.getAttribute("id")));
				result = "/WEB-INF/views/ChangePwForm.jsp";
			}

		}

		return result;
	}

	// 회원정보 수정액션
	@RequestMapping(value = "/myinfedit.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String myinfedit(Model model, MyPageDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		session.setAttribute("id", dto.getId());
		session.setAttribute("code", dto.getMember_code_seq());
		
		try 
		{ 
			dao.modify(dto);
			model.addAttribute("msg", "회원정보 수정 성공"); 
			model.addAttribute("url","/mypage.action");
		
		} catch (NullPointerException e) 
		{ 
			model.addAttribute("msg", "회원정보 수정 실패");
			model.addAttribute("url", "/WEB-INF/views/MyInfEditForm.jsp");
		}	
		
		result = "/WEB-INF/views/Alert.jsp";
		return result;
	}

	// 비밀번호 변경폼
	@RequestMapping(value = "/changepwform.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String changepwform(Model model)
	{
		String result = null;

		result = "/WEB-INF/views/ChangePwForm.jsp";

		return result;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changepw.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String changepw(Model model, LoginDTO dto, HttpSession session)
	{
		String result = null;

		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		result = "redirect:changepwform.action";

		try
		{
			dao.modifyPw(dto);

			model.addAttribute("msg", "비밀번호 변경 성공! 다시 로그인해주세요");
			model.addAttribute("url", "/logout.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "비밀번호 변경 실패");
			model.addAttribute("url", "/changepwform.action");
		}

		result = "/WEB-INF/views/Alert.jsp";

		return result;
	}

	@RequestMapping(value = "/jusopopup.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String jusopopup(Model model, HttpSession session)
	{
		String result = null;

		result = "/WEB-INF/views/jusoPopup.jsp";

		return result;
	}

	@RequestMapping(value = "/nickajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String nickList(Model model, String nickName)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		String str = "";

		for (MyPageDTO dto : dao.nicklist())
		{
			if (dto.getNick().equals(nickName))
			{
				str = "이미 사용중인 이름이 존재합니다.";
				break;
			} else
			{
				str = "사용할 수 있는 이름입니다.";
			}
		}

		model.addAttribute("result", str);

		result = "/WEB-INF/views/NickAjax.jsp";

		return result;
	}

	
	@RequestMapping(value = "/myboardlist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myboardlist(Model model, HttpSession session)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		model.addAttribute("list", dao.myboard((String)session.getAttribute("code")));

		result = "/WEB-INF/views/MyBoardList.jsp";

		return result;
	}
	
	
	@RequestMapping(value = "/myreplylist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myreplylist(Model model, HttpSession session)
	{
		IMyPageDAO dao = sqlSession.getMapper(IMyPageDAO.class);

		String result = null;

		model.addAttribute("list", dao.myreply((String)session.getAttribute("code")));

		result = "/WEB-INF/views/MyReplyList.jsp";

		return result;
	}
	

}