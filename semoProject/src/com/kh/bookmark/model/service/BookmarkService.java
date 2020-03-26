package com.kh.bookmark.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.PageInfo;
import com.kh.bookmark.model.dao.BookmarkDao;
import com.kh.bookmark.model.vo.Bookmark;

public class BookmarkService {
	
	public int countList(int userNo) {
		Connection conn = getConnection();
		int result = new BookmarkDao().countList(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Bookmark> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Bookmark> list = new BookmarkDao().selectList(conn, pi, userNo);
		close(conn);
		return list;
	}

}
