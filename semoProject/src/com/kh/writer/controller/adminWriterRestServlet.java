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
 * Servlet implementation class adminWriterRestServlet
 */
@WebServlet("/rest.wr")
public class adminWriterRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWriterRestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String no = request.getParameter("restNo");
		
		int result = new WriterService().restWriter(no);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("restMessage", "해제 되었습니다.");
			response.sendRedirect("adminList.wr?pageId=2");
		} else {
			request.setAttribute("msg", "해제 실패");
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
