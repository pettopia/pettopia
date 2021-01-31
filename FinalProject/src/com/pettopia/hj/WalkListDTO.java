package com.pettopia.hj;

public class WalkListDTO
{
	//※나중에 강아지 프로필 사진 추가하기
	

	//산책모임 전체글 DTO
	
	private String walktitle, writedate, views, nick, region_hap, walk_meeting_seq;
	
	private String code;
	
	private String pet_con_reg_seq;
	
	public String getWalk_meeting_seq()
	{
		return walk_meeting_seq;
	}

	public void setWalk_meeting_seq(String walk_meeting_seq)
	{
		this.walk_meeting_seq = walk_meeting_seq;
	}

	
	//가까운 산책모임
	
	//최신 산책모임 게시글
	//private String larname,addr1;
	
	

//	public String getLarname()
//	{
//		return larname;
//	}
//
//	public void setLarname(String larname)
//	{
//		this.larname = larname;
//	}
//
//	public String getAddr1()
//	{
//		return addr1;
//	}
//
//	public void setAddr1(String addr1)
//	{
//		this.addr1 = addr1;
//	}

	public String getPet_con_reg_seq()
	{
		return pet_con_reg_seq;
	}

	public void setPet_con_reg_seq(String pet_con_reg_seq)
	{
		this.pet_con_reg_seq = pet_con_reg_seq;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getWalktitle()
	{
		return walktitle;
	}

	public void setWalktitle(String walktitle)
	{
		this.walktitle = walktitle;
	}

	public String getWritedate()
	{
		return writedate;
	}

	public void setWritedate(String writedate)
	{
		this.writedate = writedate;
	}

	public String getViews()
	{
		return views;
	}

	public void setViews(String views)
	{
		this.views = views;
	}

	public String getNick()
	{
		return nick;
	}

	public void setNick(String nick)
	{
		this.nick = nick;
	}

	public String getRegion_hap()
	{
		return region_hap;
	}

	public void setRegion_hap(String region_hap)
	{
		this.region_hap = region_hap;
	}

	
}
