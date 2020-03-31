package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {
	
	/** KJY
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
	
	/** KJY
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
	
	/** KJY
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
			updateMem = new MemberDao().loginMember(conn, mem.getMemberId(), mem.getMemberPwd());
		} else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
		
	}
	
	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Member updatePwd(Member mem, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, mem.getMemberId(), newPwd);
		if(result > 0) {
			commit(conn);
			mem = loginMember(mem.getMemberId(), newPwd);
			if(mem.getApprovalFlag() == null) {
				mem.setApprovalFlag("null");
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return mem;
		
	}
	
	public int insertMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Member idFind(String userName, String email) {
		Connection conn = getConnection();
		Member m = new MemberDao().idFind(conn, userName, email);
		close(conn);
		
		return m;
	}
	
	public Member idCheck(String userId, String email) {
		Connection conn = getConnection();
		Member m = new MemberDao().idCheck(conn, userId, email);
		close(conn);
		
		return m;
	}
	
	
	 public int changePwd(String memberId, String newPwd){
		Connection conn = getConnection();
		
		int result = new MemberDao().changePwd(conn, memberId, newPwd);
		
		if(result == 1) { 
			 commit(conn);  
		}else { 
			 rollback(conn); 
		}
		 
		close(conn);
		 
		return result; 
	 }
	 
	 public int enIdCheck(String memberId) {
		 Connection conn = getConnection();
		 
		 int result = new MemberDao().enIdCheck(conn, memberId);
		 
		 close(conn);
		 
		 return result;
	 }
	
	 public int nickNameChk(String nickName) {
		 Connection conn = getConnection();
		 
		 int result = new MemberDao().nickNameChk(conn, nickName);
		 
		 close(conn);
		 
		 return result;
	 }
	 
	
	/** LSH
	 * Admin - 전체 회원 보기 페이징 처리
	 * @return
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/** LSH
	 * Admin - 페이지 정보에 맞춰서 회원 정보 가져오기
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/** LSH
	 * Admin - 페이지 정보에 맞춰 검색된 회원 정보 가져오기
	 * @param pi
	 * @param name
	 * @return
	 */
	public ArrayList<Member> searchMember(PageInfo pi, String name) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().searchMember(conn, pi, name);
		
		close(conn);
		
		return list;
	}
	 
	/** LSH
	 * Admin - 검색된 회원 수 반환
	 * @param name
	 * @return
	 */
	public int getSearchListCount(String name) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getSearchListCount(conn, name);
		
		close(conn);
		
		return listCount;
	}
	
	/** LSH
	 * Admin - 블랙리스트 전체 수
	 * @return
	 */
	public int getBlackListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getBlackListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/** LSH
	 * Admin - 페이지 정보에 맞춰진 블랙리스트 정보 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectBlackList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectBlackList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/** LSH
	 * Admin - 검색어에 해당하는 블랙리스트 전체 수 리턴
	 * @param search
	 * @return
	 */
	public int getBlackSearchCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getBlackSearchCount(conn, search);
		
		close(conn);
		
		return listCount;
	}
	
	/** LSH
	 * Admin - 검색어에 해당하는 블랙리스트 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Member> selectBlackSearch(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectBlackSearch(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
	/** LSH
	 * Admin - 멤버 활동중지 
	 * @param no
	 * @return
	 */
	public int accusMember(String no) {
		Connection conn = getConnection();
		
		int result = new MemberDao().accusMember(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/** LSH
	 * Admin - 활동중지 된 멤버 전체 수
	 * @return
	 */
	public int getAccusListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getAccusListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/** LSH
	 * Admin - 페이지 정보에 맞춘 활동중지 멤버 리스트 리턴
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectAccusList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAccusList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/** LSH
	 * Admin - 검색어에 해당하는 활동중지 리스트 전체 수 리턴
	 * @param search
	 * @return
	 */
	public int getAccusSearchCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getAccusSearchCount(conn, search);
		
		close(conn);
		
		return listCount;
	}

	/** LSH
	 * Admin - 검색어에 해당하는 활동중지 리스트 리턴
	 * @param pi
	 * @param search
	 * @return
	 */
	public ArrayList<Member> selectAccusSearch(PageInfo pi, String search) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAccusSearch(conn, pi, search);
		
		close(conn);
		
		return list;
	}
	
	/** LSH
	 * Admin - 활동중지 해제
	 * @param no
	 * @return
	 */
	public int disAccusMember(String no) {
		Connection conn = getConnection();
		
		int result = new MemberDao().disAccusMember(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
