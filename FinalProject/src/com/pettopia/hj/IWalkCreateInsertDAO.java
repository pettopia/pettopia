package com.pettopia.hj;

public interface IWalkCreateInsertDAO
{
	//산책모임개설 insert
	public int walkinsert(WalkCreateInsertDTO dto);

	public String list(String pet_con_reg_seq);
	
}
