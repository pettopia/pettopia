package com.pettopia.bk;

public class BoardDTO
{
	private String board_code, head_code, head, reg_date;
	//-- 게시글코드, 말머리코드, 말머리, 작성일
	private String member_code, nick, title, content, view_num, hit;
	//-- 회원고유코드, 닉네임, 제목, 내용
	private String date_check, blind_count;
	//-- date_check : 오늘 게시물이면 1, 아니면 0
	//-- blind_check : 블라인드 게시물이면 1 이상, 아니면 0
	private String reply_count;
	//-- 게시물의 댓글 수
	private String search_type, search_text;
	//-- 검색 타입(제목, 닉네임, 제목+내용), 검색어
	private String start, end, num;
	//-- 게시글 조회 시작 행번호, 끝행번호 (boardList 메소드의 파라미터), 행번호
	private String pageNum, param;
	//-- 상세게시글로 보내는 url 파라미터 처리
	// getter/ setter
	public String getReply_count()
	{
		return reply_count;
	}
	public String getPageNum()
	{
		return pageNum;
	}
	public void setPageNum(String pageNum)
	{
		this.pageNum = pageNum;
	}
	public String getParam()
	{
		return param;
	}
	public void setParam(String param)
	{
		this.param = param;
	}
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getStart()
	{
		return start;
	}
	public void setStart(String start)
	{
		this.start = start;
	}
	public String getEnd()
	{
		return end;
	}
	public void setEnd(String end)
	{
		this.end = end;
	}
	public String getSearch_type()
	{
		return search_type;
	}
	public void setSearch_type(String search_type)
	{
		this.search_type = search_type;
	}
	public String getSearch_text()
	{
		return search_text;
	}
	public void setSearch_text(String search_text)
	{
		this.search_text = search_text;
	}
	public void setReply_count(String reply_count)
	{
		this.reply_count = reply_count;
	}
	public String getBoard_code()
	{
		return board_code;
	}
	public String getBlind_count()
	{
		return blind_count;
	}
	public void setBlind_count(String blind_count)
	{
		this.blind_count = blind_count;
	}
	public String getDate_check()
	{
		return date_check;
	}
	public void setDate_check(String date_check)
	{
		this.date_check = date_check;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public void setBoard_code(String board_code)
	{
		this.board_code = board_code;
	}
	public String getHead_code()
	{
		return head_code;
	}
	public void setHead_code(String head_code)
	{
		this.head_code = head_code;
	}
	public String getHead()
	{
		return head;
	}
	public void setHead(String head)
	{
		this.head = head;
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
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getView_num()
	{
		return view_num;
	}
	public void setView_num(String view_num)
	{
		this.view_num = view_num;
	}
	public String getHit()
	{
		return hit;
	}
	public void setHit(String hit)
	{
		this.hit = hit;
	}
}
