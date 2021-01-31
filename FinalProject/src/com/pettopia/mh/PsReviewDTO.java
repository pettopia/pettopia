/*=================================
  StudentDTO.java
==================================*/

package com.pettopia.mh;

public class PsReviewDTO
{
	private String psnick, petname, care_req_seq, care_agree_fix_seq, psscore, reviewcontent;

	
	public String getPsscore()
	{
		return psscore;
	}

	public void setPsscore(String psscore)
	{
		this.psscore = psscore;
	}

	public String getReviewcontent()
	{
		return reviewcontent;
	}

	public void setReviewcontent(String reviewcontent)
	{
		this.reviewcontent = reviewcontent;
	}

	public String getPsnick()
	{
		return psnick;
	}

	public void setPsnick(String psnick)
	{
		this.psnick = psnick;
	}

	public String getPetname()
	{
		return petname;
	}

	public void setPetname(String petname)
	{
		this.petname = petname;
	}

	public String getCare_req_seq()
	{
		return care_req_seq;
	}

	public void setCare_req_seq(String care_req_seq)
	{
		this.care_req_seq = care_req_seq;
	}

	public String getCare_agree_fix_seq()
	{
		return care_agree_fix_seq;
	}

	public void setCare_agree_fix_seq(String care_agree_fix_seq)
	{
		this.care_agree_fix_seq = care_agree_fix_seq;
	}
	
	
	
	
}
