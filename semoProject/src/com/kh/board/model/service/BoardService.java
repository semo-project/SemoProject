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
	
	/**
	 * 1-10. 댓글 삭제 서비스
	 *
	 */
	public int deleteCom(int commentNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteCom(conn, commentNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 2-1. 수다수다 게시판  총 개수
	 * 	 
	 */
	public int freeListCount() {
		Connection conn = getConnection();
		
		int result = new BoardDao().freeListCount(conn);
		
		close(conn);
		
		return result;
	}
	/**
	 * 2-2. 수다수다 게시판 리스트 수
	 * 	 
	 */
	public ArrayList<Board> selectfreeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectfreeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int boardReport(String reportRadio, String reportContent, int boardNo, int reporterNo, String boardWriter) {
		Connection conn = getConnection();
		
		int result = new BoardDao().boardReport(conn, reportRadio, reportContent, boardNo, reporterNo, boardWriter);
		
		close(conn);
		
		return result;
		
	}
	
	public Comment comReportInfo(int comReportNo, String commentWriter, String commentContent) {
		Connection conn = getConnection();
		
		Comment c = new BoardDao().comReportInfo(conn, comReportNo, commentWriter, commentContent);
		
		close(conn);
		
		return c;
	}
	
	//댓글 신고기능
	public int comRepSend(int comRepNo, String comRepRadio, String comRepContent, int memberNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().comRepSend(conn, comRepNo, comRepRadio, comRepContent, memberNo);
		
		close(conn);
		
		return result;
	}
	
	// 게시판 검색기능
	
	public ArrayList<Board> boardSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().boardSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> boardWSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().boardWSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> boardCSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().boardCSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	public int insertfreeBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertfreeBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Board freeDetail(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().freeCount(conn, boardNo);
		
		Board b = null;
		if(result > 0) {
			b = new BoardDao().freeDetail(conn, boardNo);
			
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}
	
	// 수정하고싶은 수다수다 게시글 선택
	public Board selectUpdateFree(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().freeDetail(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public int updateFree(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateFree(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteFree(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteFree(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Board> freeSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().freeSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> freeWSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().freeWSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> freeCSearch(String searchContent){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().freeCSearch(conn, searchContent);
		
		close(conn);
		
		return list;
	}
	
	///////////////////////////////////////////////////////////////////
	// KJY
	public int countList(int userNo) {
		Connection conn = getConnection();
		int result = new BoardDao().countList(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Board> selectMyList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectMyList(conn, pi, userNo);
		close(conn);
		return list;
	}
}
