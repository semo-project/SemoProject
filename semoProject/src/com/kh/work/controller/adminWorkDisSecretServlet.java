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
 * Servlet implementation class adminWorkDisSecretServlet
 */
@WebServlet("/disScrt.wo")
public class adminWorkDisSecretServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWorkDisSecretServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 숨김처리 진행
		String no = request.getParameter("no");
		int writerNo = Integer.parseInt(request.getParameter("writerNo"));
		
		// 숨김해제 진행 시 이미 숨김처리 되지 않았던 건이 존재하는지 확인하기
		int secretFlag = new WorkService().secretWorkConfirm(no, 2);
		
		HttpSession session = request.getSession();
		// 숨김처리 되지 않은 건이 존재한다는 뜻
		if(secretFlag > 0) {			
			session.setAttribute("scrMsg", "조회 불가(숨김 처리)한 건만 선택해주세요.");
			response.sendRedirect("writerList.wo?pageId=4&&no=" + writerNo);
			return;
		}
		
		// 모두 숨김처리 되어있는 건이라면 숨김해제 진행하기
		int result = new WorkService().secretWork(no, 2);
		
		if(result > 0) {
			session.setAttribute("scrMsg", "숨김 해제 되었습니다.");
			response.sendRedirect("writerList.wo?pageId=4&&no=" + writerNo);
		} else {
			request.setAttribute("msg", "작품 숨김 해제 실패");
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
