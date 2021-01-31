package com.pettopia.bk;

public class MemberDTO
{
	private String regCode, code, ps_code, id, nick;
	// 회원등록코드, 회원고유코드, 펫시터코드, 아이디, 닉네임
	private String birthday, sex, tel, email, addr, regdate;
	// 생일, 성별, 연락처, 이메일, 주소, 회원가입일
	private String avg_score, ps_score, filepath;
	// 인기도, 펫시터평점, 프로필파일경로
	
	// getter / setter
	public String getRegCode()
	{
		return regCode;
	}
	public void setRegCode(String regCode)
	{
		this.regCode = regCode;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getPs_code()
	{
		return ps_code;
	}
	public void setPs_code(String ps_code)
	{
		this.ps_code = ps_code;
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
	public String getBirthday()
	{
		return birthday;
	}
	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getAddr()
	{
		return addr;
	}
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	public String getRegdate()
	{
		return regdate;
	}
	public void setRegdate(String regdate)
	{
		this.regdate = regdate;
	}
	public String getAvg_score()
	{
		return avg_score;
	}
	public void setAvg_score(String avg_score)
	{
		this.avg_score = avg_score;
	}
	public String getPs_score()
	{
		return ps_score;
	}
	public void setPs_score(String ps_score)
	{
		this.ps_score = ps_score;
	}
	public String getFilepath()
	{
		return filepath;
	}
	public void setFilepath(String filepath)
	{
		this.filepath = filepath;
	}
}
