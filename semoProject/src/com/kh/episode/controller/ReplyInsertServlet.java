package com.kh.episode.controller;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.episode.model.service.*;
import com.kh.episode.model.vo.*;
import com.kh.member.model.vo.*;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/rinsert.bo")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		Reply r = new Reply();
		r.setContent(content);
		r.setEpisodeNo(eNo);
		r.setMemberId(String.valueOf(writer)); 
		
		int result = new EpisodeService().insertReply(r);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
