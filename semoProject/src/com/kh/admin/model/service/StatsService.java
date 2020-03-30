package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.StatsDao;
import com.kh.admin.model.vo.MemberStats;
import com.kh.admin.model.vo.VisitStats;

import static com.kh.common.JDBCTemplate.*;

public class StatsService {
	
	/**
	 * Admin - 회원 연령별 성별 조회
	 * @return
	 */
	public ArrayList<MemberStats> getMemberStats() {
		Connection conn = getConnection();
		
		ArrayList<MemberStats> list = new StatsDao().getMemberStats(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<VisitStats> getVisitStats() {
		Connection conn = getConnection();
		
		ArrayList<VisitStats> list = new StatsDao().getVisitStats(conn);
		
		close(conn);
		
		return list; 
	}

}
