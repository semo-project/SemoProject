package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

/**
 * @author JaeHeeKim
 *
 */
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
	public int insertBoard(String title, String content, String writer) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, title, content, writer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
