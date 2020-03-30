package com.kh.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.work.model.service.WorkService;
import com.kh.work.model.vo.Work;

/**
 * Servlet implementation class StarGradeServlet
 */
@WebServlet("/star.gr")
public class StarGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StarGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String star = request.getParameter("star").substring(4); //"4"
		
		int wno	   = Integer.parseInt(request.getParameter("wno"));
		int mno	   = Integer.parseInt(request.getParameter("mno"));
		
		
		Work w = new Work();
		w.setWriterNo(mno);
		w.setWorkNo(wno);
		w.setStarGrade(star);
		System.out.println(w);
		
		int result = new WorkService().starinsert(w);
		
		if(result > 0) {
			response.sendRedirect("view.se?wno="+wno);
		}else {
			request.setAttribute("msg", "일반 게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
