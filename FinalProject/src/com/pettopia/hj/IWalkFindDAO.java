package com.pettopia.hj;

import java.util.ArrayList;

public interface IWalkFindDAO
{
	//산책찾기DAO
	
	public ArrayList<WalkFindDTO> list(WalkFindDTO dto);
	
	
	//주소 대분류 조회
	public ArrayList<WalkFindDTO> addrlarname();
}
