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
import com.kh.episode.model.vo.Reply;

public class EpisodeDao {

	private Properties prop = new Properties();
	
	public EpisodeDao() {
		String fileName = EpisodeDao.class.getResource("/sql/episode/episode-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Reply> selectReplyList(Connection conn, int eNo){
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRlisk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reply r = new Reply();
				r.setContent(rset.getString("content"));
				r.setCreationDate(rset.getDate("creation_date"));
				r.setMemberId(rset.getString("member_id"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Episode episodeDetail(Connection conn, int eno) {
		
		Episode e = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("episodeDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				e = new Episode(rset.getInt("EPISODE_NO"),
								rset.getString("WORK_TITLE"),
								rset.getString("EPISODE_TITLE"));
							
			}		
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return e;
	}

	public int insertReply(Connection conn, Reply r) {
		int result= 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getContent());
			pstmt.setInt(2, r.getEpisodeNo());
			pstmt.setInt(3, Integer.parseInt(r.getMemberId()));
			
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
	
	//LSH
	public int getEpiApprovListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getEpiApprovListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Episode> adminEpiApprovList(Connection conn, PageInfo pi) {
		ArrayList<Episode> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminEpiApprovList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Episode e = new Episode();
				
				list.add(e);
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