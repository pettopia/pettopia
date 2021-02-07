/*==========================
	boardController.java
==========================*/

package com.pettopia.bk;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 자유게시판 메인
	@RequestMapping(value = "board.action", method = RequestMethod.GET)
	public String board(Model model, HttpSession session, BoardDTO board)
	{
		/*
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("search_type : " + board.getSearch_type());
		System.out.println("head_code : " + board.getHead_code());
		System.out.println("head_code : " + board.getSearch_text());
		System.out.println("pageNum : " + pageNum);
		 */
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		PagingUtil paging = new PagingUtil();	// 페이징 처리 유틸

		
		int currentPage = 1;	//-- currentPage : 현재 페이지(default 1)
		if(board.getPageNum() != null)
			currentPage = Integer.parseInt(board.getPageNum());		
		
		int boardCount = Integer.parseInt(dao.boardCount(board));	// 조회된 게시글 수
		
		int numPerPage = 10;	// 한 페이지에 표시할 게시글 갯수
		int totalPage = paging.getPageCount(numPerPage, boardCount);	// 총 페이지 수

		if(currentPage > totalPage)		// 다른 회원이 게시글을 삭제해서 총페이지가 줄었을 경우
			currentPage = totalPage;

		// 현재 페이지에 가져올 게시글 데이터의 시작과 끝
		// ex) 2 페이지 게시글은 11번째(start) ~ 20번째(end) 데이터
		int start = (currentPage-1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		board.setStart(Integer.toString(start));
		board.setEnd(Integer.toString(end));
		
		List<BoardDTO> boardList = dao.boardList(board);
		String param = "";		// 검색해서 유입한 경우 페이징 전처리 url에 반영할 파라미터값
   
		if(board.getSearch_text() != null)	// 검색값이 존재한다면
		{
			param += "?search_type=" + board.getSearch_type();
			param += "&head_code=" + board.getHead_code();
			param += "&search_text=" + board.getSearch_text();
		}
		
		String listUrl = "board.action" + param;		// 페이징 url 전처리 변수
		
		// 페이징 url 리스트(현재페이지, 총페이지수,전처리된페이징url)
		String pageIndexList = paging.getIndexList(currentPage, totalPage, listUrl);
		
		
		if(board.getSearch_text() != null)	// 게시물을 검색했을 경우 처리
		{
			for (BoardDTO dto : boardList)
			{
				dto.setParam("search_type=" + board.getSearch_type() + "&head_code=" + board.getHead_code()
								+ "&search_text=" + board.getSearch_text() + "&board_code=" + dto.getBoard_code());
			}
			
			model.addAttribute("search_type", board.getSearch_type());
			model.addAttribute("head_code", board.getHead_code());
			model.addAttribute("search_text", board.getSearch_text());
		}
		else
		{
			for (BoardDTO dto : boardList)
			{
				dto.setParam("board_code=" + dto.getBoard_code());
			}
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("headList", dao.headList());
		model.addAttribute("pageIndexList", pageIndexList);
		
		return "WEB-INF/views/Board.jsp";
	}
	
	// 자유게시판 게시글 내용
	@RequestMapping(value = "boardcontent.action", method = RequestMethod.GET)
	public String boardContent(BoardDTO board, Model model, HttpSession session)
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.viewnumUpdate(board);	// 조회수 증가
		
		String num = dao.searchNum(board);	// 게시글의 행번호 조회(이전글, 다음글 용도)
		board.setNum(num);
		
		BoardDTO before = dao.prevNum(board);
		BoardDTO next = dao.nextNum(board);
		
		if(before != null)		// 이전글이 존재한다면
		{
			before = dao.content(before);

			if(board.getSearch_text() != null)	// 게시물을 검색했을 경우 처리
			{
				before.setParam("search_type=" + board.getSearch_type() + "&head_code=" + board.getHead_code()
					+ "&search_text=" + board.getSearch_text() + "&board_code=" + before.getBoard_code());
			}
			else
				before.setParam("board_code=" + before.getBoard_code());
			
			model.addAttribute("before", before);
		}
		
		if(next != null)		// 다음글이 존재한다면
		{
			next = dao.content(next);

			if(board.getSearch_text() != null)	// 게시물을 검색했을 경우 처리
			{
				next.setParam("search_type=" + board.getSearch_type() + "&head_code=" + board.getHead_code()
					+ "&search_text=" + board.getSearch_text() + "&board_code=" + next.getBoard_code());
			}
			else
				next.setParam("board_code=" + next.getBoard_code());
			
			model.addAttribute("next", next);
		}
		
		// 해당 게시물을 요청했을 때 삭제된 경우
		BoardDTO content = dao.content(board);
		if(content.getBoard_code()==null)
			return "board.action";
		
		model.addAttribute("code", (String)session.getAttribute("code"));
		model.addAttribute("content", dao.content(board));
		model.addAttribute("replyList", dao.replyList(board));
		
		return "WEB-INF/views/BoardContent.jsp";
	}
	
	// 게시글 작성 폼
	@RequestMapping(value = "boardinsertform.action", method = RequestMethod.GET)
	public String boardInsert(Model model, HttpSession session)
	{
		String code = (String)session.getAttribute("code");
		
		// 로그인되지 않은 상태라면 로그인폼 요청
		if (code==""||code==null)
		{
			session.setAttribute("rq_url", "boardinsertform.action");
			return "redirect:loginform.action";
		}
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("headList", dao.headList());
		model.addAttribute("code", code);
		
		return "WEB-INF/views/BoardInsert.jsp";
	}
	
	// 게시글 추가 액션
	@RequestMapping(value = "boardinsert.action", method = RequestMethod.POST)
	public String boardInsertAction(HttpSession session, BoardDTO board, Model model)
	{
		String code = (String) session.getAttribute("code");
		//System.out.println(code);	// 세션 확인
		
		if(code==null)
		{
			return "redirect:board.action";
		}
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int result = dao.contentInsert(board);
		
		if(result != 1)
		{
			System.out.println("board 데이터베이스 저장 실패");
			return "redirect:board.action";
		}
		
		return "WEB-INF/views/BoardComplete.jsp";
	}
	
	// 게시글 수정 폼
	@RequestMapping(value = "boardupdateform.action", method = RequestMethod.GET)
	public String boardUpdate(HttpSession session, BoardDTO board, Model model)
	{
		String code = (String) session.getAttribute("code");
		
		// 로그인되지 않은 상태라면 로그인폼 요청
		if (code==""||code==null)
		{
			session.setAttribute("rq_url", "boardupdateform.action");
			return "redirect:loginform.action";
		}
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("headList", dao.headList());
		model.addAttribute("code", code);
		model.addAttribute("content", dao.content(board));
		
		return "WEB-INF/views/BoardUpdate.jsp";
	}
	
	// 게시글 수정 액션
	@RequestMapping(value = "boardupdate.action", method = RequestMethod.POST)
	public String boardUpdateAction(HttpSession session, BoardDTO board, Model model)
	{
		String code = (String) session.getAttribute("code");
		//System.out.println(code);	// 세션 확인
		
		if(code==null)
		{
			return "redirect:board.action";
		}
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int result = dao.contentUpdate(board);
		
		if(result != 1)
		{
			System.out.println("board 데이터베이스 변경(수정) 실패");
			return "redirect:board.action";
		}
		
		model.addAttribute("board_code", board.getBoard_code());
		
		return "WEB-INF/views/BoardComplete.jsp";
	}
	
	// 게시글 삭제 액션
	@RequestMapping(value = "boarddelete.action", method = RequestMethod.POST)
	public String boardDeleteAction(HttpSession session, BoardDTO board)
	{
		String code = (String) session.getAttribute("code");
		//System.out.println(code);	// 세션 확인
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int result = dao.contentDelete(board);
		
		if(result != 1)
		{
			System.out.println("board 데이터베이스 삭제 실패");
			return "redirect:board.action";
		}
		
		return "WEB-INF/views/BoardComplete.jsp";
	}
	
	//----------------------------------------------------------------------------------------

	// 댓글 입력 액션
	@RequestMapping(value = "replyinsert.action", method = RequestMethod.POST)
	public String replyInsertAction(HttpSession session, ReplyDTO reply)
	{
		String code = (String) session.getAttribute("code");
		//System.out.println(code);	// 세션 확인
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int result = dao.replyInsert(reply);
		
		if(result!=1)
			System.out.println("reply 데이터베이스 저장 실패");
		
		return "redirect:boardcontent.action?board_code="+reply.getBoard_code();
	}
	
	// 댓글 삭제 액션
	@RequestMapping(value = "replydelete.action", method = RequestMethod.POST)
	public String replyDeleteAction(HttpSession session, ReplyDTO reply)
	{
		String code = (String) session.getAttribute("code");
		//System.out.println(code);	// 세션 확인
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int result = dao.replyDelete(reply);
		
		if(result!=1)
			System.out.println("reply 데이터베이스 삭제 실패");
		
		return "redirect:boardcontent.action?board_code="+reply.getBoard_code();
	}
	
	
}
