package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.MessageBiz;
import myoa.entity.Message;
import myoa.mapper.MessageMapper;

@Service
public class MessageBizImpl implements MessageBiz {

	@Autowired
	private MessageMapper mapper;
	@Override
	public void addMessage(Message message) {
		 mapper.addMessage(message);		
	}
	


	@Override
	public void updateMessage(Message message) {
		mapper.updateMessage(message);
		
	}

	@Override
	public Message fetchById(int id) {
		
		return mapper.fetchById(id);
	}


	@Override
	public List<Message> fetchAll(int id,int isSent,int status,int level,String title,int pageNum,int pageSize) {
	
		return mapper.fetchAll(id,isSent,status,level,title,(pageNum-1)*pageSize, pageSize);
	}


	@Override
	public int fetchRow(int id,int isSent,int status,int level,String title) {
		return mapper.fetchRow(id,isSent,status,level,title);
	}
	
	@Override
	public void deleteMessage(int id) {
		mapper.deleteMessage(id);
		
	}

	@Override
	public void updateStatus(int status, int id) {
		mapper.updateStatus(status, id);		
	}

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		MessageBiz dao = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(MessageBiz.class);
		/*System.out.println(dao.fetchAll(1,-1,1,0,"", 0, 5).size());
		for (Message m : dao.fetchAll(1,-1,-1,0,"", 0, 5)) {
			System.out.println(m.getReceivers());
		}*/
		
		//dao.updateStatus(0,1);
		
		//System.out.println(dao.fetchById(1).getReceivers());						
		/*System.out.println(dao.fetchDelete().size());
		for (Message m :dao.fetchDelete()) {
			System.out.println(m.getContent());
		}*/				
		//System.out.println(dao.fetchDeleRow());
		System.out.println(dao.fetchDelete(2,2).size());
		for (Message m :dao.fetchDelete(2,2)) {
			System.out.println(m.getTitle());
		}
		
		
		
	}


	@Override
	public int fetchDeleRow() {		
		return mapper.fetchDeleRow();
	}



	@Override
	public Message fetchLate() {		
		return mapper.fetchLate();
	}



	@Override
	public List<Message> fetchDelete(int creatorId, int receiverId) {
		
		return mapper.fetchDelete(creatorId, receiverId);
	}



	@Override
	public int findcreator(int rid) {
		// TODO Auto-generated method stub
		return mapper.findcreator(rid);
	}



	@Override
	public void updateCreatorId(int status, int creatorId) {
		mapper.updateCreatorId(status, creatorId);
		
	}



	

}
