package com.pettopia.bk;

public class ReplyDTO
{
	private String board_code, reply_code, member_code, nick;
	//-- 게시글코드, 댓글코드, 작성자회원고유코드, 닉네임
	private String reg_date, content;
	//-- 작성일, 댓글내용
	
	// getter / setter
	public String getBoard_code()
	{
		return board_code;
	}
	public void setBoard_code(String board_code)
	{
		this.board_code = board_code;
	}
	public String getReply_code()
	{
		return reply_code;
	}
	public void setReply_code(String reply_code)
	{
		this.reply_code = reply_code;
	}
	public String getMember_code()
	{
		return member_code;
	}
	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}
	public String getNick()
	{
		return nick;
	}
	public void setNick(String nick)
	{
		this.nick = nick;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
}
