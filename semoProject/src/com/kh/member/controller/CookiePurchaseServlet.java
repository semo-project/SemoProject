package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cookie.model.service.CookieService;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CookiePurchaseServlet
 */
@WebServlet("/addCookieLog.me")
public class CookiePurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookiePurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int amt = Integer.parseInt(request.getParameter("amt"));
		String payMethod = request.getParameter("payMethod");
		int payName = Integer.parseInt(request.getParameter("payName"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new CookieService().updateLog(amt, payMethod, payName, loginUser);
		
		if(result > 0) {
			Member mem = new MemberService().loginMember(loginUser.getMemberId(), loginUser.getMemberPwd());
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			request.setAttribute("loginUser", mem);
			session.setAttribute("loginUser", mem);
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
