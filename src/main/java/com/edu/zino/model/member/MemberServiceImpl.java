package com.edu.zino.model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Member;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return memberDAO.selectAll();
	}

	@Override
	public Member select(int member_idx) {
		// TODO Auto-generated method stub
		return memberDAO.select(member_idx);
	}

	@Override
	public Member selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void regist(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Member member) {
		// TODO Auto-generated method stub
		
	}

	
	
}