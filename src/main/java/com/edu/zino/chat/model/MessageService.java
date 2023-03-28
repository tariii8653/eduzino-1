package com.edu.zino.chat.model;

import java.util.List;

import com.edu.zino.domain.Chat;
import com.edu.zino.domain.Message;

public interface MessageService {
	public List<Message> selectChat(Message message);
	public void insert(Message message);
}
