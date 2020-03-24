package com.kh.writer.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.vo.PageInfo;
import com.kh.writer.model.dao.WriterDao;
import com.kh.writer.model.vo.Writer;

public class WriterService {

	/**
	 * Admin - 작가 승인 대기 전체 수 리턴
	 * @return
	 */
	public int getListApprovCount() {
		Connection conn = getConnection();
		
		int listCount = new WriterDao().getListApprovCount(conn);
		
		close(conn);
		
		return listCount;		
	}
	
	/**
	 * Admin - 페이지 정보에 맞춘 작가 승인 대기 리스트 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Writer> selectWriterApprov(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Writer> list = new WriterDao().selectWriterApprov(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	/**
	 * Admin - 검색된 작가 대기 수 리턴
	 * @param name
	 * @return
	 */
	public int getSearchApprovCount(String name) {
		Connection conn = getConnection();
		
		int listCount = new WriterDao().getSearchApprovCount(conn, name);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색된 작가 대기건을 페이지 정보에 맞춰 리턴
	 * @param pi
	 * @param name
	 * @return
	 */
	public ArrayList<Writer> searchApprovWriter(PageInfo pi, String name) {
		Connection conn = getConnection();
		
		ArrayList<Writer> list = new WriterDao().searchApprovWriter(conn, pi, name);
		
		close(conn);
		
		return list;
	} 
	
	/**
	 * Admin - 작가 대기 건 세부 조회 시
	 * @param no
	 * @return
	 */
	public Writer getApprovWriter(int no) {
		Connection conn = getConnection();
		
		Writer w = new WriterDao().getApprovWriter(conn, no);
		
		close(conn);
		
		return w;
	}
	
	/**
	 * Admin - 작가 대기 승인 
	 * @param noArray
	 * @return
	 */
	public int approveWriter(String[] noArray) {
		Connection conn = getConnection();
		
		int result = new WriterDao().approveWriter(conn, noArray);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 작가 전체 수 리턴
	 * @return
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new WriterDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 페이지 정보에 맞춰 작가 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Writer> selectWriter(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Writer> list = new WriterDao().selectWriter(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 검색어에 해당하는 전체 작가 수 조회
	 * @param search
	 * @return
	 */
	public int getSearchListCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new WriterDao().getSearchListCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색어에 해당하는 전체 작가 리스트 조회
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Writer> selectSearchWriter(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Writer> list = new WriterDao().selectSearchWriter(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작가 휴면 계정 (그냥 휴면이 작가 해제하기)
	 * @param no
	 * @return
	 */
	public int restWriter(String no) {
		Connection conn = getConnection();
		
		int result = new WriterDao().restWriter(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
