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

	
	//채팅방 전체 조회
	@Override
	public List<Message> selectAll(Message message) {
		return messageDAO.selectAll(message);
	}
	
	//chat_idx로 채팅방 조회
	@Override
	public List<Message> selectChat(Message message) {
		return messageDAO.selectChat(message);
	}
	
	//안읽은 메세지 조회
	@Override
	public List<Message> seleckByCheck(Message message) {
		return messageDAO.seleckByCheck(message);
	}
	
	//메세지 저장
	@Override
	public void insert(Message message) throws MessageException {
		messageDAO.insert(message);
	}

	//읽었는지 체크
	@Override
	public void updateCheck(List<Message> messages) throws MessageException {
		for(Message message : messages) {
			messageDAO.updateCheck(message);			
		}
	}

}
