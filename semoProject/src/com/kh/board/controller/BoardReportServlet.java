package com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class BoardReportServlet
 */
@WebServlet("/boardReport.bo")
public class BoardReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int reporterNo = Integer.parseInt(request.getParameter("reporterNo"));
		String boardWriter = request.getParameter("boardWriter");
		
		String reportRadio = request.getParameter("reportRadio");
		String reportContent = request.getParameter("reportContent");
		
		/*advertise.concat(",").concat(salacity).concat(",").concat(defamation).concat(",").concat(etc);*/
		
		int result = new BoardService().boardReport(reportRadio, reportContent, boardNo, reporterNo, boardWriter);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
