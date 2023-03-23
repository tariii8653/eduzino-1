package com.edu.zino.model.member;

import com.edu.zino.domain.SnsName;

public interface SnsNameDAO {
	public String selectAll(SnsName snsName);
	public SnsName selectByMember(int snsName_idx);
	public SnsName selectByType(String sns_type);
}
