package com.edu.zino.chat.model;

import java.util.List;

import com.edu.zino.domain.Chat;
import com.edu.zino.domain.Message;

public interface MessageDAO {
	public List<Message> selectChat(int chat_idx);
	public void insert(Message message);
}
