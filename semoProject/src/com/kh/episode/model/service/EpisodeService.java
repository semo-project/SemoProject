package com.kh.episode.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.episode.model.vo.Comment;
import com.kh.episode.model.vo.Episode;
import com.kh.common.PageInfo;
import com.kh.episode.model.dao.EpisodeDao;


public class EpisodeService {

	
	public ArrayList<Comment> selectReplyList(int eNo){
		Connection conn = getConnection();
		
		ArrayList<Comment> list = new EpisodeDao().selectReplyList(conn, eNo);
		
		close(conn);
		
		return list;
	}
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		
		int result = new EpisodeDao().insertComment(conn, c);
		
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
} 
