package com.edu.zino.chat.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Chat;
import com.edu.zino.exception.ChatException;

@Service
public class ChatServiceImpl implements ChatService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChatDAO chatDAO;

	//수강생 조회
	@Override
	public List selectAllByTeacher(int teacher_idx) {
		return chatDAO.selectAllByTeacher(teacher_idx);
	}
	
	//채팅방생성
	@Override
	public void insert(Chat chat) throws ChatException {
		chatDAO.insert(chat);
	}
	
	//채팅방 한건 조회
	public Chat select(Chat chat) {
		return chatDAO.select(chat);
	}
	
	//강사가 학생조회시
	public List selectByTeacher(Chat chat) {
		
		logger.info("강사가 조회시 ServiceImpl이 넘겨받은 chat"+chat);
		
		List<Chat> chatList = chatDAO.selectByTeacher(chat.getMember_teacher().getMember_idx());
		
		//logger.info("ServiceImpl chatList"+chatList);
		
		return chatList;
	}

	//학생이 강사 조회시
	public List selectByStudent(Chat chat) {
		
		logger.info("학생이 조회시 ServiceImpl이 넘겨받은 chat"+chat);
		
		List<Chat> chatList = chatDAO.selectByStudent(chat.getMember().getMember_idx());
		
		logger.info("ServiceImpl chatList"+chatList);
		
		return chatList;
	}

	@Override
	public Chat selectChatidx(int chat_idx) {
		return chatDAO.selectChatidx(chat_idx);
	}


}
