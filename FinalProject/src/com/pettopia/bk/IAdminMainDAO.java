/*===================
	IAdminMainDAO.java
	- 인터페이스
===================*/

package com.pettopia.bk;

import java.util.ArrayList;

public interface IAdminMainDAO
{
	// 관리자 메인 > 신규 가입회원 목록
	// 오늘 날짜 조회
	public String today();
	// 업데이트한 시간
	public String updateTime();
	// 총 회원수 조회
	public int totMember();
	// 오늘 신규가입 회원수 조회
	public int todayNewMember();
	// 오늘 탈퇴 회원수 조회
	public int todayWithdrawMember();
	// 목록 리스트 출력
	public ArrayList<NewMemberDTO> newMemberList();
	
	// 관리자 메인 > 펫시터 신청 현황 목록
	// 오늘 펫시터 신청 목록 조회
	public ArrayList<PetsitterRegDTO> petsitterRegList();
	
	// 관리자 메인 > 회원 신고 접수 목록
	// 오늘 회원 신고 접수 목록 조회
	public ArrayList<MemberReportRegDTO> memberReportRegList();

	// 관리자 메인 > 게시물 신고 접수 목록
	// 오늘 게시물 신고 접수 목록 조회
	public ArrayList<BoardReportRegDTO> boardReportRegList();

	// 관리자 메인 > 댓글 신고 접수 목록
	// 오늘 댓글 신고 접수 목록 조회
	public ArrayList<ReplyReportRegDTO> replyReportRegList();

	// 관리자 메인 > 1:1 문의 접수 목록
	// 오늘 1:1 문의 접수 목록 조회
	public ArrayList<InquiryRegDTO> inquiryReportRegList();
}
