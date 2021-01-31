package com.pettopia.bk;

public class InquiryRegDTO
{
	private String num, code, member_code, member_reg_code;
	private String id, nick, age, title, content;
	private String reg_date, state, com_date, mg, mgcontent;
	//-- 번호, 문의접수코드, 회원고유코드, 회원등록코드 
	//-- 아이디, 닉네임, 나이, 문의제목, 문의내용
	//-- 작성일, 처리상태, 처리일시, 처리담당, 답변내용
	// getter / setter
	public String getNum()
	{
		return num;
	}

	public String getMember_code()
	{
		return member_code;
	}

	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}

	public String getMember_reg_code()
	{
		return member_reg_code;
	}

	public void setMember_reg_code(String member_reg_code)
	{
		this.member_reg_code = member_reg_code;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getMgcontent()
	{
		return mgcontent;
	}

	public void setMgcontent(String mgcontent)
	{
		this.mgcontent = mgcontent;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getNick()
	{
		return nick;
	}

	public void setNick(String nick)
	{
		this.nick = nick;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getCom_date()
	{
		return com_date;
	}

	public void setCom_date(String com_date)
	{
		this.com_date = com_date;
	}

	public String getMg()
	{
		return mg;
	}

	public void setMg(String mg)
	{
		this.mg = mg;
	}
	
}
