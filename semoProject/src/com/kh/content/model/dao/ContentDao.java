package com.kh.content.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.content.model.vo.Content;

public class ContentDao {
	
	private Properties prop =new Properties();
	
	public ContentDao() {
		String fileName = ContentDao.class.getResource("/sql/notice/content-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//전체조회
	public ArrayList<Content> selectList(Connection conn){
		ArrayList<Content> list=  new ArrayList<>();
		return list;
			
	}

}
