package myoa.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import myoa.biz.MessageAttachmentBiz;
import myoa.entity.MessageAttachment;
import myoa.mapper.MessageAttachmentMapper;

@Service
public class MessageAttachmentBizImpl implements MessageAttachmentBiz {

	@Autowired
	private MessageAttachmentMapper mapper;
	
	@Override
	public void add(MessageAttachment messageAttachment) {
		mapper.add(messageAttachment);
		
	}

	@Override
	public MessageAttachment fetchAttachById(int messageId) {
		// TODO Auto-generated method stub
		return mapper.fetchAttachById(messageId);
	}
	
	
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		MessageAttachmentBiz dao = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(MessageAttachmentBiz.class);
       
        System.out.println(dao.fetchAttachById(13).getName());
        System.out.println(dao.fetchAttachRowById(13));
	}

	@Override
	public int fetchAttachRowById(int messageId) {
		// TODO Auto-generated method stub
		return mapper.fetchAttachRowById(messageId);
	}

	

}
