/*==========================
	AdminController.java
==========================*/

package com.pettopia.bk;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인 페이지 요청
	@RequestMapping(value = "adminloginform.action", method = RequestMethod.GET)
	public String adminLoginForm()
	{	
		return "WEB-INF/views/admin/AdminLogin.jsp";
	}
	
	// 관리자 로그인 처리
	@RequestMapping(value = "adminlogin.action", method = RequestMethod.POST)
	public String adminLogin(AdminDTO admin, Model model, HttpSession session)
	{
		String adminCode = (String)session.getAttribute("adminCode");
		
		if (adminCode != null)	// 관리자로 로그인되어있는 상황
			return "redirect:adminmain.action";
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String code = null;
		
		try
		{
			if (admin.getId().equals("master"))
			{
				code = dao.masterLogin(admin);	// 마스터 계정 로그인
				
			} else	
			{
				code = dao.adminLogin(admin);	// 관리자 계정 로그인
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 로그인 성공 여부에 따른 분기
		if (code==null)		// 로그인 실패
		{	
			return "WEB-INF/views/admin/AdminLoginErr.jsp";
			
		} else				// 로그인 성공
		{
			session.setAttribute("adminCode", code);
			
			return "redirect:adminmain.action";			
		}
	}// end adminLogin()
	
	
	// 관리자 로그아웃 페이지
	@RequestMapping(value = "adminlogout.action", method = RequestMethod.GET)
	public String logout(HttpSession session)
	{
		// 관리자 로그인 세션 제거
		session.removeAttribute("adminCode");
		
		return "redirect:adminloginform.action";
	}// end logout()
	
	
	// 관리자 메인 페이지 요청
	@SuppressWarnings("unused")
	@RequestMapping(value = "/adminmain.action", method = RequestMethod.GET)
	public String adminMain(Model model, HttpSession session)
	{	
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminMainDAO dao = sqlSession.getMapper(IAdminMainDAO.class);
		
		// 관리자 메인 > 신규 가입회원 목록 관련 데이터
		model.addAttribute("updateTime", dao.updateTime());
		model.addAttribute("today", dao.today());
		model.addAttribute("totMember", dao.totMember());
		model.addAttribute("todayNewMember", dao.todayNewMember());
		model.addAttribute("todayWithdrawMember", dao.todayWithdrawMember());
		model.addAttribute("newMemberList", dao.newMemberList());
		

		// 관리자 메인 > 펫시터 신청 목록 관련 데이터
		model.addAttribute("petsitterRegList", dao.petsitterRegList());		
		// 관리자 메인 > 회원 신고 접수 목록 관련 데이터
		model.addAttribute("memberReportRegList", dao.memberReportRegList());
		// 관리자 메인 > 게시물 신고 접수 목록 관련 데이터
		model.addAttribute("boardReportRegList", dao.boardReportRegList());
		// 관리자 메인 > 댓글 신고 접수 목록 관련 데이터
		model.addAttribute("replyReportRegList", dao.replyReportRegList());
		// 관리자 메인 > 1:1 문의 접수 목록 관련 데이터
		model.addAttribute("inquiryReportRegList", dao.inquiryReportRegList());
		
		return "/WEB-INF/views/admin/AdminMain.jsp";
	} // end adminMain()
	
	
	// 회원 상세 정보
	@RequestMapping(value = "userinfodetail.action", method = RequestMethod.GET)
	public String userInfoDetail(MemberDTO member, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("member", dao.userInfo(member));
		
		return "WEB-INF/views/admin/UserInfoDetail.jsp";
	}// end userInfoDetail()
	
	//------------------------------------------------------------------------------------------------------------------------------
	// 펫시터 신청 내역 상세정보
	@RequestMapping(value = "psreqinfodetail.action", method = RequestMethod.GET)
	public String psReqInfoDetail(PetsitterRegDTO petsitter, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		FileDTO doc = new FileDTO();
		doc.setReqcode(petsitter.getReqcode());

		ArrayList<FileDTO> documentList = dao.psDocList(doc);
		
		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		model.addAttribute("petsitter", dao.psReqInfo(petsitter));
		model.addAttribute("documentList", documentList);
		model.addAttribute("refReasonList", dao.psRefReasonList());
		
		return "WEB-INF/views/admin/PetSitterApplicationDetail.jsp";
	}
	
	// 펫시터 신청 승인 처리
	@RequestMapping(value = "psreg.action", method = RequestMethod.GET)
	public String psApproval(HttpSession session, String reqcode)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		PsApprovalDTO petsitter = new PsApprovalDTO();

		petsitter.setReqcode(reqcode);
		petsitter.setMg_code(adminCode);
		
		dao.psReqApproval(petsitter);
		
		NotifyDTO notify = dao.psReqMember(reqcode);
		notify.setNotify_type_code("NO-000002");
		
		dao.notifyInsert(notify);	// 알림 전송
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	// 펫시터 신청 반려 처리
	@RequestMapping(value = "psref.action", method = RequestMethod.POST)
	public String psDisapproval(HttpSession session, PsApprovalDTO petsitter)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		petsitter.setMg_code(adminCode);
		
		dao.psReqDisapproval(petsitter);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	
	// 펫시터 승인 내역 조회
	@RequestMapping(value = "petsitterdetail.action", method = RequestMethod.GET)
	public String petsitterDetail(PetsitterRegDTO petsitter, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		FileDTO doc = new FileDTO();	// 증빙서류 리스트
		doc.setReqcode(petsitter.getReqcode());
		// 함수가 파일경로를 반환함
		ArrayList<FileDTO> documentList = dao.psDocList(doc);

		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		if ( dao.psProfile(petsitter)!=null )	// 관리자가 승인한 후 회원이 프로필을 작성했다면
		{
			PsProfileDTO profile = new PsProfileDTO();	// 프로필 데이터
			profile.setProfile_code(dao.psProfile(petsitter).getProfile_code());	// 펫시터프로필코드 정보
			ArrayList<FileDTO> imgList = dao.psImgList(profile);	// 돌봄환경 이미지 리스트
			
			for (FileDTO dto : imgList)
			{
				if(dto.getFilepath().indexOf("\\") > 0)
				{
					File f = new File(dto.getFilepath());
					dto.setFilepath(f.getParentFile().toString());
					dto.setFilename(f.getName());				
				}
				else
					dto.setFilename(dto.getFilepath());
			}
			
			model.addAttribute("imgList", imgList);					// 돌봄환경 이미지
			model.addAttribute("profile", dao.psProfile(petsitter));		// 등록 프로필 조회
			model.addAttribute("serviceList", dao.psServiceList(profile));	// 이용가능 서비스 목록
		}
		
		model.addAttribute("petsitter", dao.psReg(petsitter));	// 신청 승인내역
		model.addAttribute("documentList", documentList);		// 신청 증빙서류 목록
		
		return "WEB-INF/views/admin/PetSitterDetail.jsp";
	}
	
	
	// 펫시터 거절 내역 조회
	@RequestMapping(value = "psrefinfodetail.action", method = RequestMethod.GET)
	public String petsitterrefDetail(Model model, PetsitterRegDTO petsitter, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		FileDTO doc = new FileDTO();
		doc.setReqcode(petsitter.getReqcode());

		ArrayList<FileDTO> documentList = dao.psDocList(doc);
		

		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		model.addAttribute("petsitter", dao.psRef(petsitter));
		model.addAttribute("documentList", documentList);
		
		
		return "WEB-INF/views/admin/PetSitterApplicationDisapproval.jsp";
	}
	
	//------------------------------------------------------------------------------------------------------- 회원 신고 관련 컨트롤
	
	// 회원 신고 접수 내역 상세정보
	@RequestMapping(value = "userreportdetail.action", method = RequestMethod.GET)
	public String userReportDetail(UserReportDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		ArrayList<FileDTO> documentList = dao.usDocList(report);	// 첨부파일 목록
		

		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		model.addAttribute("report", dao.usReportInfo(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		model.addAttribute("documentList", documentList);
		
		return "WEB-INF/views/admin/UserReportDetail.jsp";
	}
	
	// 회원 신고 접수 승인 처리
	@RequestMapping(value = "usreportreg.action", method = RequestMethod.POST)
	public String usApproval(HttpSession session, UserReportDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);
		
		
		System.out.println(report.getCode());
		System.out.println(report.getMgcontent());
		System.out.println(report.getMg_code());
				
		dao.usReqApproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	// 회원 신고 접수 반려 처리
	@RequestMapping(value = "usreportref.action", method = RequestMethod.POST)
	public String usDisapproval(HttpSession session, UserReportDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);
		
		dao.usReqDisapproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	
	// 회원 신고 승인 내역 조회
	@RequestMapping(value = "uswarningdetail.action", method = RequestMethod.GET)
	public String usReportRegDetail(UserReportDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		ArrayList<FileDTO> documentList = dao.usDocList(report);	// 첨부파일 목록
		

		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		model.addAttribute("report", dao.usReg(report));
		model.addAttribute("documentList", documentList);
		
		return "WEB-INF/views/admin/UserWarningDetail.jsp";
	}
	
	
	// 회원 신고 반려 내역 조회
	@RequestMapping(value = "usreportrefdetail.action", method = RequestMethod.GET)
	public String usReportRefDetail(Model model, UserReportDTO report, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		ArrayList<FileDTO> documentList = dao.usDocList(report);	// 첨부파일 목록
		

		for (FileDTO dto : documentList)
		{
			if(dto.getFilepath().indexOf("\\") > 0)
			{
				File f = new File(dto.getFilepath());
				dto.setFilepath(f.getParentFile().toString());
				dto.setFilename(f.getName());				
			}
			else
				dto.setFilename(dto.getFilepath());
		}
		
		model.addAttribute("report", dao.usRef(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		model.addAttribute("documentList", documentList);
		
		return "WEB-INF/views/admin/UserReportDisapproval.jsp";
	}
	
	//------------------------------------------------------------------------------------------------------- 게시물 신고 관련 컨트롤
	
	// 게시물 신고 접수 내역 상세정보
	@RequestMapping(value = "contentsreportdetail.action", method = RequestMethod.GET)
	public String contentsReportDetail(BoardReportRegDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.contentsReportInfo(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		
		return "WEB-INF/views/admin/ContentsReportDetail.jsp";
	}
	
	// 게시물 신고 접수 승인 처리
	@RequestMapping(value = "contentsreportreg.action", method = RequestMethod.POST)
	public String contentsApproval(HttpSession session, BoardReportRegDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);
		
		dao.contentsReqApproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	// 게시물 신고 접수 반려 처리
	@RequestMapping(value = "contentsreportref.action", method = RequestMethod.POST)
	public String contentsDisapproval(HttpSession session, BoardReportRegDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);				
		
		dao.contentsReqDisapproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	
	// 게시물 신고 승인 내역 조회
	@RequestMapping(value = "contentsblind.action", method = RequestMethod.GET)
	public String contentsBlind(BoardReportRegDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.contentsReg(report));
		
		return "WEB-INF/views/admin/ContentsWarningDetail.jsp";
	}
	
	
	// 게시물 신고 반려 내역 조회
	@RequestMapping(value = "contentsreportrefdetail.action", method = RequestMethod.GET)
	public String contentsReportRefDetail(Model model, BoardReportRegDTO report, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.contentsRef(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		
		return "WEB-INF/views/admin/ContentsReportDisapproval.jsp";
	}
	
	//------------------------------------------------------------------------------------------------------- 게시물 신고 관련 컨트롤
	
	// 댓글 신고 접수 내역 상세정보
	@RequestMapping(value = "replyreportdetail.action", method = RequestMethod.GET)
	public String replyReportDetail(ReplyReportRegDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.replyReportInfo(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		
		return "WEB-INF/views/admin/ReplyReportDetail.jsp";
	}
	
	// 댓글 신고 접수 승인 처리
	@RequestMapping(value = "replyreportreg.action", method = RequestMethod.POST)
	public String replyApproval(HttpSession session, ReplyReportRegDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);
		
		dao.replyReqApproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	// 댓글 신고 접수 반려 처리
	@RequestMapping(value = "replyreportref.action", method = RequestMethod.POST)
	public String replyDisapproval(HttpSession session, ReplyReportRegDTO report)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		report.setMg_code(adminCode);		
		
		dao.replyReqDisapproval(report);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	
	// 댓글 신고 승인 내역 조회
	@RequestMapping(value = "replyblind.action", method = RequestMethod.GET)
	public String replyBlind(ReplyReportRegDTO report, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.replyReg(report));
		
		return "WEB-INF/views/admin/ReplyWarningDetail.jsp";
	}
	
	
	// 댓글 신고 반려 내역 조회
	@RequestMapping(value = "replyreportrefdetail.action", method = RequestMethod.GET)
	public String replyReportRefDetail(Model model, ReplyReportRegDTO report, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("report", dao.replyRef(report));
		model.addAttribute("refReasonList", dao.reportRefReasonList());
		
		return "WEB-INF/views/admin/ReplyReportDisapproval.jsp";
	}
	
	//------------------------------------------------------------------------------------------------------- 게시물 신고 관련 컨트롤
	
	// 1:1 문의 접수 내역 상세정보
	@RequestMapping(value = "inquirydetail.action", method = RequestMethod.GET)
	public String inquiryDetail(InquiryRegDTO inquiry, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("inquiry", dao.inquiryInfo(inquiry));
		
		return "WEB-INF/views/admin/InquiryDetail.jsp";
	}
	
	// 1:1 문의 답변 처리
	@RequestMapping(value = "inquirycomplete.action", method = RequestMethod.POST)
	public String inquiryComplete(HttpSession session, InquiryRegDTO inquiry)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		inquiry.setMg(adminCode);
		
		dao.inquiryComplete(inquiry);
		
		return "WEB-INF/views/admin/Complete.jsp";
	}
	
	// 1:1 문의 접수 처리한 답변 내역 조회
	@RequestMapping(value = "inquiryanswer.action", method = RequestMethod.GET)
	public String inquiryAnswer(InquiryRegDTO inquiry, Model model, HttpSession session)
	{
		String adminCode = (String) session.getAttribute("adminCode");
		//System.out.println(adminCode);	// 세션 확인
		
		if(adminCode==null)
		{
			// 로그인이 되어있지 않고 직접 페이지 요청
			return "redirect:adminloginform.action";
		}
		else if(!adminCode.substring(0, 3).equals("MNG")
				&& !adminCode.substring(0, 3).equals("MST"))	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황일 때의 처리
			// 기존 세션을 제거하고 다시 관리자로 로그인할 수 있도록 처리
			return "redirect:adminlogout.action";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("inquiry", dao.inquiryAnswer(inquiry));
		
		return "WEB-INF/views/admin/InquiryAnswerDetail.jsp";
	}
	
	
	
}
