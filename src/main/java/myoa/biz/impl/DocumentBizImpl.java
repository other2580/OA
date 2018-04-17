package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.DocumentBiz;
import myoa.entity.Document;
import myoa.mapper.DocumentMapper;

@Service
public class DocumentBizImpl implements DocumentBiz{

	@Autowired
	private DocumentMapper documentMapper;
	
	@Override
	public List<Document> fetchByParentId(int parentId) {
		return documentMapper.fetchByParentId(parentId);
	}

	@Override
	public int addDocument(Document document) {
		return documentMapper.addDocument(document);
	}

	@Override
	public void updateDocument(Document document) {
		documentMapper.updateDocument(document);
	}

	@Override
	public void delDocument(int id) {
		documentMapper.delDocument(id);
	}
	
	public static void main(String[] args) {
		DocumentBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(DocumentBiz.class);
		for(Document list : target.fetchByParentId(1)) {
			System.out.println(list.getParentId()+"   "+list.getName()+"   "+list.getEmployee().getName());
		}
	}

}
