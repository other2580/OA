package myoa.biz;

import myoa.entity.MessageAttachment;

public interface MessageAttachmentBiz {
	
	void add(MessageAttachment messageAttachment);
	
	MessageAttachment fetchAttachById(int messageId);
	
	
	int fetchAttachRowById(int messageId);

}
