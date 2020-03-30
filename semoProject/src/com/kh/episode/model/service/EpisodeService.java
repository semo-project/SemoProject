package com.kh.episode.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.episode.model.vo.Commentep;
import com.kh.episode.model.vo.Commentep;
import com.kh.episode.model.vo.EpNotice;
import com.kh.episode.model.vo.Episode;
import com.kh.episode.model.vo.Reply;
import com.kh.common.PageInfo;
import com.kh.episode.model.dao.EpisodeDao;


public class EpisodeService {

	
	public ArrayList<Reply> selectReplyList(int eNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new EpisodeDao().selectReplyList(conn, eNo);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 에피소드 디테일
	 * @param genre
	 * @return
	 */

	
	public Episode episodeDetail(int eno) {
		Connection conn = getConnection();
		
		Episode e = new EpisodeDao().episodeDetail(conn, eno);
		
		
		close(conn);
		
		return e;
	}
	
	/**
	 * 에피소드 댓글 넣어주는
	 * @param r
	 * @return
	 */
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn); 
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 에피소드 이미 숨김처리/숨김해제 되어있는지 확인하는 메서드
	 * @param no
	 * @param flag
	 * @return
	 */
	public int secretEpisodeConfirm(String no, int flag) {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().secretEpisodeConfirm(conn, no, flag);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 에피소드 숨김처리
	 * @param no
	 * @param flag
	 * @return
	 */
	public int secretEpisode(String no, int flag) {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().secretWork(conn, no, flag);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 에피소드 등록 대기 전체 수 리턴
	 * @return
	 */
	public int getEpiApprovListCount() {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().getEpiApprovListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 페이지 정보에 맞춰진 에피소드 등록 대기 건 전체 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Episode> adminEpiApprovList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Episode> list = new EpisodeDao().adminEpiApprovList(conn, pi);
		
		close(conn);
		
		return list;
	}

	/**
	 * 공지사항 조회
	 * @param wno
	 * @return
	 */
	public ArrayList<EpNotice> selectWnList(int wno) {
		Connection conn = getConnection();
		
		ArrayList<EpNotice> list = new EpisodeDao().selectWnList(conn, wno);
		
		
		close(conn);
		
		return list;
}
	
	/**
	 * Admin - 검색어에 맞춰진 에피소드 승인 건 전체 수 리턴
	 * @param search
	 * @return
	 */
	public int getEpiApprovSearchCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new EpisodeDao().getEpiApprovSearchCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * Admin - 검색어에 맞춰진 에피소드 승인 건 전체 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Episode> adminEpiApprovSearch(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Episode> list = new EpisodeDao().adminEpiApprovSearch(conn, pi, search);

		
		close(conn);
		
		return list;
	}


	
	/**
	 * Admin - 에피소드 대기 승인
	 * @param no
	 * @return
	 */
	public int epApprovConfirm(String no) {
		Connection conn = getConnection();
		System.out.println("test");
		int result = new EpisodeDao().epApprovConfirm(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 에피소드 디테일 조회
	 * @param no
	 * @return
	 */
	public Episode getEpisodeApprov(int no) {
		Connection conn = getConnection();
		
		Episode ep = new EpisodeDao().getEpisodeApprov(conn, no);
		
		close(conn);
		
		return ep;
	}
	
	//에피소드 리스트 조회
	public ArrayList<Episode> selectEpisodeList(int wNo) {

		Connection conn=getConnection();
		
		ArrayList<Episode> list = new EpisodeDao().selectEpisodeList(conn, wNo);
		
		
		close(conn);
		return list;
	}

	public Episode test(int wNo) {
		Connection conn=getConnection();
		
		Episode e = new EpisodeDao().test(conn, wNo);
		return e;
	}
	/**
	 * 댓글 신고창
	 * @param comReportNo
	 * @param commentWriter
	 * @param commentContent
	 * @return
	 */
	public Commentep coReportInfo(int comReportNo, String commentWriter, String commentContent) {
		Connection conn = getConnection();
		
		Commentep c = new EpisodeDao().coReportInfo(conn, comReportNo, commentWriter, commentContent);
		
		close(conn);
		
		return c;
	}
	
	//댓글 신고기능
	public int coRepSend(int comRepNo, String comRepRadio, String comRepContent, int memberNo) {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().coRepSend(conn, comRepNo, comRepRadio, comRepContent, memberNo);
		
		close(conn);
		
		return result;
	}

	

	
} 
