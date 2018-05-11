package myoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import myoa.entity.MessageAttachment;

public interface MessageAttachmentMapper {
	
	@Insert("insert into MessageAttachment(name,fileUrl,messageId) values(#{name},#{fileUrl},#{message.id})")
	void add(MessageAttachment messageAttachment);
	
	//查询对应的人的附件
	@Select("SELECT * FROM  messageattachment ma WHERE ma.messageId=#{messageId}")
	MessageAttachment fetchAttachById(int messageId);
	
	//查询对应的人有几个附件
	@Select("SELECT count(1) FROM  messageattachment ma WHERE ma.messageId=#{messageId}")
	int fetchAttachRowById(int messageId);

}
