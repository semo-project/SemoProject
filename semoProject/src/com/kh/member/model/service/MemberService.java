package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.io.PrintWriter;
import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	/**
	 * 1. 회원 로그인 서비스
	 * @param userId	전달받은 회원 아이디
	 * @param userPwd	전달받은 회원 비밀번호
	 * @return			로그인 시도한 회원 객체
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	/**
	 * 2. 회원정보를 가져오는 서비스
	 * @param userId	조회용 회원 아이디
	 * @return			조회된 회원 객체
	 */
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		Member mem = new MemberDao().selectMember(conn, userId);
		close(conn);
		return mem;
	}
	
	/**
	 * 3. 회원정보를 수정하는 서비스
	 * @param mem		수정하고자하는 정보가 담긴 Member객체
	 * @return			수정된 Member객체
	 */
	public Member updateMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, mem);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, mem.getMemberId());
		} else {
			rollback(conn);
		}
		
		return updateMem;
		
	}
	
	public Member updatePwd(Member mem, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, mem.getMemberId(), newPwd);
		if(result > 0) {
			commit(conn);
			mem = selectMember(mem.getMemberId());
			if(mem.getApprovalFlag() == null) {
				mem.setApprovalFlag("null");
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return mem;
		
	}
	

}
