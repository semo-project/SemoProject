package com.kh.work.controller;

import java.io.IOException;

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
			
					
			
			//1.title
									 
			
			
//			String startday = multiRequest.getParameter("startday"); date라 오류가 남
			
//			String requestday = multiRequest.getParameter("requestday");
			
			//2
			
			String[] updateDay = multiRequest.getParameterValues("updateday");
			//배열로 담아온것을 조인해여 변환(장르와조인)
			String updateDay1 = String.join(",",updateDay);

			
			
			String [] stgenre = multiRequest.getParameterValues("genre"); 				
			
		    int[] genre = new int[stgenre.length];
		      
		    	for(int i=0;i<stgenre.length;i++) {
		         
		    		genre[i]= Integer.parseInt(stgenre[i]);
		    	}
			
			//3
			String plot = multiRequest.getParameter("plot");
			
			//4
			String summary = multiRequest.getParameter("summary");
			//5
			String file1= multiRequest.getFilesystemName("file1"); 
			
			String title = multiRequest.getParameter("title");	
			
			
			
																							 


			Work w = new Work();
			
//			w.setStartDay(startday); //데이트 타입이라 오류가 난다라
//			w.setRequestDate(requestday);
			w.setWorkUpdateDay(updateDay1);
			w.setWorkGenre(genre);
			w.setWorkPlot(plot);
			w.setWorkSummary(summary);
			w.setThumbnailModify(file1);
			w.setWorktitle(title);
			
			
			int result = new WorkService().insertWork(w);
			
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
