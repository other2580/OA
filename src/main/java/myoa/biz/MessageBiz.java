package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Message;

public interface MessageBiz {
	
	
	   void  addMessage(Message message);
	
	   void updateMessage(Message message);
	   
	   Message fetchById(int id);
	   
	   List<Message> fetchAll(int id,int isSent,int status,int level,String title,int pageNum,int pageSize);
	   int fetchRow(int id,int isSent, int status,int level,String title);
	     //彻底删除邮件
	   void deleteMessage(int id);
	 //删除到回收站，修改状态
	   void updateStatus(int status, int id);
	   
	   //根据创建者id修改状态
	   void updateCreatorId(int status,int creatorId);
	   
	   List<Message> fetchDelete(int creatorId,int receiverId);
	   int fetchDeleRow();
	   
	   //查询最新的一条数据
	   Message fetchLate();
	   
	   
	 //根据收件箱的id查询对应的创建者
	   int findcreator(int rid);

	   

}
