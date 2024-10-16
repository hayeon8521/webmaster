package com.yedam.dao;

import java.util.List;

import com.yedam.vo.Member;

//인터페이스 기능정의
//구현클래스 기능실행
public interface MemberMapper {
	public List<Member> members();
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String memberid);
	public Member selectMember(String member_id);	//단건조회 기능추가
}
