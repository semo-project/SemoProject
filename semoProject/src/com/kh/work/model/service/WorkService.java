package com.kh.work.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.work.model.dao.WorkDao;
import com.kh.work.model.vo.Work;

public class WorkService {
	
	public int insertWork(Work w) {
		
		Connection conn = getConnection();
		
		int result1 = new WorkDao().insertWork(conn, w);
		int result2 = new WorkDao().insertWorkGenre(conn, w);
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		} 
		
		close(conn);			
		
		return result1*result2;
	}
	
	/** 
	 * 1. 연재 리스트 총갯수 조회용 서비스
	 * @return
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1_2. 웹툰 리스트 조회용 서비스
	 * @param pi	currentPage, boardLimit 값이 담겨있는 PageInfo객체
	 * @return		현재페이지에 보여져야할 게시판리스트
	 */
	public ArrayList<Work> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 전체 작품 조회 시 개수 리턴
	 * @return
	 */
	public int getWorkListCount() {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getWorkListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 전체 작품 리스트 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Work> adminWorkList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().adminWorkList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 검색어에 맞춘 작품 리스트 수 반환
	 * @param search
	 * @return
	 */
	public int getWorkSearchListCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getWorkSearchListCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색어에 맞춘 작품 리스트 전체 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Work> adminWorkSearchList(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().adminWorkSearchList(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
}
