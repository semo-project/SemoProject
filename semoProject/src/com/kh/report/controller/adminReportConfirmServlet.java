package com.kh.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.report.model.service.ReportService;

/**
 * Servlet implementation class adminReportConfirmServlet
 */
@WebServlet("/confirm.re")
public class adminReportConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminReportConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String no = request.getParameter("no");
		int report = Integer.parseInt(request.getParameter("report"));
		
		int result = new ReportService().confirmReport(no);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("confirmMessage", "신고 확인 되었습니다.");
			
			if(report == 1) {
				response.sendRedirect("list.re?pageId=6");				
			} else {
				response.sendRedirect("comment.re?pageId=6");								
			}
		} else {
			request.setAttribute("msg", "확인 실패");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);			
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
