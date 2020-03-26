package com.kh.work.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.work.model.service.*;
import com.kh.work.model.vo.*;

/**
 * Servlet implementation class GenreSerialButtonServlet
 */
@WebServlet("/genre.fan")
public class GenreSerialButtonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenreSerialButtonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int genre = Integer.parseInt(request.getParameter("genre"));
		
		ArrayList<Work> list = new WorkService().genreList(genre);
		
		//System.out.println(genre);
		request.setAttribute("list", list);

		RequestDispatcher view =request.getRequestDispatcher("views/work/genreSerial.jsp");
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
