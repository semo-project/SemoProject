package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.board.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Payment;

/**
 * Servlet implementation class MyPageUsedLogServlet
 */
@WebServlet("/usedLog.me")
public class MyPageUsedLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUsedLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		// ------------------ 페이징 처리 ------------------
		int listCount; // 총 게시글 갯수
		int currentPage; // 현재 페이지 (즉, 요청한 페이지)
		int startPage; // 현재 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage; // 현재 페이지 하단에 보여지는 페이징 바의 끝 수
		int maxPage; // 전체 페이지에서의 가장 마지막 페이지

		int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit; // 한 페이지에 보여질 게시글 최대 갯수

		listCount = new PaymentService().countList(loginUser.getMemberNo());
		// * currentPage : 현재 페이지 (요청한 페이지)
		currentPage = 1;

		// 페이지 전환시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage로!!
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수
		pageLimit = 10;

		// * boardLimit : 한 페이지에 보여질 게시글 최대 갯수
		boardLimit = 10;

		// * maxPage : 총 페이지 수
		/*
		 * ex) boardLimit : 10 100.0 / 10 = 10.0 => 10페이지 101.0 / 10 = 10.1 => 11페이지
		 * 105.0 / 10 = 10.5 => 11페이지 109.0 / 10 = 10.9 => 11페이지
		 * 
		 * listCount(실수) / boardLimit 올림한 값!
		 */
		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		// * startPage : 현재 페이지에 보여지는 페이징바의 시작 수
		/*
		 * ex) pageLimit : 10 startPage : 1, 11, 21, 31, ... --> n * 10 + 1
		 * 
		 * currentPage = 1 --> 0 * 10 + 1 currentPage = 5 --> 0 * 10 + 1 currentPage =
		 * 10 --> 0 * 10 + 1
		 * 
		 * currentPage = 11 --> 1 * 10 + 1 currentPage = 15 --> 1 * 10 + 1 currentPage =
		 * 20 --> 1 * 10 + 1
		 * 
		 * currentPage = 1 ~ 10 --> n = 0 currentPage = 11 ~ 20 --> n = 1 0~9 10~19 -->
		 * 0 또는 1 n = (currentPage - 1) / pageLimit
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		// ex) pageLimit : 10
		// startPage : 1 --> endPage : 10
		// startPage : 11 --> endPage : 20
		endPage = startPage + pageLimit - 1;

		// 단, maxPage가 고작 13까지 밖에 안된다면? --> endPage를 13으로 해야됨!
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 구해진 페이지 정보들 PageInfo 객체 담기
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);

		// System.out.println(pi);

		// 현재 페이지에 보여질 게시글 리스트 조회하기
		ArrayList<Payment> list = new PaymentService().selectList(pi, loginUser.getMemberNo());
		Member mem = new MemberService().selectMember(loginUser.getMemberId());
		if (mem.getApprovalFlag() == null) {
			mem.setApprovalFlag("null");
		}
		response.setCharacterEncoding("UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      gson.toJson(list, response.getWriter());
		request.setAttribute("mem", mem);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		RequestDispatcher view = request.getRequestDispatcher("views/member/myPageUsedLog.jsp");
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
