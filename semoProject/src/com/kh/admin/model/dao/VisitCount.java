package com.kh.admin.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class VisitCount {
	
	private Properties prop = new Properties();
	
	public VisitCount() {
		
		String fileName = VisitCount.class.getResource("/sql/visit/visit-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * 총방문자수를 증가시킨다.
     */
    public void setTotalCount(Connection conn) throws SQLException
    {
        PreparedStatement pstmt = null;
        
        try {
            
            // 쿼리생성
            // 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
            String sql = prop.getProperty("setTotalCount");            
                        
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            pstmt = conn.prepareStatement(sql);
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            commit(conn);
            
        } catch (SQLException sqle) {
            rollback(conn);
        } finally {
	        close(pstmt);
        }
    }
    
    /**
     * 총 방문자수를 가져온다.
     * @return totalCount : 총 방문자 수
     */
    public int getTotalCount(Connection conn)
    {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalCount = 0;
        
        try {
            
            // 테이블의 테이터 수를 가져온다.
            // 데이터 수 = 총 방문자 수
        	String sql = prop.getProperty("getTotalCount");
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // 방문자 수를 변수에 담는다.
            if (rs.next()) 
                totalCount = rs.getInt("TotalCnt");
            
            return totalCount;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
        	close(rs);
            close(pstmt);
        }
    }
    
    /**
     * 오늘 방문자 수를 가져온다.
     * @return todayCount : 오늘 방문자
     */
    public int getTodayCount(Connection conn)
    {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int todayCount = 0;
        
        try {
            
        	String sql = prop.getProperty("getTodayCount");
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // 방문자 수를 변수에 담는다.
            if (rs.next()) 
                todayCount = rs.getInt("TodayCnt");
            
            return todayCount;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            close(pstmt);
        }
    }

}
