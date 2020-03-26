package com.kh.episode.model.dao;

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

import com.kh.common.PageInfo;
import com.kh.episode.model.vo.Comment;
import com.kh.episode.model.vo.Episode;

public class episodeDao {

	private Properties prop = new Properties();
	
	public episodeDao() {
		String fileName = episodeDao.class.getResource("/sql/episode/episode-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Comment> selectReplyList(Connection conn, int eNo){
		
		ArrayList<Comment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Comment c = new Comment();
				c.setContent(rset.getString("content"));
				c.setMemberNo(rset.getInt("member_no"));
				c.setCreationDate(rset.getDate("creation_date"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertComment(Connection conn, Comment c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getContent());
			pstmt.setInt(2, c.getEpisodeNo());
			pstmt.setInt(3, c.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//LSH
	public int secretEpisodeConfirm(Connection conn, String no, int flag) {
		int result = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql;
		
		if(flag == 1) { // 이미 숨김된 건이 있는지 조회
			sql = "SELECT COUNT(*) FROM TB_EPISODE WHERE SECRET_FLAG = 'Y' AND EPISODE_NO IN (" + no + ")";
		} else { // 숨김되지 않은 건을 선택했는지 조회
			sql = "SELECT COUNT(*) FROM TB_EPISODE WHERE SECRET_FLAG = 'N' AND EPISODE_NO IN (" + no + ")";
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}		
		
		return result;
	}
		
	//LSH
	public int secretWork(Connection conn, String no, int flag) {
		
		Statement stmt = null;
		int result = 0;
		
		String sql;
		if(flag == 1) {
			sql = "UPDATE TB_EPISODE SET SECRET_FLAG = 'Y' WHERE EPISODE_NO IN (" + no + ")";
		} else {
			sql = "UPDATE TB_EPISODE SET SECRET_FLAG = 'N' WHERE EPISODE_NO IN (" + no + ")";			
		}
		
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

}
