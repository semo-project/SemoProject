package com.kh.qna.controller;

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
import com.kh.qna.model.service.QNAService;
import com.kh.qna.model.vo.QNA;

/**
 * Servlet implementation class QnaServlet
 */
@WebServlet("/qnaList.qna") //qns list
public class QnainsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnainsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		
		
		
		
		String qnaTitle = request.getParameter("title");			
		
		String qnaContent = request.getParameter("content");

		int qnaContentNo = Integer.parseInt(request.getParameter("qnaselect"));	

		int userno = Integer.parseInt(request.getParameter("membernumber"));

			
		QNA q = new QNA(qnaTitle, qnaContent, qnaContentNo, userno);
		
		int result = new QNAService().insertQna(q);
		
		if(result > 0) {
			request.getRequestDispatcher("views/notice/qna.jsp").forward(request, response); 
			
			
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('문의작성 실패 '); location href='list.qn';</script>");
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
