package com.kh.work.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.episode.model.vo.Episode;
import com.kh.work.model.vo.Work;

public class WorkDao {
	
	private Properties prop = new Properties();
	
	public WorkDao() {
		String fileName = WorkDao.class.getResource("/sql/work/work-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//장르를 건들어야하는 .
	//sql 
	
	public int insertWorkGenre(Connection conn, Work w) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertWorkGenre");
		
		int []genre =w.getWorkGenre();
		
			
			try {
				for(int i =0; i<genre.length ; i++) {
				
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, genre[i]);
				
				result = pstmt.executeUpdate();
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
				close(pstmt);
			}

			
			//스트링 업데이트데이라는 거 만들고 
			
			//서블릿.getupdate데이 메소드 실행시켜서 
			//워크객체에 담겨있는 제대로 빼오는 작업. 
			
		
			
			return result;
		}
		 
		
		
	
	
	//작품 insert 
	public int insertWork(Connection conn, Work w) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWork");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, w.getWorkUpdateDay()); 
			pstmt.setString(2, w.getWorkSummary());
			pstmt.setString(3, w.getWorkPlot());
			pstmt.setString(4, w.getThumbnailModify());
			pstmt.setString(5, w.getWorktitle());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
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
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Work> selectList(Connection conn, PageInfo pi){
		ArrayList<Work> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * ex) boardLimit : 10
			 * currentPage : 1		--> startRow : 1 	endRow : 10
			 * currentPage : 2		--> startRow : 11	endRow : 20
			 * currentPage : 3		--> startRow : 21	endRow : 30
			 * 
			 * startRow : (currentPage - 1) * WorkLimit + 1
			 * endRow : startRow + WorkLimit - 1
			 */
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// LSH
	public int getWorkListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getWorkListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	// LSH
	public ArrayList<Work> adminWorkList(Connection conn, PageInfo pi) {
		ArrayList<Work> list = new ArrayList<>();
				
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminWorkList");
		
		try {
			pstmt = conn.prepareStatement(sql);			

			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Work w = new Work();
				
				w.setWorktitle(rset.getString("work_title"));
				w.setNickName(rset.getString("member_nickname"));
				w.setWriterNo(rset.getInt("writer_no"));
				
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// LSH
	public int getWorkSearchListCount(Connection conn, String search) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String sql = prop.getProperty("getWorkSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// LSH
	public ArrayList<Work> adminWorkSearchList(Connection conn, PageInfo pi, String search) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Work> list = new ArrayList<>();
		
		String sql = prop.getProperty("adminWorkSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Work w = new Work();
				
				w.setWorktitle(rset.getString("work_title"));
				w.setNickName(rset.getString("member_nickname"));
				w.setWriterNo(rset.getInt("writer_no"));
				
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
 
	// LSH
	public int getAdminWorkWriterCount(Connection conn, int no) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAdminWorkWriterCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return listCount;
	}
	
	public ArrayList<Work> selectAdminWorkWriterList(Connection conn, PageInfo pi, int no) {
		ArrayList<Work> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminWorkWriterList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Work w = new Work();
				
				// 여기서는 장르가 여러 값일 수 있기 때문에 장르 빼고 불러오기
				w.setNickName(rset.getString("member_nickname"));
				w.setWorktitle(rset.getString("work_title"));
				w.setWorkSummary(rset.getString("work_summary"));
				w.setWorkNo(rset.getInt("work_no"));
				w.setSecretFlag(rset.getString("secret_flag"));
				w.setWriterNo(rset.getInt("writer_no"));
				
				list.add(w);
			}
			
			// 만약 해당하는 작품이 하나라도 존재한다면
			if(list.size() > 0 ){
				// 장르 세팅해주러
				adminSetGenre(conn, list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// LSH
	// 작품 별로 장르를 담아오는 메서드,, sql문으로 작성하면 될 거 같은데 몸이 고생하는 중
	public void adminSetGenre(Connection conn, ArrayList<Work> list) {

		// 갑자기 분위기 장르
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		// 장르 담아줄 변수 (작품마다 다르게 담겨야 하기 때문에 초기화는 해주지 않고 선언만)
		ArrayList<String> genre;
		
		// 장르 이름만 받아올 sql 구문
		String genreSql = prop.getProperty("selectGenre");
		
		try {
			pst = conn.prepareStatement(genreSql);
			
			// work는 언제든지 리스트로 여러 개일 수 있기 때문에 for문
			for(Work w : list) {
				// workNo를 for문으로 돌려가며 받아줌
				pst.setInt(1, w.getWorkNo());
				rs = pst.executeQuery();
				
				// genre_name만 받아올 list
				genre = new ArrayList<>();
				while(rs.next()) {
					genre.add(rs.getString("genre_name"));
				}
				
				// 하나의 작품에 해당하는 모든 장르를 담아 join 함수로 묶어서 string 변수에 담기
				String workGenre = String.join(", ", genre);
				
				// 위에서 세팅한 장르들의 묶음을 해당 Work 변수에 세팅해주기
				w.setGenre(workGenre);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
	}
	
	//LSH
	public int secretWorkConfirm(Connection conn, String no, int flag) {
		int result = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql;
		if(flag == 1) { // 이미 숨김된 건이 있는지 조회
			sql = "SELECT COUNT(*) FROM TB_WORK WHERE SECRET_FLAG = 'Y' AND WORK_NO IN (" + no + ")";
		} else { // 숨김되지 않은 건을 선택했는지 조회
			sql = "SELECT COUNT(*) FROM TB_WORK WHERE SECRET_FLAG = 'N' AND WORK_NO IN (" + no + ")";
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}		
		
		return result;
	}
	
	//LSH
	public int secretWork(Connection conn, String no, int flag) {
		
		Statement stmt = null;
		int result = 0;
		
		String sql;
		if(flag == 1) {
			sql = "UPDATE TB_WORK SET SECRET_FLAG = 'Y' WHERE WORK_NO IN (" + no + ")";
		} else {
			sql = "UPDATE TB_WORK SET SECRET_FLAG = 'N' WHERE WORK_NO IN (" + no + ")";			
		}
		
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}
	
	// LSH
	public int getAdminWriterSearchCount(Connection conn, int no, String search) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAdminWriterSearchCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return listCount;
	}
	
	//LSH
	public ArrayList<Work> selectAdminWriterSearchList(Connection conn, PageInfo pi, int no, String search) {
		ArrayList<Work> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminWriterSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, no);
			pstmt.setString(2, search);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Work w = new Work();
				
				// 여기서는 장르가 여러 값일 수 있기 때문에 장르 빼고 불러오기
				w.setNickName(rset.getString("member_nickname"));
				w.setWorktitle(rset.getString("work_title"));
				w.setWorkSummary(rset.getString("work_summary"));
				w.setWorkNo(rset.getInt("work_no"));
				w.setSecretFlag(rset.getString("secret_flag"));
				w.setWriterNo(rset.getInt("writer_no"));
				
				list.add(w);
			}
			
			// 만약 해당하는 작품이 하나라도 존재한다면
			if(list.size() > 0 ){
				// 장르 세팅해주러
				adminSetGenre(conn, list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//LSH
	public int getAdminEpisodeCnt(Connection conn, int no) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAdminEpisodeCnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	//LSH
	public ArrayList<Work> selectAdminEpisode(Connection conn, PageInfo pi, int no) {
		ArrayList<Work> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminEpisode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Work w = new Work();
				
				w.setWorkNo(rset.getInt("work_no"));
				w.setWorktitle(rset.getString("work_title"));
				w.setNickName(rset.getString("member_nickname"));
				w.setEpisodeNo(rset.getInt("episode_no"));
				w.setSecretFlag(rset.getString("secret_flag"));
				w.setEpisodeTitle(rset.getString("episode_title"));
				
				list.add(w);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//LSH
	public int getAdminEpiSearchCnt(Connection conn, int no, String search) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String sql = prop.getProperty("getAdminEpiSearchCnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	//LSH
	public ArrayList<Work> selectAdminEpiSearch(Connection conn, PageInfo pi, int no, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Work> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAdminEpiSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getWorkLimit() + 1;
			int endRow = startRow + pi.getWorkLimit() - 1;
			
			pstmt.setInt(1, no);
			pstmt.setString(2, search);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Work w = new Work();
				
				w.setWorkNo(rset.getInt("work_no"));
				w.setWorktitle(rset.getString("work_title"));
				w.setNickName(rset.getString("member_nickname"));
				w.setEpisodeNo(rset.getInt("episode_no"));
				w.setSecretFlag(rset.getString("secret_flag"));
				w.setEpisodeTitle(rset.getString("episode_title"));
				
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
