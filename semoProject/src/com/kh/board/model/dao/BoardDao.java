package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Comment;
import com.kh.board.model.vo.PageInfo;

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// KJY
	public int countList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Board> selectMyList(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		String sql = prop.getProperty("selectMyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("RNUM"),
								   rset.getInt("BOARD_NO"),
								   rset.getString("BOARD_TITLE"),
								   rset.getDate("BOARD_WRITEDATE"),
								   rset.getInt("BOARD_CNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getInt("board_Cnt"),
								   rset.getString("member_No"),
								   rset.getDate("board_WriteDate")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int webCount(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("webCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Board webDetail(Connection conn, int boardNo) {
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("webDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getInt("board_cnt"),
							  rset.getString("member_nickname"),
							  rset.getDate("board_writedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public int updateBoard(Connection conn, Board b){
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateWeb");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteWeb(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteWeb");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int commentInsert(Connection conn, Comment c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("commentInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCommentContent());
			pstmt.setInt(2, Integer.parseInt(c.getCommentWriter()));
			pstmt.setInt(3, c.getComBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Comment> commentList(Connection conn, int boardNo){
		ArrayList<Comment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Comment c = new Comment();
				
				c.setCommentNo(rset.getInt("comment_no"));
				c.setComBoardNo(rset.getInt("board_no"));
				c.setCommentWriter(rset.getString("member_nickname"));
				c.setCommentContent(rset.getString("comment_content"));
				c.setCommentDate(rset.getDate("comment_date"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int commentUp(Connection conn, Comment c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCommentContent());
			pstmt.setInt(2, c.getCommentNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteCom(Connection conn, int commentNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int freeListCount(Connection conn) {
		int result = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("freeListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public ArrayList<Board> selectfreeList(Connection conn, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFreeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getInt("board_Cnt"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int boardReport(Connection conn, String reportRadio, String reportContent, int boardNo, int reporterNo, String boardWriter) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("boardReport");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reportRadio);
			pstmt.setString(2, reportContent);
			pstmt.setInt(3, boardNo);
			pstmt.setInt(4, reporterNo);
			pstmt.setString(5, boardWriter);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public Comment comReportInfo(Connection conn, int comReportNo, String commentWriter, String commentContent) {
		Comment c = new Comment();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("comRepSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comReportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Comment(rset.getString("member_nickname"),
								rset.getString("comment_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	public int comRepSend(Connection conn, int comRepNo, String comRepRadio, String comRepContent, int memberNo) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("commentReport");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comRepRadio);
			pstmt.setString(2, comRepContent);
			pstmt.setInt(3, comRepNo);
			pstmt.setInt(4, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<Board> boardSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBoardT");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Board> boardWSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBoardW");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Board> boardCSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBoardC");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertfreeBoard(Connection conn, Board b) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int freeCount(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("freeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Board freeDetail(Connection conn, int boardNo) {
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("freeDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getInt("board_cnt"),
							  rset.getString("member_nickname"),
							  rset.getDate("board_writedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public int updateFree(Connection conn, Board b){
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteFree(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Board> freeSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchFreeT");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Board> freeWSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchFreeW");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Board> freeCSearch(Connection conn, String searchContent){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchFreeC");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_No"),
								   rset.getString("board_Title"),
								   rset.getString("member_no"),
								   rset.getDate("board_WriteDate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
}

