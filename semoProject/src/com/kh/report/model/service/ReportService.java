package com.kh.report.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.vo.PageInfo;
import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;

public class ReportService {

	/**
	 * Admin - 신고 전체 글 수 
	 * @return
	 */
	public int getListBoardCount() {
		Connection conn = getConnection();
		
		int listCount = new ReportDao().getListBoardCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 신고 전체 글 리턴
	 * @param pi
	 * @param groupNo
	 * @return
	 */
	public ArrayList<Report> selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectBoardList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 검색어에 해당하는 신고 글 수 리턴
	 * @param groupNo
	 * @param search
	 * @return
	 */
	public int getSearchBoardCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new ReportDao().getSearchBoardCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색어에 해당하는 신고 글 리스트 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Report> selectSearchBoardList(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectSearchBoardList(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 신고 확인
	 * @param no
	 * @return
	 */
	public int confirmReport(String no) {
		Connection conn = getConnection();
		
		// 신고 테이블에 확인 여부를 체크해주는 작업
		int result1 = new ReportDao().confirmReport(conn, no);
		int result2 = 0;
		
		if(result1 > 0) {			
			// 멤버 테이블에 신고 수를 늘려주는 작업
			result2 = new ReportDao().plusReportCnt(conn, no);
			
			if(result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
					
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	/**
	 * Admin - 댓글 신고 전체 수 리턴
	 * @return
	 */
	public int getListCommentCount() {
		Connection conn = getConnection();
		
		int result = new ReportDao().getListCommentCount(conn);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 댓글 신고 전체 건 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Report> selectCommentList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectCommentList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 검색어에 맞춘 댓글 신고 수 리턴
	 * @param search
	 * @return
	 */
	public int getListCommentSearchCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new ReportDao().getListCommentSearchCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색어에 맞춘 댓글 신고 전체 건 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Report> selectCommentSearchList(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectCommentSearchList(conn, pi, search);
		
		close(conn);
		
		return list;
	}

}
