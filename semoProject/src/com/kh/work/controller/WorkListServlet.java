package com.kh.work.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.work.model.service.WorkService;
import com.kh.work.model.vo.Work;

/**
 * Servlet implementation class WriterWorkListServlet
 */
@WebServlet("/list.wr")  
public class WorkListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkListServlet() {
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
		request.setAttribute("mem", mem);
		
		ArrayList<Work> list = new WorkService().selectWorkList();
		
		request.setAttribute("list", list);
		
	
		request.getRequestDispatcher("views/writer/writerWorkList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
