package com.kh.work.model.service;


import static com.kh.common.JDBCTemplate.*;




import java.sql.Connection;
import java.util.ArrayList;

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
}
