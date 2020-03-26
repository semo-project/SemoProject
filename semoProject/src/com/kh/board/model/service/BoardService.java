package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Comment;
import com.kh.board.model.vo.PageInfo;

public class BoardService {

	/**
	 * 1-1. 일반게시판 게시글 총 개수
	 *
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1-2. 일반게시판 리스트 조회 서비스
	 *
	 */
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	/**
	 * 1-3. 일반게시판 작성 서비스
	 *
	 */
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 1-4. 일반게시판 상세조회 서비스
	 *
	 */
	public Board webDetail(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().webCount(conn, boardNo);
		
		Board b = null;
		if(result > 0) {
			b = new BoardDao().webDetail(conn, boardNo);
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}
	/**
	 * 1-5. 수정하고싶은 게시판 선택
	 *
	 */
	public Board selectUpdateBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().webDetail(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	/**
	 * 1-6. 게시판 글 수정 서비스
	 *
	 */
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 1-7. 게시판 글 삭제 서비스
	 *
	 */
	public int deleteWeb(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteWeb(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 1-8. 게시판 댓글작성 서비스
	 *
	 */
	public int commentInsert(Comment c) {
		Connection conn = getConnection();
		
		int result = new BoardDao().commentInsert(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 1-9. 게시판 댓글리스트 서비스
	 *
	 */
	
	public ArrayList<Comment> commentList(int boardNo){
		Connection conn = getConnection();
		
		ArrayList<Comment> list = new BoardDao().commentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
}
