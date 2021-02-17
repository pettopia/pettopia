/*===================
	IBoardDAO.java
	- 인터페이스
===================*/

package com.pettopia.bk;

import java.util.ArrayList;

public interface IBoardDAO
{
	// 자유게시판 게시글 갯수
	public String boardCount(BoardDTO board);
	// 자유게시판 게시글 리스트 조회
	public ArrayList<BoardDTO> boardList(BoardDTO board);
	// 말머리 목록
	public ArrayList<CodeDTO> headList();
	// 게시글 내용 조회
	public BoardDTO content(BoardDTO board);
	// 댓글 리스트 조회
	public ArrayList<ReplyDTO> replyList(BoardDTO board);
	// 다음글 행번호 조회
	public BoardDTO nextNum(BoardDTO board);
	// 이전글 행번호 조회
	public BoardDTO prevNum(BoardDTO board);
	// 게시글코드로 행번호 조회
	public String searchNum(BoardDTO board);
	
	
	// 게시글 생성 액션
	public int contentInsert(BoardDTO board);
	// 게시글 수정 액션
	public int contentUpdate(BoardDTO board);
	// 게시글 삭제 액션
	public int contentDelete(BoardDTO board);
	
	
	// 댓글 등록 액션
	public int replyInsert(ReplyDTO reply);
	// 댓글 수정 액션
	public int replyUpdate(ReplyDTO reply);
	// 댓글 삭제 액션
	public int replyDelete(ReplyDTO reply);
	
	
	// 게시물 조회수 증가
	public int viewnumUpdate(BoardDTO board);
}
