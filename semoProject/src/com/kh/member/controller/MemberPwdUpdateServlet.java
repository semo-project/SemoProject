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

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdateServlet
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String newPwd = request.getParameter("newPwd");
		Member mem = new MemberService().updatePwd(loginUser, newPwd);
		response.setContentType("text/html; charset=UTF-8");
		if(mem.getApprovalFlag() == null) { // 돌아온 객체의 작가승인여부 컬럼이 null일 경우 (session에서 뽑아온값은 다 null임 --> 실패)
			mem = new MemberService().selectMember(loginUser.getMemberId());
			request.setAttribute("mem", mem);
			String message = "비밀번호 변경에 실패했습니다!!";
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("history.back(-1);");
			out.println("</script>");
		} else {
			request.setAttribute("loginUser", mem);
			RequestDispatcher view = request.getRequestDispatcher("views/member/myPageMain.jsp");
			view.forward(request, response);
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
