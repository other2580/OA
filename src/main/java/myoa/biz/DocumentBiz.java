package myoa.biz;

import java.util.List;

import myoa.entity.Document;

public interface DocumentBiz {

	List<Document> fetchByParentId(int parentId);
	
	int addDocument(Document document);
	
	void updateDocument(Document document);
	
	void delDocument(int id);
	
	int fetchByReturn(int parentId);
	
	Document fetchById(int id);
	
}
