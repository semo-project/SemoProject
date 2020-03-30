package com.kh.admin.controller;

import java.sql.Connection;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.kh.admin.model.dao.VisitCount;

import static com.kh.common.JDBCTemplate.*;

/**
 * 방문자를 집계하는 리스너 (톰캣 실행 시에 실행된다)
 *
 */
@WebListener
public class VisitListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public VisitListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
    	// 세션이 새로 시작될 때마다 실행되는 메서드
    	if(arg0.getSession().isNew()){
            execute(arg0);
        }
    }
    
    private void execute(HttpSessionEvent sessionEve) 
    {
		Connection conn = getConnection();
        VisitCount dao = new VisitCount();
        try {
            // 방문자 수 1 추가
            dao.setTotalCount(conn);
            // 총 방문자 수
            int totalCount = dao.getTotalCount(conn);
            // 오늘 방문자 수
            int todayCount = dao.getTodayCount(conn);
            
            HttpSession session = sessionEve.getSession();
            
            // 세션에 방문자 수를 담는다.
            session.setAttribute("totalCount", totalCount); 
            session.setAttribute("todayCount", todayCount);
            
        } catch (Exception e) {
            System.out.println("===== 방문자 카운터 오류 =====\n");
            e.printStackTrace();
        } finally {
        	close(conn);
        }
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
