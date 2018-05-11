package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
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
		List<Document> document;
		if(parentId==0) {
			document = documentMapper.fetchByParentId(0);
		}else {
			document = documentMapper.fetchByParentId(parentId);
		}
		if(document.size() != 0) {
			for(Document d : document) {
				List<Document> docs = documentMapper.fetchByParentId(d.getId());
				d.setDocuments(docs);
			}
		}
		
		return document;
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
	
	@Override
	public int fetchByReturn(int parentId) {
		int aa = 0;
		try {
			aa = documentMapper.fetchByReturn(parentId);
		} catch (Exception e) {
			aa = 0;
		}
		return aa;
	}

	@Override
	public Document fetchById(int id) {
		return documentMapper.fetchById(id);
	}
	
	public static void main(String[] args) {
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();  
 	 	String pwd = md5.encodePassword("123", "Nr002"); 
 	 	System.out.println(pwd);
	}


}
