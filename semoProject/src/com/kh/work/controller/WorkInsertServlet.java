package com.kh.work.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.work.model.service.WorkService;
import com.kh.work.model.vo.Work;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class WorkInsertServlet
 */
@WebServlet("/insert.wr")
public class WorkInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글자처리
		request.setCharacterEncoding("UTF-8");
	
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//크기지정
			int maxSize = 1024*1024*10;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			//담아줄 첨부파일 경로
			String savePath = resources + "\\work_upfiles\\";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//연재요일
			String[] updateDay = multiRequest.getParameterValues("updateday");
			
			//		연재요일 > 배열로 담아온것을 조인해여 변환(장르와조인)3
			String updateDay1 = String.join(",",updateDay);
			String [] stgenre = multiRequest.getParameterValues("genre");		
		    int[] genre = new int[stgenre.length];
		      
		    	for(int i=0;i<stgenre.length;i++) {
		         
		    		genre[i]= Integer.parseInt(stgenre[i]);
		    	}	    	
		    	
			//작품 시작일
		    String d = multiRequest.getParameter("startday");
		    Date startday =Date.valueOf(d);
		    
		    
			//작품요약
			String summary = multiRequest.getParameter("summary");
			//작품줄거리
			String plot = multiRequest.getParameter("plot");	
			
			
		
			//첨부파일
			String file1= multiRequest.getFilesystemName("file1"); 
			
			//작가 로그인 번호
			int writerNo = Integer.parseInt(multiRequest.getParameter("writerNo")); 
	         
			
			//작품제목
			String title = multiRequest.getParameter("title");	
			
			
			Work w = new Work();		
			
			w.setUpdateDay(updateDay1);
			w.setStartDay(startday);
			w.setWorkSummary(summary);
			w.setWorkPlot(plot);
			w.setThumbnailModify(file1);
			w.setWriterNo(writerNo);
			w.setWorkTitle(title);
			
			
			int result = new WorkService().insertWork(w,genre);
			
			if(result > 0) {
				response.sendRedirect("list.wr");
			}else {
				//에러페이지 
			}
			
//			System.out.println(w); //넘어오나 확인용

		      
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
