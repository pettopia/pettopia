package com.pettopia.bk;

import java.util.ArrayList;

public interface IAdminDAO
{
	// 마스터 로그인 정보 조회
	public String masterLogin(AdminDTO admin);
	
	// 관리자 로그인 정보 조회
	public String adminLogin(AdminDTO admin);
	
	// 회원 상세 정보 조회
	public MemberDTO userInfo(MemberDTO member);
	
	// 펫시터 신청 내역 상세 조회
	public PetsitterRegDTO psReqInfo(PetsitterRegDTO petsitter);
	
	// 펫시터 신청 증빙서류 조회
	public ArrayList<FileDTO> psDocList(FileDTO petsitter);
	
	// 펫시터 신청 승인 처리
	public int psReqApproval(PsApprovalDTO petsitter);
	
	// 펫시터 신청 반려 처리
	public int psReqDisapproval(PsApprovalDTO petsitter);
	
	// 펫시터 등록 반려 사유 코드 목록 조회
	public ArrayList<CodeDTO> psRefReasonList();
	
	// 펫시터 승인 내역 조회 (승인 창에서 조회)
	public PetsitterRegDTO psReg(PetsitterRegDTO petsitter);
	
	// 승인된 펫시터 등록된 프로필 조회 (승인 창에서 조회)
	public PsProfileDTO psProfile(PetsitterRegDTO petsitter);
	
	// 펫시터의 이용 가능한 서비스 목록 조회 (승인 창에서 조회)
	public ArrayList<String> psServiceList(PsProfileDTO profile);
	
	// 펫시터 프로필의 돌봄환경이미지 목록 조회 (승인 창에서 조회)
	public ArrayList<FileDTO> psImgList(PsProfileDTO profile);
	
	// 펫시터 신청 반려 내역 조회 (거절 창에서 조회)
	public PetsitterRegDTO psRef(PetsitterRegDTO petsitter);
	
	
	
	// 회원 신고 접수 상세 조회
	public UserReportDTO usReportInfo(UserReportDTO report);

	// 신고 접수 반려 사유 코드 목록 조회
	public ArrayList<CodeDTO> reportRefReasonList();

	// 회원 신고 접수 첨부파일 목록 조회
	public ArrayList<FileDTO> usDocList(UserReportDTO user);
	
	// 회원 신고 접수 승인 처리
	public int usReqApproval(UserReportDTO report);
	
	// 회원 신고 접수 반려 처리
	public int usReqDisapproval(UserReportDTO report);
	
	// 경고 회원 상세 내역-회원 신고 승인 내역 조회
	public UserReportDTO usReg(UserReportDTO report);
	
	// 회원 신고 반려 내역 조회
	public UserReportDTO usRef(UserReportDTO report);
	
	
	
	// 게시물 신고 접수 상세 조회
	public BoardReportRegDTO contentsReportInfo(BoardReportRegDTO report);
	
	// 게시물 신고 접수 승인 처리
	public int contentsReqApproval(BoardReportRegDTO report);
	
	// 게시물 신고 접수 반려 처리
	public int contentsReqDisapproval(BoardReportRegDTO report);
	
	// 블라인드 게시물 상세 내역-게시물 신고 승인 내역 조회
	public BoardReportRegDTO contentsReg(BoardReportRegDTO report);
	
	// 게시물 신고 반려 내역 조회
	public BoardReportRegDTO contentsRef(BoardReportRegDTO report);
	
	
	
	// 댓글 신고 접수 상세 조회
	public ReplyReportRegDTO replyReportInfo(ReplyReportRegDTO report);
	
	// 댓글 신고 접수 승인 처리
	public int replyReqApproval(ReplyReportRegDTO report);
	
	// 댓글 신고 접수 반려 처리
	public int replyReqDisapproval(ReplyReportRegDTO report);
	
	// 블라인드 댓글 상세 내역-댓글 신고 승인 내역 조회
	public ReplyReportRegDTO replyReg(ReplyReportRegDTO report);
	
	// 댓글 신고 반려 내역 조회
	public ReplyReportRegDTO replyRef(ReplyReportRegDTO report);
	
	
	
	// 1:1 문의 접수 내역 상세정보
	public InquiryRegDTO inquiryInfo(InquiryRegDTO inquiry);
	
	// 1:1 문의 답변 처리
	public int inquiryComplete(InquiryRegDTO inquiry);
	
	// 1:1 문의 접수 처리한 답변 내역 조회
	public InquiryRegDTO inquiryAnswer(InquiryRegDTO inquiry);
	
	
	
	// 알람 전송
	public int notifyInsert(NotifyDTO notify);
	
	// 펫시터 신청 코드로 신청한 회원등록코드, 회원고유코드 조회
	public NotifyDTO psReqMember(String reqcode);
	
	// 회원고유코드로 회원등록코드 조회
	public String searchMemberRegCode(String code);
}
