package com.edu.zino.chat.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Chat;
import com.edu.zino.domain.Message;
import com.edu.zino.exception.MessageException;

@Service
public class MessageServiceImpl implements MessageService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MessageDAO messageDAO;

	//chat_idx로 채팅방 조회
	@Override
	public List<Message> selectChat(int chat_idx) {
		return messageDAO.selectChat(chat_idx);
	}
	
	//메세지 저장
	@Override
	public void insert(Message message) throws MessageException {
		messageDAO.insert(message);
	}
}
