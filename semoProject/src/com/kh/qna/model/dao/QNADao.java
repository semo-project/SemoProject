package com.kh.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.board.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.qna.model.vo.QNA;

public class QNADao {
	
	private Properties prop = new Properties();
	
	public QNADao() {
		String fileName = MemberDao.class.getResource("/sql/qna/qna-query.properties").getPath();
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
	
	public ArrayList<QNA> selectList(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QNA> list = new ArrayList<>();
		
		String sql = prop.getProperty("qnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new QNA(rset.getInt("RNUM"),
								 rset.getDate("QNA_DATE"),
								 rset.getString("QNA_TITLE"),
								 rset.getString("QNA_ANSWER_STATE"),
								 rset.getString("QNA_CONTENT"),
								 rset.getString("QNA_ANSWER_CONTENT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<QNA> adminSelectList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectList");
		
		ArrayList<QNA> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				QNA q = new QNA();
				
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaAnswerState(rset.getString("qna_answer_state"));
				q.setQnaDate(rset.getDate("qna_date"));
				q.setQnaContentNo(rset.getInt("qna_content_no"));
				q.setMemberId(rset.getString("member_id"));
				
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public QNA adminSelectQNA(Connection conn, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectQNA");
		
		QNA q = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QNA();
				
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaAnswerState(rset.getString("qna_answer_state"));
				q.setQnaDate(rset.getDate("qna_date"));
				q.setQnaContentNo(rset.getInt("qna_content_no"));
				q.setMemberId(rset.getString("member_id"));
				q.setQnaAnswerContent(rset.getString("qna_answer_content"));
				q.setQnaContent(rset.getString("qna_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	
	public int updateAnswer(Connection conn, int no, String answer) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}







