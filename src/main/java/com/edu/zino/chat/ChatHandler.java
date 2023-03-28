package com.edu.zino.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.edu.zino.chat.model.ChatService;
import com.edu.zino.chat.model.MessageService;
import com.edu.zino.domain.Chat;
import com.edu.zino.domain.Message;


//웹소켓 요청을 처리할 핸들러
//TextWebSocketHandler : 이미지, 동영상 , 텍스트 다 가능하지만, 우리의 목적은
//채팅이기 때문에 Text~~ 기반의 핸들러를 재정의 한다 


public class ChatHandler extends TextWebSocketHandler {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
    // session, 방 번호가 들어간다.
    private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
	
	 // 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
    private Map<Integer, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	
	@Autowired
	private MessageService messageService; //메세지 저장
	
	@Autowired
	private ChatService chatService;
	
    private static int i;
	
	//클라이언트가 접속하면... 
	//session : member를 찾아서 사용자찾기!
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("afterConnectionEstablished 호출");
        i++;
        logger.info(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
		logger.info(" sessionId "+ session.getId());
		logger.info(" sessionList "+ sessionList);
	}
	
	//메시지가 도착하면...
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage textMessage) throws Exception {
		String msg=textMessage.getPayload();
		logger.info("클라이언트가 보낸 메시지 "+msg);
		
		Message message = new Message(); //메세지 정보를 담을 DTO
		Chat chat = new Chat(); //채팅방 idx를 담을 DTO
		
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(","); //메세지 내용 저장
			if(strs != null && strs.length == 4) {
				String roomNum = strs[0];
				String sendId = strs[1]; //추후 누가 member_idx를 넘기자
				String resiveId = strs[2]; //추후 누구에게 member_idx를 넘기자
				String content = strs[3];
				
				//DB에 메세지저장
				chat.setChat_idx(Integer.parseInt(roomNum));
				
				message.setMe(Integer.parseInt(sendId));
				message.setYou(Integer.parseInt(resiveId));
				message.setMessage_content(content);
				message.setChat(chat);
				
			}
		}
		logger.info("message담은 후 "+message);
		
		//받은 메세지로 채팅방 찾기
		Chat chatRoom = chatService.selectChatidx(chat.getChat_idx());
		
		logger.info("chatRoom "+chatRoom.getChat_idx());
		logger.info("RoomList "+RoomList.get(chatRoom.getChat_idx()));
		
        // 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고, DB에서의 채팅방이 있을 때
        // 채팅방 생성
        if(RoomList.get(chatRoom.getChat_idx()) == null && message.getMessage_content().equals("ENTER-CHAT") && chatRoom != null) {
            
            // 채팅방에 들어갈 session들
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getChat_idx());
            // RoomList에 추가
            RoomList.put(chatRoom.getChat_idx(), sessionTwo);
            // 확인용
            logger.info("sessionTwo "+ sessionTwo);
            logger.info("sessionList "+ sessionList);
            logger.info("RoomList "+RoomList.get(chatRoom.getChat_idx()));
            logger.info("채팅방 생성");
            
        } else if(RoomList.get(chatRoom.getChat_idx()) != null && message.getMessage_content().equals("ENTER-CHAT") && chatRoom != null) {    // 채팅방이 존재 할 때
            
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            RoomList.get(chatRoom.getChat_idx()).add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getChat_idx());
            // 확인용
            logger.info("생성된 채팅방으로 입장");
        } else if(RoomList.get(chatRoom.getChat_idx()) != null && !message.getMessage_content().equals("ENTER-CHAT") && chatRoom != null) { // 채팅 메세지 입력 시

            // 보낼 내용 담기
            TextMessage data = new TextMessage(msg);
            
            // 현재 session 수
            int sessionCount = 0;
 
            // 해당 채팅방의 session에 뿌려준다.
            for(WebSocketSession sess : RoomList.get(chatRoom.getChat_idx())) {
                sess.sendMessage(data);
                sessionCount++;
            }
            
            // 동적쿼리에서 사용할 sessionCount 저장
            // sessionCount == 2 일 때는 unReadCount = 0,
            // sessionCount == 1 일 때는 unReadCount = 1
            //chatMessage.setSessionCount(sessionCount);
            
            // DB에 저장한다.
            logger.info("db저장할때 message"+message);
            messageService.insert(message);
            
            logger.info("채팅메세지 입력");
        }

	}
	
	//접속이 끊기면...
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("afterConnectionClosed 호출..");
        i--;
        logger.info(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
        // sessionList에 session이 있다면
        if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
            RoomList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
	}
}
