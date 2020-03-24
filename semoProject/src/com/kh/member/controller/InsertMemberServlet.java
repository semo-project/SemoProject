package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("memberId");			
		String userPwd = request.getParameter("memberPwd");			
		String userName = request.getParameter("memberName");		
		String userNickname = request.getParameter("memberNickname");		
		String userAddress = request.getParameter("memberAddress");		
		String userPhone = request.getParameter("phone");				
		int userAge = Integer.parseInt(request.getParameter("age"));					
		String gender = request.getParameter("gender");				
		String email = request.getParameter("email");
		
		Member mem = new Member(userId, userPwd, userName, userNickname, userAddress, userPhone, userAge, gender, email);
		
		int result = new MemberService().insertMember(mem);
		
		if(result > 0) {
			request.getRequestDispatcher("views/member/memberComplete.jsp").forward(request, response);
		}else {
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입에 실패했습니다.'); location href='memberEnrollForm.jsp';</script>");
			
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
