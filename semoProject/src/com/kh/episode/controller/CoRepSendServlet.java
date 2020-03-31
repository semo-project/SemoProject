package com.kh.episode.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.episode.model.service.EpisodeService;

/**
 * Servlet implementation class CoRepSendServlet
 */
@WebServlet("/comRepSend.ep")
public class CoRepSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoRepSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int comRepNo = Integer.parseInt(request.getParameter("comReportNo"));
			String comRepRadio = request.getParameter("comRepRadio");
			String comRepContent = request.getParameter("comRepContent");
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			
			int result = new EpisodeService().coRepSend(comRepNo, comRepRadio, comRepContent, memberNo);
			
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
