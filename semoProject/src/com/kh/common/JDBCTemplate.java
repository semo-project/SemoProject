package com.kh.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

// 2020.03.06 lsh
public class JDBCTemplate {
	
	// service에서 connection을 쉽게 관리하기 위해 만든 메서드
	public static Connection getConnection() {
		// 리턴 할 Connection 객체
		Connection conn = null;
		
		// driver.properites랑 연결할 Properties 객체
		Properties prop = new Properties();
		
		// 연결할 경로 
		String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			Class.forName(prop.getProperty("driver"));
			
			conn = DriverManager.getConnection(prop.getProperty("url"),
											   prop.getProperty("username"),
											   prop.getProperty("password"));	
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 사용 후 닫아주는 메서드들
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insert, update, delete가 성공적으로 수행되면 받아온 connection 객체 commit 해주기
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insert, update, delete가 실패하면 받아온 connection 객체 rollback 해주기
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
