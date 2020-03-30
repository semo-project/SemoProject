package com.kh.episode.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.episode.model.service.EpisodeService;
import com.kh.episode.model.vo.Episode;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class WriterEpisodeListServlet
 */
@WebServlet("/list.ep")
public class EpisodeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EpisodeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member mem = new MemberService().selectMember(loginUser.getMemberId());
		if(mem.getApprovalFlag() == null) {
			mem.setApprovalFlag("null");
		}
		mem.getMemberNo();
		request.setAttribute("mem", mem);

		
		int wNo = Integer.parseInt(request.getParameter("wNo"));
		//System.out.println(wNo);
		
		//test
		Episode e = new EpisodeService().test(wNo);
		
		request.setAttribute("e", e);

		RequestDispatcher view =request.getRequestDispatcher("views/episode/episodeList.jsp");
				view.forward(request, response);
	}
		
		
//		ArrayList<Episode> list = new EpisodeService().selectEpisodeList(wNo); //에피소드 리스트
//		
//		if( e != null) {
//			request.setAttribute("e" , e);
//			request.setAttribute("list", list);
//			RequestDispatcher view =request.getRequestDispatcher("views/episode/episodeList.jsp");
//			view.forward(request, response);
//			
//		} else {
//			//에러페이지
//		}
	
	

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
