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

}
