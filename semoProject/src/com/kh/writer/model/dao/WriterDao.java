package com.kh.writer.model.dao;

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
import com.kh.writer.model.vo.Writer;

import static com.kh.common.JDBCTemplate.*;

public class WriterDao {
	
	private Properties prop = new Properties();
	
	public WriterDao(){
		
		String fileName = MemberDao.class.getResource("/sql/writer/writer-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListApprovCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String sql = prop.getProperty("getListApprovCount");
		
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
	
	public ArrayList<Writer> selectWriterApprov(Connection conn, PageInfo pi) {
		ArrayList<Writer> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListWriterApprov");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Writer(rset.getInt("member_no"),
									rset.getString("member_name"),
									rset.getString("member_id"),
									rset.getString("member_nickname")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int getSearchApprovCount(Connection conn, String name) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchApprovCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
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
	
	public ArrayList<Writer> searchApprovWriter(Connection conn, PageInfo pi, String name) {
		ArrayList<Writer> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchApprovWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);			

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, name);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Writer(rset.getInt("member_no"),
									rset.getString("member_name"),
									rset.getString("member_id"),
									rset.getString("member_nickname")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Writer getApprovWriter(Connection conn, int no) {
		Writer w = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getApprovWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Writer(rset.getInt("member_no"),
							   rset.getString("rep_work_exp"),
							   rset.getString("original_name"),
							   rset.getString("change_name"),
							   rset.getString("member_nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return w;
	}
	
	public int approveWriter(Connection conn, String[] noArray) {
		
		Statement stmt = null;
		int result = 0;
		
		// 작가 신청 번호들을 묶어주자
		String no = String.join(", ", noArray);
		// 이렇게 하니까 안 되네 
		String sql = "UPDATE TB_WRITER SET APPROVAL_FLAG='Y', APPROVAL_DATE = SYSDATE WHERE APPROVAL_FLAG='N' AND MEMBER_NO IN (" + no + ")";
		
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
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
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
	
	public ArrayList<Writer> selectWriter(Connection conn, PageInfo pi) {
		
		ArrayList<Writer> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Writer(rset.getInt("member_no"),
									rset.getString("account_no"),
									rset.getString("bank_name"),
									rset.getString("member_name"),
									rset.getString("member_nickname"),
									rset.getString("member_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int getSearchListCount(Connection conn, String search) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchListCount");
		
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

	public ArrayList<Writer> selectSearchWriter(Connection conn, PageInfo pi, String search) {
	
		ArrayList<Writer> list = new ArrayList<>(); 
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Writer(rset.getInt("member_no"),
									rset.getString("account_no"),
									rset.getString("bank_name"),
									rset.getString("member_name"),
									rset.getString("member_nickname"),
									rset.getString("member_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int restWriter(Connection conn, String no) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		Statement stmt = null;

		String sql = "UPDATE TB_WRITER SET REST_FLAG = 'Y' WHERE MEMBER_NO IN (" + no + ")";
		
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
	
	public int authorRequest(Connection conn, Writer w) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("authorRequest");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, w.getWriterNo());
			pstmt.setString(2, w.getAccountNo());
			pstmt.setString(3, w.getRepWorkExp());
			pstmt.setString(4, w.getBankName());
			pstmt.setString(5, w.getOriginalName());
			pstmt.setString(6, w.getChangeName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
