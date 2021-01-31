/*===================
  
 ===================*/

package com.pettopia.mh;

import java.util.ArrayList;

public interface IMyPageDAO
{
	public String searchCode(String id);
	
	//닉네임 찾기
	public String searchNick(String id);
	
	public MyPageDTO list(String id);
	
	//닉네임중복확인 위한 닉네임리스트들
	public ArrayList<MyPageDTO> nicklist();
	
	//회원가입시 아이디 중복확인 위한 아이디 리스트들
	public ArrayList<MyPageDTO> idlist();
	
	//로그인 성공여부 
	public String login(MyPageDTO dto);
	
	//내정보 수정
	public int modify(MyPageDTO dto);
	
	//비밀번호 변경
	public int modifyPw(LoginDTO dto);
	
	//회원가입 메소드
	public int join(MyPageDTO dto);
	
	//내가쓴 게시글
	public ArrayList<MyBoardDTO> myboard(String member_code_seq);
	
	//내가쓴 댓글
	public ArrayList<MyReplyDTO> myreply(String member_code_seq);
		
	
	//펫시터 여부 확인
	public String isps(String member_code_seq);
}
