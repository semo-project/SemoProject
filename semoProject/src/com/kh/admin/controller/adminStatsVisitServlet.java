package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.StatsService;
import com.kh.admin.model.vo.MemberStats;
import com.kh.admin.model.vo.VisitStats;

/**
 * Servlet implementation class adminStatsVisitServlet
 */
@WebServlet("/visit.st")
public class adminStatsVisitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStatsVisitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 통ㄱㅖ를 어떻게 해줘보고
		// 통계를 내야 하는데 월은 어케 한다 치고...
		
		// 이전의 12개의 월을 조회하고 싶다면....?
		
		ArrayList<VisitStats> list = new StatsService().getVisitStats();
		
		// 만약에 제대로 받아왔으면 넘겨주고
		if(list.size() != 0) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/stats/adminStatsVisit.jsp").forward(request, response);
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
