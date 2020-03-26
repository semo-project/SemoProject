package com.kh.work.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.kh.common.*;
import com.kh.work.model.service.*;
import com.kh.work.model.vo.*;

/**
 * Servlet implementation class WeekSerialListServlet
 */
@WebServlet("/list.week")
public class WeekSerialListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeekSerialListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				ArrayList<Work> list = new WorkService().selectList();
				
				request.setAttribute("list", list);
		
				RequestDispatcher view =request.getRequestDispatcher("views/work/weekSerial.jsp");
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
