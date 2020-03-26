package com.kh.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.work.model.service.WorkService;

/**
 * Servlet implementation class adminWorkApprovConfirmServlet
 */
@WebServlet("/approvConfirm.wo")
public class adminWorkApprovConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWorkApprovConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String no = request.getParameter("no");
		
		// 승인 처리
		int result = new WorkService().approvConfirm(no);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("approvMsg", "승인 되었습니다.");
			response.sendRedirect("workApprov.wo?pageId=5");
		} else {
			request.setAttribute("msg", "작품 등록 승인 실패");
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
