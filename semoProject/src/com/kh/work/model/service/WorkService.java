package com.kh.work.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.episode.model.vo.Episode;
import com.kh.work.model.dao.WorkDao;
import com.kh.work.model.vo.Work;

public class WorkService {
	
	// PJH
	public int insertWork(Work w, int[]genre ) {
		
		Connection conn = getConnection();
		
		int result1 = new WorkDao().insertWork(conn, w);
		int result2 = new WorkDao().insertWorkGenre(conn, genre);
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		} 
			close(conn);
			
		return result1*result2;
		
	}
	
	public ArrayList<Work> selectWorkList() {
		Connection conn = getConnection();
		
		ArrayList<Work> list= new WorkDao().selectWorkList(conn);
		
		close(conn);
		
		
		return list;
	}

	/** 
	 * 1. 요일별 게시물 갯수 조회
	 * @return
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 2. 요일별 총 작품 갯수 객체
	 * @param pi
	 * @return
	 */
	public ArrayList<Work> selectList(){
		
		
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2-1. 월일별 총 작품 갯수 객체
	 * @param pi
	 * @return
	 */
	public ArrayList<Work> mondayList(String day){
		
		
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().mondayList(conn,day);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 3. 장르별 게시물 갯수 조회
	 * @return
	 */
	public ArrayList<Work> selectGenreList(){
		
		
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectGenreList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 3-1. 월일별 총 작품 갯수 객체
	 * @param pi
	 * @return
	 */
	public ArrayList<Work> genreList(int genre){
		
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().genreList(conn,genre);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 4. 작가별 게시물 갯수 조회
	 * @return
	 */
	public int getWriterListCount() {
		
		Connection conn = getConnection();
		
		int WriterListCount = new WorkDao().getWriterListCount(conn);
		
		close(conn);
		
		return WriterListCount;
	}
	
	public Work selectSerial(int wno) {
		
		Connection conn = getConnection();
		
		
		Work w = new WorkDao().selectSerial(conn, wno);
		
		
		close(conn);
		
		
		
		
		return w;
			
	}
	
	public ArrayList<Episode> episodeList(int wno) {
		
		Connection conn = getConnection();
		
		ArrayList<Episode> list = new WorkDao().episodeList(conn,wno);
		
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
	
	/**
	 * Admin - 작품 별 에피소드 조회 중 검색어에 맞춘 리스트만 리턴
	 * @param pi
	 * @param no
	 * @param search
	 * @return
	 */
	public ArrayList<Work> selectAdminEpiSearch(PageInfo pi, int no, String search) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectAdminEpiSearch(conn, pi, no, search);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작품 등록 승인을 기다리는 친구들의 수
	 * @return
	 */
	public int getWorkApprovListCount() {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getWorkApprovListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 작품 등록 승인을 기다리는 친구들의 모임
	 * @param pi
	 * @return
	 */
	public ArrayList<Work> adminWorkApprovList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().adminWorkApprovList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작품 등록 승인 대기 건 중 검색된 친구들의 수
	 * @param search
	 * @return
	 */
	public int getWorkApprovSearchCnt(String search) {
		Connection conn = getConnection();
		
		int listCount = new WorkDao().getWorkApprovSearchCnt(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 작품 등록 승인
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Work> selectWorkApprovSearch(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectWorkApprovSearch(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 작품 승인
	 * @param no
	 * @return
	 */
	public int approvConfirm(String no) {
		Connection conn = getConnection();
		
		int result = new WorkDao().approvConfirm(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 작품 승인 건 세부조회
	 * @param no
	 * @return
	 */
	public Work getApprovWork(int no) {
		Connection conn = getConnection();
		
		Work w = new WorkDao().getApprovWork(conn, no);
		
		close(conn);
		
		return w;
	}
}
