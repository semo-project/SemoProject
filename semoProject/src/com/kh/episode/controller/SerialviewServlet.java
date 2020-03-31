package com.kh.episode.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.kh.episode.model.vo.Episode;
import com.kh.work.model.service.*;
import com.kh.work.model.vo.*;

/**
 * Servlet implementation class SerialviewServlet
 */
@WebServlet("/view.se")
public class SerialviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerialviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int wno = Integer.parseInt(request.getParameter("wno"));
		
		Work w = new WorkService().selectSerial(wno);
		
		ArrayList<Episode> list = new WorkService().episodeList(wno);
		
		if(w != null) {
			request.setAttribute("w", w);
			request.setAttribute("list", list);
			System.out.println(list);
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
