package com.pettopia.hj;

public class WalkJoinDTO
{
	//산책참여DTO
	private String seq, walk_meeting_seq, pet_con_reg_seq , res;

	public String getRes()
	{
		return res;
	}

	public void setRes(String res)
	{
		this.res = res;
	}


	public String getSeq()
	{
		return seq;
	}

	public void setSeq(String seq)
	{
		this.seq = seq;
	}

	public String getWalk_meeting_seq()
	{
		return walk_meeting_seq;
	}

	public void setWalk_meeting_seq(String walk_meeting_seq)
	{
		this.walk_meeting_seq = walk_meeting_seq;
	}

	public String getPet_con_reg_seq()
	{
		return pet_con_reg_seq;
	}

	public void setPet_con_reg_seq(String pet_con_reg_seq)
	{
		this.pet_con_reg_seq = pet_con_reg_seq;
	}
}
