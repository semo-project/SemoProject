package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.*;

import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {
	
	
	/** 전체조회
	 * @return
	 */
	public ArrayList<Notice> selectList(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		
		close(conn);
		
		return list;
		
	}

	//작성
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 공지사항 디테일 조회
	 * @param no
	 * @return
	 */
	public Notice getAdminNotice(int no) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().getAdminNotice(conn, no);
		
		close(conn);
		
		return n;
	}
	
	/**
	 * Admin - 공지사항 수정
	 * @param n
	 * @return
	 */
	public int adminUpdateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().adminUpdateNotice(conn, n);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 공지 삭제
	 * @param no
	 * @return
	 */
	public int adminDeleteNotice(int no) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().adminDeleteNotice(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
