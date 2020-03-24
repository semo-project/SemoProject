// 관리자 - 멤버 - 작가 승인 대기 - 승인
package com.kh.writer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.writer.model.service.WriterService;

/**
 * Servlet implementation class adminWriterApprov
 */
@WebServlet("/approvAction.wr")
public class adminWriterApprov extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWriterApprov() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 체크된 신청 건의 작가번호를 가져온다
		String[] noArray = request.getParameterValues("writerAprv");
		
		int result = new WriterService().approveWriter(noArray);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("approvMessage", "승인 되었습니다.");
			
			response.sendRedirect("writerApprv.wr?pageId=1");
		} else {
			request.setAttribute("msg", "승인 실패");
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
