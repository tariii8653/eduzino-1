package com.edu.zino.model.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.SnsName;

@Service
public class SnsServiceImpl implements SnsService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SnsNameDAO snsNameDAO;

	
	@Override
	public String selectAll(SnsName snsName) {
		return snsNameDAO.selectAll(snsName);
	}

	@Override
	public SnsName selectByMember(int snsName) {
		// TODO Auto-generated method stub
		return snsNameDAO.selectByMember(snsName);
	}

	@Override
	public SnsName selectByType(String sns_type) {
		SnsName sns = snsNameDAO.selectByType(sns_type);
		return sns;
	}

}
