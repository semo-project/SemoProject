package com.kh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
									  rset.getString("MEMBER_ID"),
									  rset.getString("MEMBER_PWD"),
									  rset.getString("MEMBER_NAME"),
									  rset.getString("MEMBER_NICKNAME"),
									  rset.getString("MEMBER_ADDRESS"),
									  rset.getString("PHONE"),
									  rset.getInt("AGE"),
									  rset.getString("GENDER"),
									  rset.getString("EMAIL"),
									  rset.getDate("ENROLL_DATE"),
									  rset.getInt("MYCOOKIE_CNT"),
									  rset.getString("ENT_YN"),
									  rset.getDate("ENT_DATE"),
									  rset.getString("ACCUSATION_FLAG"),
									  rset.getInt("ACCUSATION_CNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public Member selectMember(Connection conn, String userId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MEMBER_NO"),
								 rset.getString("MEMBER_ID"),
								 rset.getString("MEMBER_PWD"),
								 rset.getString("MEMBER_NAME"),
								 rset.getString("MEMBER_NICKNAME"),
								 rset.getString("MEMBER_ADDRESS"),
								 rset.getString("PHONE"),
								 rset.getInt("AGE"),
								 rset.getString("GENDER"),
								 rset.getString("EMAIL"),
								 rset.getDate("ENROLL_DATE"),
								 rset.getInt("MYCOOKIE_CNT"),
								 rset.getString("ENT_YN"),
								 rset.getDate("ENT_DATE"),
								 rset.getString("ACCUSATION_FLAG"),
								 rset.getInt("ACCUSATION_CNT"));
				mem.setApprovalFlag(rset.getString("APPROVAL_FLAG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
		
	}
	
	public int updateMember(Connection conn, Member mem) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberNickname());
			pstmt.setString(2, mem.getMemberAddress());
			pstmt.setString(3, mem.getPhone());
			pstmt.setString(4, mem.getEmail());
			pstmt.setString(5, mem.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updatePwd(Connection conn, String userId, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
