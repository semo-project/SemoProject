package com.kh.cookie.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.PageInfo;
import com.kh.cookie.model.dao.CookieDao;
import com.kh.cookie.model.vo.Cookie;

public class CookieService {
	
	public int countList(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new CookieDao().countList(conn, userNo);
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Cookie> selectList(PageInfo pi, int userId) {
		Connection conn = getConnection();
		ArrayList<Cookie> list = new CookieDao().selectList(conn, pi, userId);
		close(conn);
		return list;
	}

}
