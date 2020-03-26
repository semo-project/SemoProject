package com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Comment;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CommentInServlet
 */
@WebServlet("/commentInsert.bo")
public class CommentInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		Comment c = new Comment();
		c.setCommentContent(content);
		c.setComBoardNo(boardNo);
		c.setCommentWriter(String.valueOf(writer));
		
		int result = new BoardService().commentInsert(c);
		
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
