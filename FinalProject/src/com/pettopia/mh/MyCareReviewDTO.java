package com.pettopia.mh;

public class MyCareReviewDTO
{
	//돌봄,리뷰 정보
	public String petname, psnick, caredate, psscore, content, reviewdate, member_code_seq;

	
	//신청한사람 nick
	public String nick;
	
	
	
	public String getNick()
	{
		return nick;
	}

	public void setNick(String nick)
	{
		this.nick = nick;
	}

	public String getPetname()
	{
		return petname;
	}

	public void setPetname(String petname)
	{
		this.petname = petname;
	}

	public String getPsnick()
	{
		return psnick;
	}

	public void setPsnick(String psnick)
	{
		this.psnick = psnick;
	}

	public String getCaredate()
	{
		return caredate;
	}

	public void setCaredate(String caredate)
	{
		this.caredate = caredate;
	}

	public String getPsscore()
	{
		return psscore;
	}

	public void setPsscore(String psscore)
	{
		this.psscore = psscore;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getReviewdate()
	{
		return reviewdate;
	}

	public void setReviewdate(String reviewdate)
	{
		this.reviewdate = reviewdate;
	}

	public String getMember_code_seq()
	{
		return member_code_seq;
	}

	public void setMember_code_seq(String member_code_seq)
	{
		this.member_code_seq = member_code_seq;
	}
	
	
}
