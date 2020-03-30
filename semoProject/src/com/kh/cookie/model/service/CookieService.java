package com.kh.cookie.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.PageInfo;
import com.kh.cookie.model.dao.CookieDao;
import com.kh.cookie.model.vo.Cookie;
import com.kh.member.model.vo.Member;

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
	
	public int updateLog(int amt, String payMethod, int payName, Member loginUser) {
		Connection conn = getConnection();
		int result1 = new CookieDao().updatePayway(conn, amt, payMethod);
		int result2 = new CookieDao().updateCookie(conn, payName, payMethod, loginUser.getMemberNo());
		int result3 = new CookieDao().updateMemberCookie(conn, payName, loginUser.getMemberNo());
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1*result2*result3;
	}

}
