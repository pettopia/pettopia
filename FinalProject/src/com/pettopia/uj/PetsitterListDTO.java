package com.pettopia.uj;

public class PetsitterListDTO
{
	
	String nick, age, addr1, ps_open_seq, pscontent, seq;
	String keyword; // 검색어
	



	public String getKeyword()
	{
		return keyword;
	}

	public void setKeyword(String keyword)
	{
		this.keyword = keyword;
	}

	public String getNick()
	{
		return nick;
	}

	public void setNick(String nick)
	{
		this.nick = nick;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getAddr1()
	{
		return addr1;
	}

	public void setAddr1(String addr1)
	{
		this.addr1 = addr1;
	}

	public String getPs_open_seq()
	{
		return ps_open_seq;
	}

	public void setPs_open_seq(String ps_open_seq)
	{
		this.ps_open_seq = ps_open_seq;
	}

	public String getPscontent()
	{
		return pscontent;
	}

	public void setPscontent(String pscontent)
	{
		this.pscontent = pscontent;
	}

	public String getSeq()
	{
		return seq;
	}

	public void setSeq(String seq)
	{
		this.seq = seq;
	}
	
	

}
