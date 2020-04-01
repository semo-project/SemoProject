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
 * 관리자 화면에서 관리자 화면을 불러오는 서블릿
 * Servlet implementation class mainServlet
 */
@WebServlet("/main.ad")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 연령별 성별 통계
		
		// 연령별 성별 통계가 담긴 리스트를 가져온다
		ArrayList<MemberStats> listMember = new StatsService().getMemberStats();
		
		// 연간 방문수 집계 리스트를 가져온다
		ArrayList<VisitStats> listVisit = new StatsService().getVisitStats();
		
		// 만약에 제대로 받아왔으면 넘겨주고
		if(listMember.size() != 0 && listVisit.size() != 0) {
			request.setAttribute("listMember", listMember);
			request.setAttribute("listVisit", listVisit);
			request.getRequestDispatcher("views/admin/common/adminIndex.jsp").forward(request, response);
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
