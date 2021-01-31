package com.pettopia.hj;

import java.util.ArrayList;

public interface IWalkListDAO
{
		
		
		//전체 모임 리스트
		public ArrayList<WalkListDTO> list();
		
		//최근 게시물 리스트
		public ArrayList<WalkListDTO> newlist();
		
		
		//가까운 산책모임 리스트
		public ArrayList<WalkListDTO> nearlist(String code);
		
		
		
}
