package myoa.mapper;

import java.util.List;

import myoa.entity.Document;

public interface DocumentMapper {

	List<Document> fetchByParentId(int parentId);
	
	int addDocument(Document document);
	
	void updateDocument(Document document);
	
	void delDocument(int id);
	
}
