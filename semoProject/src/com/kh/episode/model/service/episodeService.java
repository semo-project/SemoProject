package com.kh.episode.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.episode.model.vo.Comment;
import com.kh.episode.model.vo.Episode;
import com.kh.common.PageInfo;
import com.kh.episode.model.dao.episodeDao;


public class episodeService {

	
	public ArrayList<Comment> selectReplyList(int eNo){
		Connection conn = getConnection();
		
		ArrayList<Comment> list = new episodeDao().selectReplyList(conn, eNo);
		
		close(conn);
		
		return list;
	}
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		
		int result = new episodeDao().insertComment(conn, c);
		
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
		
		int result = new episodeDao().secretEpisodeConfirm(conn, no, flag);
		
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
		
		int result = new episodeDao().secretWork(conn, no, flag);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
} 
