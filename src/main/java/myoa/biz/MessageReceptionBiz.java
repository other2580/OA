package myoa.biz;

import java.util.List;

import myoa.entity.MessageReception;

public interface MessageReceptionBiz {
	
	//收件箱的
	List<MessageReception> fetchReAll(int id,int isRead, int status, int pageNum, int pageSize);

	int fetchReRow(int id,int isRead, int status);
	
	MessageReception fetchId(int id);
	
	void  saveRecept(MessageReception mReception);
	//彻底删除邮件
	void delete(int id);
	//删除到回收站，修改状态
	void updateStatus(int status, int id);
	
	void updateReaded(int isRead, int id);

}
