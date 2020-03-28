package com.kh.episode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.episode.model.service.EpisodeService;
import com.kh.episode.model.vo.Episode;

/**
 * Servlet implementation class adminEpisodeApprovDetailServlet
 */
@WebServlet("/episodeApprovDetail.ep")
public class adminEpisodeApprovDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminEpisodeApprovDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 에피소드 번호
		int no = Integer.parseInt(request.getParameter("no"));
		
		Episode ep = new EpisodeService().getEpisodeApprov(no);
		
		if(ep != null) {
			request.setAttribute("episode", ep);
			request.getRequestDispatcher("views/admin/work/adminWorkEpisodeApprovDetail.jsp").forward(request, response);			
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
