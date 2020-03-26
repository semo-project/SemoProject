package com.kh.epLike.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.board.model.vo.PageInfo;
import com.kh.epLike.model.dao.EpLikeDao;
import com.kh.epLike.model.vo.EpLike;

public class EpLikeService {
	
	public int countList(int userNo) {
		Connection conn = getConnection();
		int result = new EpLikeDao().countList(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<EpLike> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<EpLike> list = new EpLikeDao().selectList(conn, pi, userNo);
		close(conn);
		return list;
	}

}
