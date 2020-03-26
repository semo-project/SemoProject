package com.kh.epLike.model.dao;

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
import com.kh.epLike.model.vo.EpLike; 

public class EpLikeDao {
	
private Properties prop = new Properties();
	
	public EpLikeDao() {
		String fileName = EpLikeDao.class.getResource("/sql/epLike/epLike-query.properties").getPath();
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
	
	public ArrayList<EpLike> selectList(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EpLike> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new EpLike(rset.getInt("EPISODE_NO"),
									rset.getString("WORK_TITLE"),
									rset.getString("THUMBNAIL_MODIFY"),
									rset.getString("MEMBER_NICKNAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
