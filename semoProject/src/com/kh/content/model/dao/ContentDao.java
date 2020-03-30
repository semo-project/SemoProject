package com.kh.content.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.content.model.vo.Content;

public class ContentDao {
	
	private Properties prop =new Properties();
	
	public ContentDao() {
		String fileName = ContentDao.class.getResource("/sql/notice/content-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//전체조회
	public ArrayList<Content> adminSelectList(Connection conn){
		ArrayList<Content> list=  new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Content(rset.getInt("contact_no"),
									 rset.getString("contact_title"),
									 rset.getString("contact_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;	
	}
	
	public Content adminSelectContent(Connection conn, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Content c = null;
		
		String sql = prop.getProperty("adminSelectContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Content(rset.getInt("contact_no"),
								rset.getString("contact_title"),
								rset.getString("contact_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	public int insertContent(Connection conn, String title, String content) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateContent(Connection conn, Content c) {
		int result = 0;
		
		String sql = prop.getProperty("updateContent");
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getContactTitle());
			pstmt.setString(2, c.getContatctContent());
			pstmt.setInt(3, c.getContactNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteContent(Connection conn, int no) {
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteContent");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
