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
 * Servlet implementation class adminWorkApprovDetailServlet
 */
@WebServlet("/approvDetail.wo")
public class adminWorkApprovDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWorkApprovDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 어케 신청했는지 작품 테이블로 화긘
		int no = Integer.parseInt(request.getParameter("no"));
		
		Work w = new WorkService().getApprovWork(no);
		
		if(w != null) {
			request.setAttribute("work", w);
			request.getRequestDispatcher("views/admin/work/adminWorkApprovDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "작품 디테일 조회 실패");
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
