package com.shopping.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.MemberDao;
import com.shopping.entity.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Member member) {
		member.setRegDate(LocalDateTime.now());
		return memberDao.insert(member);
	}
	
	public int duplicatedEmail(String email) {
		return memberDao.duplicatedEmail(email);
	}
	
	public int duplicatedId(String id) {
		return memberDao.duplicatedId(id);
	}
	
	public Member readById(String userid) {
		return memberDao.readById(userid);
	}
	
	public int modify(Member member) {
		return memberDao.update(member);
	}
	
	public int remove(Member member) {
		return memberDao.delete(member);
	}
	
	public Member login(Member member) {
		return memberDao.login(member);
	}
	
	public Member findId(Member member) {
		return memberDao.findId(member);
	}

	public Member findPw(Member member) {
		return memberDao.findPw(member);
	}

	public int updatePw(Member member) {
		return memberDao.updatePw(member);
	}
	
	public List<Member> selectAll(){
		return memberDao.selectAll();
	}
}
