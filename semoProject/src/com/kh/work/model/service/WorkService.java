package com.kh.work.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.episode.model.vo.Episode;
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
	
	/**
	 * Admin - 작가별 작품 조회 리스트 전체 수 리턴
	 * @return
	 */
	public int getAdminWorkWriterCount(int no) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getAdminWorkWriterCount(conn, no);
		
		close(conn);
		
		return listCount;		
	}
	
	/**
	 * Admin - 작가 별 작품 조회 리스트 전체 리턴
	 * @param pi
	 * @param no
	 * @return
	 */
	public ArrayList<Work> selectAdminWorkWriterList(PageInfo pi, int no) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectAdminWorkWriterList(conn, pi, no);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작가 별 작품 중 숨김처리를 하고 싶은 작품 중 숨김처리 여부 확인
	 * @param no
	 * @return
	 */
	public int secretWorkConfirm(String no, int flag) {
		Connection conn = getConnection();
		
		int result = new WorkDao().secretWorkConfirm(conn, no, flag);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 작품 숨김 처리 및 해제
	 * @param no
	 * @return
	 */
	public int secretWork(String no, int flag) {
		Connection conn = getConnection();
		
		int result = new WorkDao().secretWork(conn, no, flag);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 검색어에 맞춰 작가 별 작품 리스트 전체 수 리턴
	 * @param no
	 * @param search
	 * @return
	 */
	public int getAdminWriterSearchCount(int no, String search) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getAdminWriterSearchCount(conn, no, search);
		
		close(conn);
		
		return listCount;		
	}
	
	/**
	 * Admin - 검색어에 맞춰진 작가의 작가 별 작품 리스트 전체 리턴
	 * @param pi
	 * @param no
	 * @param search
	 * @return
	 */
	public ArrayList<Work> selectAdminWriterSearchList(PageInfo pi, int no, String search) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectAdminWriterSearchList(conn, pi, no, search);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작품 별 에피소드 조회 전체 수 리턴
	 * @param no
	 * @return
	 */
	public int getAdminEpisodeCnt(int no) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getAdminEpisodeCnt(conn, no);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 작품 별 에피소드 전체 조회 
	 * @param pi
	 * @param no
	 * @return
	 */
	public ArrayList<Work> selectAdminEpisode(PageInfo pi, int no) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectAdminEpisode(conn, pi, no);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 검색어에 맞춘 에피소드 리스트 전체 수 리턴
	 * @param no
	 * @param search
	 * @return
	 */
	public int getAdminEpiSearchCnt(int no, String search) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getAdminEpiSearchCnt(conn, no, search);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Work> selectAdminEpiSearch(PageInfo pi, int no, String search) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectAdminEpiSearch(conn, pi, no, search);
		
		close(conn);
		
		return list;
	}
	
}
