package com.kh.episode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.episode.model.service.episodeService;
/**
 * Servlet implementation class adminEpisodeSecretServlet
 */
@WebServlet("/adScrt.ep")
public class adminEpisodeSecretServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminEpisodeSecretServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 숨김처리 진행
		// 에피소드는 숨김처리와 숨김해제를 전부 같은 서블릿 내에서 진행해보겠습니다?
		
		// 숨김 처리/해제 구분해주는 변수
		// 숨김 처리 1 / 숨김 해제 2
		int div = Integer.parseInt(request.getParameter("div"));
		
		String no = request.getParameter("no");
		int workNo = Integer.parseInt(request.getParameter("workNo"));
		
		// 혹시 이미 숨김처리 된 건, 또는 숨김해제 된 건이 있다면
		int secretFlag = new episodeService().secretEpisodeConfirm(no, div);
		
		HttpSession session = request.getSession();
		
		// 이미 숨김처리(해제) 된 건이 존재한다는 뜻
		if(secretFlag > 0) {			
			if(div == 1) {
				session.setAttribute("scrMsg", "선택된 건 중 이미 숨김처리 된 건이 있습니다.");
			} else if(div == 2) {
				session.setAttribute("scrMsg", "조회 불가(숨김 처리)한 건만 선택해주세요.");				
			}
			response.sendRedirect("episodeList.wo?pageId=4&&no=" + workNo);
			
			return;
		}
		
		int result = new episodeService().secretEpisode(no, div);
		
		if(result > 0) {
			if(div == 1) {
				session.setAttribute("scrMsg", "숨김 처리 되었습니다.");
			} else if(div == 2) {
				session.setAttribute("scrMsg", "숨김 해제 되었습니다.");				
			}
			response.sendRedirect("episodeList.wo?pageId=4&&no=" + workNo);
		} else {
			request.setAttribute("msg", "작품 숨김처리 실패");
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
