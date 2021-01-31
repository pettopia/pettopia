package com.pettopia.bk;

public class NotifyDTO
{
	private String no_code, member_reg_code, code, nick;
	//-- 알림코드, 회원등록코드, 회원고유코드, 닉네임
	private String notify_type_code, content, url_name, url, reg_date, check_date;
	//-- 알림타입코드, 알림내용, url명, 연결할url,작성일, 회원확인일
	private String reference_code;
	//-- 알림처리참고코드 ex)공유수락insert 할 펫연결신청코드 담기
	public String getNo_code()
	{
		return no_code;
	}
	public String getReference_code()
	{
		return reference_code;
	}
	public void setReference_code(String reference_code)
	{
		this.reference_code = reference_code;
	}
	public void setNo_code(String no_code)
	{
		this.no_code = no_code;
	}
	public String getMember_reg_code()
	{
		return member_reg_code;
	}
	public void setMember_reg_code(String member_reg_code)
	{
		this.member_reg_code = member_reg_code;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getNick()
	{
		return nick;
	}
	public void setNick(String nick)
	{
		this.nick = nick;
	}
	public String getNotify_type_code()
	{
		return notify_type_code;
	}
	public void setNotify_type_code(String notify_type_code)
	{
		this.notify_type_code = notify_type_code;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getUrl_name()
	{
		return url_name;
	}
	public void setUrl_name(String url_name)
	{
		this.url_name = url_name;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getCheck_date()
	{
		return check_date;
	}
	public void setCheck_date(String check_date)
	{
		this.check_date = check_date;
	}
	
}
