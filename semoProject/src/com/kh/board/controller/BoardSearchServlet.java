package com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Comment;
import com.kh.board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/searchBoardT.bo")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchOption1 = request.getParameter("searchOption1");
		String searchContent = request.getParameter("searchContent");
		
		response.setContentType("text/html; charset=utf-8");
		
		if(searchOption1.equals("boardTitle")) {
			ArrayList<Board> list = new BoardService().freeSearch(searchContent);
			request.setAttribute("list", list);			
		}
		if(searchOption1.equals("boardWriter")) {
			ArrayList<Board> list = new BoardService().freeWSearch(searchContent);
			request.setAttribute("list", list);
		}
		if(searchOption1.equals("boardContent")) {
			ArrayList<Board> list = new BoardService().freeCSearch(searchContent);
			request.setAttribute("list", list);
		}
		
		request.getRequestDispatcher("views/board/freeSearchList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
