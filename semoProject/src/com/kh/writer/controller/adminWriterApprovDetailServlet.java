package com.kh.writer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.writer.model.service.WriterService;
import com.kh.writer.model.vo.Writer;

/**
 * Servlet implementation class adminWriterApprovDetailServlet
 */
@WebServlet("/approvDetail.wr")
public class adminWriterApprovDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWriterApprovDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 작가 번호를 가져가서 승인되지 않은 친구들인지 where절 걸고 정보들을 가져오자
		Writer w = new WriterService().getApprovWriter(no);
		
		if(w != null) {
			request.setAttribute("w", w);
			request.getRequestDispatcher("views/admin/writer/adminWriterApprovDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "작가 신청 정보 불러오기 실패");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);
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
