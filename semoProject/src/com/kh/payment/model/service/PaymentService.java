package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.PageInfo;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Payment;

public class PaymentService {
	
	public int countList(int userNo) {
		Connection conn = getConnection();
		int result = new PaymentDao().countList(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Payment> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Payment> list = new PaymentDao().selectList(conn, pi, userNo);
		close(conn);
		return list;
	}

}
