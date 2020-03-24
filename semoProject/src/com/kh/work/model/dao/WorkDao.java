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
				list.add(new Work(rset.getInt("workNo"),
									rset.getString()))
								
							
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
