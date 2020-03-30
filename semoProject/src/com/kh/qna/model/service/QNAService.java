package com.kh.qna.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.PageInfo;
import com.kh.qna.model.dao.QNADao;
import com.kh.qna.model.vo.QNA;

public class QNAService {
	
	public int countList(int userNo) {
		Connection conn = getConnection();
		int result = new QNADao().countList(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<QNA> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<QNA> list = new QNADao().selectList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
	/**
	 * Admin - 관리자 1대1문의 전체 조회
	 * @return
	 */
	public ArrayList<QNA> adminSelectList() {
		Connection conn = getConnection();
		
		ArrayList<QNA> list = new QNADao().adminSelectList(conn);
		
		close(conn);
		
		return list;
	}

	public QNA adminSelectQNA(int no) {
		Connection conn = getConnection();
		
		QNA q = new QNADao().adminSelectQNA(conn, no);
		
		close(conn);
		
		return q;
	}
	
	/**
	 * Admin - 답변 등록
	 * @param no
	 * @param answer
	 * @return
	 */
	public int updateAnswer(int no, String answer) {
		Connection conn = getConnection();
		
		int result = new QNADao().updateAnswer(conn, no, answer);
		
		close(conn);
		
		return result;
	}
}
