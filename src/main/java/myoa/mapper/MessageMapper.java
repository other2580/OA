package myoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import myoa.entity.Message;

public interface MessageMapper {
	
	  @Insert("insert into Message(title,content,creatorId,sendTime,receivers,`level`,`status`,isSent)"
	  		+ " values(#{title},#{content},#{employee.id},#{sendTime},#{receivers},#{level},#{status},#{isSent})")
	  void  addMessage(Message message);
	  
	  @Update("update Message set title=#{title},content=#{content},creatorId=#{employee.id},sendTime=#{sendTime},receivers=#{receivers}"
	  		+ ",`level`=#{level},`status`=#{status},isSent=#{isSent} where id=#{id}")
	  void updateMessage(Message message);
	  
	  Message fetchById(@Param("id")int id);
	  
	  //查询最新的一条数据
	  @Select("SELECT * FROM message m ORDER BY  m.`id` DESC LIMIT 1")
	  Message fetchLate();
	  
	  List<Message> fetchAll(
			  @Param("id")int id,
			  @Param("isSent")int isSent,
			  @Param("status")int status,
			  @Param("level")int level,
			  @Param("title")String title,
			  @Param("startIndex")int startIndex,
	          @Param("pageSize")int pageSize);
	  
		 List<Message> fetchDelete(@Param("creatorId")int creatorId,@Param("receiverId")int receiverId);
		  int fetchDeleRow();
	      int  fetchRow(@Param("id")int id,@Param("isSent")int isSent,@Param("level")int level,@Param("status")int status,@Param("title")String title);
	  
	    
	    @Delete("delete from Message WHERE id = #{id}")
		void deleteMessage(int id);

	       //删除到回收站，修改状态
	  		@Update("UPDATE Message SET STATUS = #{status} WHERE id= #{id}")
	  		void updateStatus(@Param("status") int status, @Param("id") int id);
	  		
	  		//根据创建者id修改状态
	  		@Update("UPDATE Message SET STATUS = #{status} WHERE creatorId= #{creatorId}")
	  		void updateCreatorId(@Param("status") int status, @Param("creatorId") int creatorId);
		
		//根据收件箱的id查询对应的创建者
		@Select("SELECT m.Creatorid FROM Message m LEFT JOIN messagereception r ON(r.messageId=m.id) WHERE r.id=#{rid}")
		int findcreator(int rid);
	    
		
		
		
		
}
