package com.kh.episode.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.episode.model.vo.Comment;

public class episodeDao {

	private Properties prop = new Properties();
	
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

}
