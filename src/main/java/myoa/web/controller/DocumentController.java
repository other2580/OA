package myoa.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.entity.Document;
import myoa.mapper.DocumentMapper;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentMapper documentMapper;
	
	@RequestMapping("/NewFile")
	public String NewFile() {
		return "NewFile";
	}
	
	@ResponseBody
	@RequestMapping("/document")
	public List<Document> document(Integer parentId) {
		parentId = parentId==null ? 0:parentId;
		List<Document> list = documentMapper.fetchByParentId(parentId);
		return list;
	}

}
