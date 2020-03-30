package com.kh.cookie.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.PageInfo;
import com.kh.cookie.model.vo.Cookie;

public class CookieDao {
	
private Properties prop = new Properties();
	
	public CookieDao() {
		String fileName = CookieDao.class.getResource("/sql/cookie/cookie-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int countList(Connection conn, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Cookie> selectList(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cookie> list = new ArrayList<>();
		
		String sql = prop.getProperty("paywayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cookie(rset.getInt("RNUM"),
									rset.getDate("CHARGED_DATE"),
									rset.getString("PAYMENT_METHOD"),
									rset.getInt("CHARGED_COOKIES"),
									rset.getInt("PAYMENT_AMOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int updatePayway(Connection conn, int amt, String payMethod) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePayway");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, payMethod);
			pstmt.setInt(2, amt);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateCookie(Connection conn, int payName, String payMethod, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateCookie");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, payMethod);
			pstmt.setInt(3, payName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int updateMemberCookie(Connection conn, int payName, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMemberCookie");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payName);
			pstmt.setInt(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
