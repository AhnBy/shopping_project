package com.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.entity.Member;

@Mapper
public interface MemberMapper {

	int duplicatedId(String id);

	int duplicatedEmail(String email);
	
	public int insert(Member member);
	
	public Member readById(String userid);
	
	public int update(Member member);
	
	public int delete(Member member);
	
	public Member login(Member member);
	
	public Member findId(Member member);
	
	public Member findPw(Member member);
	
	public int updatePw(Member member);
	
	public List<Member> selectAll();
}
