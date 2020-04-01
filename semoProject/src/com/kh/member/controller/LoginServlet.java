package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		//------------------------------------------------------------ lsh
		// 아이디를 잘못 입력한 게 아니고 로그인이 맞게 된 상태에서 
		// 해당 아이디가 활중된 회원의 아이디라면 로그인 진행하지 않게 하기
		Member checkMem = new MemberService().checkAccusMember(userId);
		
		// 만약 입력한 아이디가 현재 활동중지라면 (dao에서 해당 아이디에 해당하는 정보에 활동중지 y가 되어있는 객체가 반환된다면)
		if(checkMem != null) {
			HttpSession session = request.getSession();
			session.setAttribute("accusMsg", "해당 아이디는 활동중지 되어 로그인이 불가합니다.");
			response.sendRedirect(request.getContextPath());
			return;
		} 
		
		//------------------------------------------------------------
			
		if(loginUser != null) {
			if(loginUser.getApprovalFlag() == null) {
				loginUser.setApprovalFlag("null");
			}
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
		} else {
			String message = "로그인 실패!!";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("history.back(-1);");
			out.println("</script>");
			
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
