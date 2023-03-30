package com.edu.zino.model.admin;

import com.edu.zino.domain.Admin;

public interface AdminDAO {
		public void insert(Admin admin);
		public Admin select(Admin admin);
}
