package com.kh.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.writer.model.service.WriterService;
import com.kh.writer.model.vo.Writer;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPageAuthorServlet
 */
@WebServlet("/author.me")
public class MyPageAuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAuthorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "/author_request/";
			// String savePath = resources + "\\author_request\\";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			String content = multiRequest.getParameter("introduce");
			int writer = Integer.parseInt(multiRequest.getParameter("writer"));
			String bNum = multiRequest.getParameter("bNum");
			String bank = multiRequest.getParameter("bank");
			String originName = multiRequest.getOriginalFileName("file");
			String changeName = multiRequest.getFilesystemName("file");
			Writer w = new Writer(writer, bNum, "N", content, bank, originName, changeName);
			int result = new WriterService().authorRequest(w);
			if(result > 0) {
				HttpSession session = request.getSession();
				Member mem = (Member)session.getAttribute("loginUser");
				String userId = mem.getMemberId();
				String userPwd = mem.getMemberPwd();
				Member loginUser = new MemberService().loginMember(userId, userPwd);
				request.setAttribute("loginUser", loginUser);
				String location = request.getContextPath();
				String message = "작가신청 완료!!";
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('" + message + "');");
				out.println("location.href='" + location + "/myPage.me';");
				out.println("</script>");
			} else {
				File deleteFile = new File(savePath + changeName);
				deleteFile.delete();
				
				String message = "작가신청 실패!!";
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('" + message + "');");
				out.println("history.back(-1);");
				out.println("</script>");
				
			}
			
			
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
