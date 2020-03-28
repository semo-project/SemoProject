package com.kh.episode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.episode.model.service.EpisodeService;

/**
 * Servlet implementation class adminEpisodeApprovConfirm
 */
@WebServlet("/approvConfirm.ep")
public class adminEpisodeApprovConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminEpisodeApprovConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 에피소드 대기 승인
		String no = request.getParameter("no");
		
		int result = new EpisodeService().epApprovConfirm(no);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("approvMsg", "승인 되었습니다.");
			response.sendRedirect("episodeApprov.ep?pageId=5");
		} else {
			request.setAttribute("msg", "조회 실패");
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
