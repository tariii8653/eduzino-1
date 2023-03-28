package com.edu.zino.chat.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Message;
import com.edu.zino.exception.MessageException;

@Repository
public class MybatisMessageDAO implements MessageDAO {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Message> selectChat(Message message) {
		List list = sqlSessionTemplate.selectList("Message.selectChat", message);
		
		//logger.info("list_chatMessage"+list);
		
		return list;
		
	}

	@Override
	public void insert(Message message) throws MessageException {
		int result = sqlSessionTemplate.insert("Message.insert", message);
		if(result <1) {
			throw new MessageException("메세지 저장 실패");
		}
	}
	
	
}
