package com.edu.zino.model.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Admin;
import com.edu.zino.exception.AdminException;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public void insert(Admin admin) throws AdminException{
		adminDAO.insert(admin);	
	}

	@Override
	public Admin select(Admin admin) throws AdminException{
		return adminDAO.select(admin);
	}


}
