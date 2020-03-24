package com.kh.report.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.PageInfo;
import com.kh.report.model.vo.Report;

import static com.kh.common.JDBCTemplate.*;

public class ReportDao {

	private Properties prop = new Properties();
	
	public ReportDao() {
		
		String fileName = MemberDao.class.getResource("/sql/report/report-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListBoardCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListBoardCount");
		
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
	
	public ArrayList<Report> selectBoardList(Connection conn, PageInfo pi) {
		ArrayList<Report> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Report r = new Report();
				
				r.setReportNo(rset.getInt("report_no"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setReportClassName(rset.getString("report_class_name"));
				r.setWritingNo(rset.getInt("writing_no"));
				r.setBoardTitle(rset.getString("board_title"));
				r.setReportDate(rset.getDate("report_date"));
				r.setReportContent(rset.getString("report_content"));
				r.setBoardGroupName(rset.getString("group_name"));
				
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
	
	public int getSearchBoardCount(Connection conn, String search) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
 		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Report> selectSearchBoardList(Connection conn, PageInfo pi, String search) {
		ArrayList<Report> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Report r = new Report();
				
				r.setReportNo(rset.getInt("report_no"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setReportClassName(rset.getString("report_class_name"));
				r.setWritingNo(rset.getInt("writing_no"));
				r.setBoardTitle(rset.getString("board_title"));
				r.setReportDate(rset.getDate("report_date"));
				r.setReportContent(rset.getString("report_content"));
				r.setBoardGroupName(rset.getString("group_name"));
				
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
	
	public int confirmReport(Connection conn, String no) {
		int result = 0;
		
		Statement stmt = null;
		
		String sql = "UPDATE TB_REPORT SET CONFIRM_FLAG = 'Y' WHERE REPORT_NO IN (" + no + ")";
		
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
	
	public int plusReportCnt(Connection conn, String no) {
		int result = 0;
		Statement stmt = null;
		
		String sql = "MERGE INTO TB_MEMBER M USING (SELECT MEMBER_NO FROM TB_REPORT WHERE REPORT_NO IN (" + no + ")) R ON (M.MEMBER_NO = R.MEMBER_NO) WHEN MATCHED THEN UPDATE SET M.ACCUSATION_CNT = M.ACCUSATION_CNT + 1";
		
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
	
	public int getListCommentCount(Connection conn) {
		int result = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCommentCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Report> selectCommentList(Connection conn, PageInfo pi) {
		
		ArrayList<Report> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Report r = new Report();
				
				r.setReportContent(rset.getString("report_content"));
				r.setCommentContent(rset.getString("report_comment"));
				
				r.setReportNo(rset.getInt("report_no"));
				r.setReportGroupNo(rset.getInt("report_group_no"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setMemberId(rset.getString("member_id"));
				r.setReportClassName(rset.getString("report_class_name"));
				r.setReportDate(rset.getDate("report_date"));
				
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
}
