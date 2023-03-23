package com.edu.zino.model.member;

import com.edu.zino.domain.SnsName;

public interface SnsService {
	public String selectAll(SnsName snsName);
	public SnsName selectByMember(int snsName);
	public SnsName selectByType(String sns_type);

}
