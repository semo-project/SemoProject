package com.kh.episode.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.episode.model.vo.Episode;
import com.kh.work.model.service.WorkService;
import com.kh.work.model.vo.Work;

/**
 * Servlet implementation class EpisodeArrayServlet
 */
@WebServlet("/episo.de")
public class EpisodeDescServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EpisodeDescServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wno = Integer.parseInt(request.getParameter("wno"));
		
		System.out.println(wno);
		Work w = new WorkService().selectSerial(wno);
		
		ArrayList<Episode> list = new WorkService().episodeDesc(wno);
		
		if(w != null) {
			request.setAttribute("w", w);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/episode/episodeview.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "웹툰 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
