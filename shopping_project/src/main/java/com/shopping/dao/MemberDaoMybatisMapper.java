package com.shopping.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.entity.Member;
import com.shopping.mapper.MemberMapper;

@Repository
public class MemberDaoMybatisMapper implements MemberDao {

	public final MemberMapper memberMapper;
	
	@Autowired
	public MemberDaoMybatisMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	@Override
	public int duplicatedId(String id) {
		return memberMapper.duplicatedId(id);
	}
	
	@Override
	public int duplicatedEmail(String email) {
		return memberMapper.duplicatedEmail(email);
	}
	
	@Override
	public int insert(Member member) {
		return memberMapper.insert(member);
	}

	@Override
	public Member readById(String userid) {
		return memberMapper.readById(userid);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(member);
	}

	@Override
	public int delete(Member member) {
		return memberMapper.delete(member);
	}

	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public Member findId(Member member) {
		return memberMapper.findId(member);
	}

	@Override
	public Member findPw(Member member) {
		return memberMapper.findPw(member);
	}

	@Override
	public int updatePw(Member member) {
		return memberMapper.updatePw(member);
	}

	@Override
	public List<Member> selectAll() {
		return memberMapper.selectAll();
	}
	
	


}
