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

/**
 * Servlet implementation class adminStatsMemberServlet
 */
@WebServlet("/member.st")
public class adminStatsMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStatsMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 연령별 성별 통계
		
		// 연령별 성별 통계가 담긴 리스트를 가져온다
		ArrayList<MemberStats> list = new StatsService().getMemberStats();
		
		// 만약에 제대로 받아왔으면 넘겨주고
		if(list.size() != 0) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/stats/adminStatsMember.jsp").forward(request, response);
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
