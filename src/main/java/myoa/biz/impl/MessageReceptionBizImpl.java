package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import myoa.biz.MessageReceptionBiz;
import myoa.entity.MessageReception;
import myoa.mapper.MessageReceptionMapper;

@Service
public class MessageReceptionBizImpl implements MessageReceptionBiz {

	@Autowired
	private MessageReceptionMapper mapper;
	@Override

	public List<MessageReception> fetchReAll(int id,int isRead, int status, int pageNum, int pageSize) {
		
		return mapper.fetchReAll(id,isRead, status, (pageNum-1)*pageSize, pageSize);
	}

	@Override
	public int fetchReRow(int id,int isRead, int status) {
		
		return mapper.fetchReRow(id,isRead, status);
	}

	@Override
	public MessageReception fetchId(int id) {
		return mapper.fetchId(id);
	}

	
	
	@Override
	public void delete(int id) {
		mapper.delete(id);
		
	}

	@Override
	public void updateStatus(int status, int id) {
		mapper.updateStatus(status, id);
		
	}
	public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-beans.xml");
		MessageReceptionBiz biz=ctx.getBean(MessageReceptionBiz.class);
		/*System.out.println(biz.fetchReAll(1,-1,-1,0,17).size());
		
		for (MessageReception m: biz.fetchReAll(1,-1,-1,0,17)){
			System.out.println(m.getIsRead()+"\t"+m.getId()+"\t"+m.getMessage().getId()+"\t"+m.getMessage().getTitle()+
					"\t"+m.getMessage().getContent()+"\t"+m.getEmployee().getName()+"\t"+m.getMessage().getSendTime()+"\t");
		}
		*/
		//System.out.println(biz.fetchReRow(1,0));
		
		System.out.println(biz.fetchId(1).getMessage().getReceivers());
		/*biz.updateReaded(0,1);
		
		System.out.println(biz.fetchId(2).getId());
		
		for (MessageReception m: biz.fetchReAll(1, 0, 0,1,4)){
			System.out.println(m.getMessage().getId());
		}*/
		
	}

	@Override
	public void saveRecept(MessageReception mReception) {
		  mapper.saveRecept(mReception);
		
	}

	@Override
	public void updateReaded(int isRead, int id) {
		mapper.updateReaded(isRead,id);
		
	}

	

	

}
