package com.kh.episode.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.kh.work.model.vo.*;
import com.kh.episode.model.service.*;
import com.kh.episode.model.vo.Episode;

/**
 * Servlet implementation class EpisodeDetailServlet
 */
@WebServlet("/episode.de")
public class EpisodeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EpisodeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		System.out.println(eNo);
		Episode e = new EpisodeService().episodeDetail(eNo);
		
		
		request.setAttribute("e", e);

		RequestDispatcher view =request.getRequestDispatcher("views/episode/episodeDetail.jsp");
				view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
