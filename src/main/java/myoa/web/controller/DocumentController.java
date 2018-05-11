package myoa.web.controller;

import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import myoa.biz.DocumentBiz;
import myoa.entity.Document;
import myoa.entity.Employee;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class DocumentController {
	
	private  List<Integer> ss = new ArrayList<>();
	private  int xi=0;
	public String fileTitle = "/:根目录";
	
	@Autowired
	private DocumentBiz documentBiz;
	
	@PreAuthorize("hasAuthority('document-manager')")
	@RequestMapping("/fileIO")
	public String fileIO() {
		ss = new ArrayList<>();
		xi=0;
		return "fileIO";
	}
	
	@ResponseBody
	@RequestMapping("/document")
	public String document(Integer parentId) {
		parentId = parentId==null ? 0:parentId;
		List<Document> list = documentBiz.fetchByParentId(parentId);
		
		ObjectMapper mapper = new ObjectMapper();  
		String jsonfromList="";
		try {
			 jsonfromList = mapper.writeValueAsString(list);			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		if(ss.size()==0) {
			ss.add(0, 0);
			xi=1;
			return jsonfromList;
		}else {
			boolean bo=true;
			for (int i = 0; i < ss.size(); i++) {				
				if(ss.get(i).equals(parentId)) {					
					bo =false;
					return "[]";
				}else if(i==ss.size()-1) {					
					ss.add(xi,parentId);
					xi++;
					return jsonfromList;
				}
			}			
			if(bo) {
				return jsonfromList;
			}else {
				return "[]";
			}
			
		}
	}
	
	@ResponseBody
	@RequestMapping("/showFile")
	public List<Document> showFile(Integer parentId) {
		fileTitle = "/:根目录";
		parentId = parentId==null ? 0:parentId;
		List<Document> list = documentBiz.fetchByParentId(parentId);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/showFileJtree")
	public Map<String, Object> showFileJtree(Integer parentId, int id) {
		parentId = parentId==null ? 0:parentId;
		Map<String, Object> map = new HashMap<>();
		List<Document> list = documentBiz.fetchByParentId(parentId);
		
		System.out.println(id);
		fileTitle = find(id);
		System.out.println(fileTitle);
		String title = fileTitle;
		
		map.putIfAbsent("doc", list);
		map.putIfAbsent("title", title);
		return map;
	}
	
	public String find(int id) {
		fileTitle = "/:根目录";
		Stack stack = new Stack();
		if(id != 0) {
			Document document = documentBiz.fetchById(id);
			for(int i=0; i<1; i++) {
				if(document.getParentId() == 0) {
					stack.push(document.getName());
					break;
				}else {
					stack.push(document.getName());
					find(document.getParentId());
				}
			}
			for(int i=0; i<stack.size(); i++) {
				fileTitle = fileTitle + " > " + stack.pop();
			}
			
		}
		return fileTitle;
	}
	
	@ResponseBody
	@RequestMapping("/showFileChick")
	public Map<String, Object> showFileChick(Integer parentId, String title) {
		parentId = parentId==null ? 0:parentId;
		Map<String, Object> map = new HashMap<>();
		List<Document> list = documentBiz.fetchByParentId(parentId);
		
		String fu = " > ";
		fileTitle = fileTitle + fu + title;
		title = fileTitle;
		
		map.putIfAbsent("doc", list);
		map.putIfAbsent("title", title);
		return map;
	}
	
	//点击返回使用
	@ResponseBody
	@RequestMapping("/showReturn")
	public Map<String, Object> showReturn(Integer parentId) {
		parentId = parentId==null ? 0:parentId;
		Map<String, Object> map = new HashMap<>();
		List<Document> list = documentBiz.fetchByParentId(parentId);
		if(parentId.equals("0")) {
			parentId = 2;
		}
		Integer id = documentBiz.fetchByReturn(parentId);
		
		fileTitle = fileTitle.substring(0, fileTitle.lastIndexOf(">"));
		String title = fileTitle;
		
		map.putIfAbsent("document", list);
		map.putIfAbsent("id", id);
		map.putIfAbsent("title", title);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/addFile")
	public List<Document> addFile(String name, int parentId) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		Employee employee = new Employee();
		employee.setId(userDetails.getEmployee().getId()); //用户ID
		Document document = new Document(name, employee, "FOLDER", "", parentId);
		int count = documentBiz.addDocument(document);
		List<Document> list = documentBiz.fetchByParentId(parentId);
		return list;
	}
	
	//单文件上传，参数必须是MultipartFile类型,用来接收上传的文件 
	@ResponseBody
    @RequestMapping("test_upload")  
    public Map<String, Object> test_upload(MultipartFile multipartFile,Integer id) throws Exception{
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//图片的原始名称（不含路径）  
		String origanlFileName = multipartFile.getOriginalFilename();
		Map<String, Object> map = new HashMap<>();
		boolean flog = true;
		try {
			if(multipartFile != null){  
	            //文件上传的保存路径  
	            String path="D:\\dev\\Tomcat-8.0\\webapps\\MyOA\\static\\Upload\\";  
	            //上传的图片的保存的新名称，随机生成文件名称+.jpg  
	            String newFileName = origanlFileName;  
	            File file = new File(path+newFileName);  
	            //将内存的数据写到磁盘上  
	            multipartFile.transferTo(file);
	            map.put("ok", true);
	            map.put("error", "添加成功！");
	        }  
		} catch (Exception e) {
			map.put("ok", false);
            map.put("error", "添加失败，文件类型或文件过大！");
            flog = false;
		}
		
		if(flog) {
			String type = origanlFileName.substring(origanlFileName.lastIndexOf(".")+1); 
			String name = origanlFileName.substring(0, origanlFileName.lastIndexOf("."));
			String fileUrl = "Upload/"+origanlFileName;
			Employee employee = new Employee();
			employee.setId(userDetails.getEmployee().getId()); //用户ID
			Document document = new Document(name, employee, type, fileUrl, id);
			//添加数据到数据库
			documentBiz.addDocument(document);
		}
		
        return map;  
    }  
	
	@RequestMapping("/test_download")  
    //String filename 是请求参数  
    public String test_download(HttpServletRequest request,HttpServletResponse response,String filename) throws Exception{  
        response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(filename, "UTF-8"));
        String path = "D:\\dev\\Tomcat-8.0\\webapps\\MyOA\\static\\Upload\\"+filename;//得到资源在硬盘上的绝对的路径      
        File file = new File(path);  
        response.setCharacterEncoding("UTF-8");  
        filename = URLEncoder.encode(filename, "UTF-8");//将中文转为浏览器可认识的编码  
        response.setHeader("content-disposition", "attachment;filename="+filename);//设置响应头为文件下载  
        response.setContentLength((int)file.length());  
        int len = 0;  
        byte []buffer = new byte[1024];  
        InputStream is = new FileInputStream(file);  
        OutputStream os= response.getOutputStream();//向浏览器写数据  
        while((len = is.read(buffer)) != -1){  
            os.write(buffer,0,len);  
        }  
        is.close();  
        os.close();  
        return null;    //一定要返回null,执行后不跳转  
    }
	
	
	//删除文件
	@ResponseBody
	@RequestMapping("/deleteDocument")  
	public void deleteDocument(int id) {
		List<Document> document;
		for(int i=0; i<1; i=0) {
			document = documentBiz.fetchByParentId(id);
			if(document.size() == 0) {
				System.out.println(id);
				documentBiz.delDocument(id);
				return;
			}else {
				for(int j=0; j<document.size(); j++) {
					System.out.println(document.get(i).getName());
					deleteDocument(document.get(i).getId());
				}
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("/openFile")
	public void openFile(String Filed){
		Filed = "D:\\dev\\Tomcat-8.0\\webapps\\MyOA\\static\\Upload\\"+Filed;
		Filed = Filed.replace("\\","/");
		System.out.println(Filed);
		File file = new File(Filed);
		try {
			Desktop.getDesktop().open(file);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}





