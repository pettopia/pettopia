/*
 * IWalkMeetingDAO.java
 * */

package com.pettopia.hj;

import java.util.ArrayList;


public interface IWalkCreateDAO
{
	
	//데이터 추가
	//public int add(WalkCreateDTO w);
	
	//데이터 뿌리기
//	public WalkCreateDTO list(String walk_meeting_seq);
	public WalkCreateDTO list();
	
	//강아지 이름
	public ArrayList<WalkCreateDTO> doglist(String code);
	
	//주소 대분류 조회
	public ArrayList<WalkCreateDTO> addrlarname();
	
	//주소 중분류 조회
	public ArrayList<WalkCreateDTO> addrmidname(String s);
	
	

}
 