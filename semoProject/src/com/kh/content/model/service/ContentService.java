package com.kh.content.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.content.model.dao.ContentDao;
import com.kh.content.model.vo.Content;
import static com.kh.common.JDBCTemplate.*;

public class ContentService {
	
	/**
	 * Admin - 전체 조회
	 * @return
	 */
	public ArrayList<Content> adminSelectList() {
		Connection conn = getConnection();
		
		ArrayList<Content> list = new ContentDao().adminSelectList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * Admin - 글 하나 조회
	 * @param no
	 * @return
	 */
	public Content adminSelectContent(int no) {
		Connection conn = getConnection();
		
		Content c = new ContentDao().adminSelectContent(conn, no);
		
		close(conn);
		
		return c;
	}
	
	/**
	 * Admin - 글 작성
	 * @param title
	 * @param content
	 * @return
	 */
	public int insertContent(String title, String content) {
		Connection conn = getConnection();
		
		int result = new ContentDao().insertContent(conn, title, content);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 글 수정
	 * @param c
	 * @return
	 */
	public int updateContent(Content c) {
		Connection conn = getConnection();
		
		int result = new ContentDao().updateContent(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * Admin - 글 삭제
	 * @param no
	 * @return
	 */
	public int deleteContent(int no) {
		Connection conn = getConnection();
		
		int result = new ContentDao().deleteContent(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
