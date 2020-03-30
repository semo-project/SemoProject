package com.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Comment;

/**
 * Servlet implementation class ComReportServlet
 */
@WebServlet("/comReport.bo")
public class ComReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int comReportNo = Integer.parseInt(request.getParameter("comReportNo"));
		String commentWriter = request.getParameter("commentWriter");
		String commentContent = request.getParameter("commentContent");
		
		Comment c = new BoardService().comReportInfo(comReportNo, commentWriter, commentContent);
		
		JSONObject jsonObj = new JSONObject();
		
		if(c != null) { // 조회된 경우
			jsonObj.put("commentWriter", c.getCommentWriter()); 
	        jsonObj.put("commentContent", c.getCommentContent());
	      }else {
	         jsonObj = null;
	      }
	      
	      response.setContentType("applocation/json; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      // out.print(/* m.toString() */);
	      out.print(jsonObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
