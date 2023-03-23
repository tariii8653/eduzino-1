package com.edu.zino.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.SnsName;

@Repository
public class MybatisSnsNameDAO implements SnsNameDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public String selectAll(SnsName snsName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SnsName selectByMember(int snsName_idx) {
		return sqlSessionTemplate.selectOne("SnsName.selectByMember",snsName_idx);
	}

	@Override
	public SnsName selectByType(String sns_type) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SnsName.selectByType", sns_type);
	}

}
