package com.kh.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.MemberStats;
import com.kh.admin.model.vo.VisitStats;
import com.kh.board.model.dao.BoardDao;

import static com.kh.common.JDBCTemplate.*;

public class StatsDao {

private Properties prop = new Properties();
	
	public StatsDao() {
		String fileName = BoardDao.class.getResource("/sql/stats/stats-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberStats> getMemberStats(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<MemberStats> list = new ArrayList<>();
		
		String sql = prop.getProperty("getMemberStats");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				MemberStats m = new MemberStats();
				
				// 성별 F 또는 G
				m.setGender(rset.getString("gender"));
				
				// 10세 이하 없다고 가정...
				m.setAge(rset.getInt("ageCount"));
				
				// 전체 카운트 수
				m.setCount(rset.getInt(3));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public ArrayList<VisitStats> getVisitStats(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<VisitStats> list = new ArrayList<>();
		
		String sql = prop.getProperty("getVisitStats");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				VisitStats v = new VisitStats(rset.getString(2), rset.getInt(1));
				list.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
}
