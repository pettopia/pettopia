/*==========================
	boardController.java
==========================*/

package com.pettopia.bk;

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
	public String board(Model model, HttpSession session)
	{
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		model.addAttribute("boardList", dao.boardList());
		model.addAttribute("headList", dao.headList());
		
		return "WEB-INF/views/Board.jsp";
	}
	
	// 자유게시판 게시글 내용
	@RequestMapping(value = "boardcontent.action", method = RequestMethod.GET)
	public String boardContent(BoardDTO board, Model model, HttpSession session)
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.viewnumUpdate(board);
		
		model.addAttribute("code", (String)session.getAttribute("code"));
		model.addAttribute("content", dao.content(board));
		model.addAttribute("replyList", dao.replyList(board));
		//model.addAttribute("replyCount", dao.replyCnt(board));
		
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
