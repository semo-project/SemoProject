package com.kh.episode.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.episode.model.vo.Comment;
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
}
