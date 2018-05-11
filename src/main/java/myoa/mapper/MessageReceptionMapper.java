package myoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import myoa.entity.MessageReception;

public interface MessageReceptionMapper {
	
    List<MessageReception> fetchReAll(
    		@Param("id")int id,
    		@Param("isRead")int isRead,
    		@Param("status")int status,
    		@Param("startIndex") int startIndex,
    		@Param("pageSize")int pageSize);
	
	int fetchReRow(@Param("id")int id,@Param("isRead")int isRead,@Param("status")int status);
	
	
	MessageReception fetchId(@Param("id")int id);
	
	
	@Insert("insert into MessageReception(messageId,receiverId,isRead,status) values(#{message.id},#{employee.id},#{isRead},#{status})")
	 void  saveRecept(MessageReception mReception);
	
	 @Delete("delete from MessageReception where id=#{id}")
	 void  delete(int id);
	 
	 //更新状态
	 @Update("UPDATE MessageReception SET STATUS = #{status} WHERE id= #{id}")
	 void updateStatus(@Param("status") int status, @Param("id") int id);
	 
	 //更新未读改成已读
	 @Update("update MessageReception set isRead=#{isRead} WHERE id=#{id}")
	 void updateReaded(@Param("isRead") int isRead,@Param("id") int id);
	

}
