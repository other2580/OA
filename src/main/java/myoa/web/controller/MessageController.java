package myoa.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.biz.MessageBiz;
import myoa.entity.Employee;
import myoa.entity.Message;
import myoa.entity.MessageAttachment;
import myoa.entity.MessageReception;
import myoa.mapper.MessageAttachmentMapper;
import myoa.mapper.MessageReceptionMapper;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class MessageController {
	

	@Autowired
	private MessageBiz biz;
	
	@Autowired
	private EmployeeBiz ebiz;
	
	@Autowired
	private DepartmentBiz dbiz;
    
	@Autowired
	private MessageReceptionMapper rbiz;
	
	@Autowired
	private MessageAttachmentMapper messageAttachmentBiz;
	
	//邮件发送和草稿箱
	@PreAuthorize("hasAuthority('message-outbox')")
	@RequestMapping("/inbox-send")
	public String sendinbox(Model model,
			@RequestParam(name="status", required=true, defaultValue="-1")int status,
			@RequestParam(name="isSent", required=true, defaultValue="-1")int isSent,
			@RequestParam(name="pageNum", required=true, defaultValue="1")int pageNum,
			@RequestParam(name="level", required=true, defaultValue="0")int level,
			String title) {	
		
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		final int pageSize=2;
		int rows=biz.fetchRow(userDetails.getEmployee().getId(), isSent, status, level,title);
		int totalPages=rows%pageSize==0?rows/pageSize:rows/pageSize+1;
		List<Message> messages=biz.fetchAll(userDetails.getEmployee().getId(), isSent, status, level,title, pageNum, pageSize);		
		model.addAttribute("messages",messages);
		model.addAttribute("totalPages",totalPages);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("rows",rows);
		//model.addAttribute("user",userDetails.getEmployee());
		return "inbox-send";
	}
	
	
	//发件箱的详情
	@RequestMapping("/sinbox-detail")
	public String sendtBox(Model model,int id) {
	    model.addAttribute("sdetail",biz.fetchById(id));
		return "inbox-detail";
	}	
	
	
	//删除,改状态为1
	@ResponseBody
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public JsonResult delete(String ids) {	
		try {
			String[] item = ids.split(",");
			for (int i = 0; i < item.length; i++) { 
				biz.updateStatus(1, Integer.parseInt(item[i]));
				System.out.println(item[i]);
			} 
			return new JsonResult(true, "");
			
		}catch (Exception e) {
			return new JsonResult(false, e.getMessage());
		}		
	}
	
	//彻底删除,改状态改为2
	@ResponseBody
	@RequestMapping(value="/Redelete", method = RequestMethod.POST)
	public JsonResult Redelete(String ids) {
		try {
			String[] item = ids.split(",");
			for (int i = 0; i < item.length; i++) { 
				biz.updateStatus(2, Integer.parseInt(item[i]));
				System.out.println(item[i]);
			} 
			return new JsonResult(true, "");
			
		}catch (Exception e) {
			return new JsonResult(false, e.getMessage());
		}		
	}
	
	
	//回收站
	@RequestMapping("/inbox-delete")
	public String inboxDelete(Model model) {	
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		int creatorId=userDetails.getEmployee().getId();
		int receiverId=userDetails.getEmployee().getId();
		//所以状态为1的集合
		//model.addAttribute("dRow",biz.fetchDeleRow());
		model.addAttribute("delist",biz.fetchDelete(creatorId, receiverId));
		//System.out.println(biz.fetchDelete().size());
		return "inbox-delete";
	}
	
	//回收站彻底删除，状态改为2
		@ResponseBody
		@RequestMapping(value="/remove", method = RequestMethod.POST)
		public JsonResult remove(String mid) {
			
			try {
				EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();			
				String[] item = mid.split(","); 
				for(int i = 0; i < item.length; i++) {
					int creatorId=biz.findcreator(Integer.parseInt(item[i]));
					if(creatorId==userDetails.getEmployee().getId()) {
						biz.updateCreatorId(2, creatorId);
					}else {
						rbiz.updateStatus(2,Integer.parseInt(item[i]));
					}
				}					
				return new JsonResult(true, "删除成功！");
				
			}catch (Exception e) {
				return new JsonResult(false, e.getMessage());
			}	
			
		}
		//回收站恢复，状态改为2
		@ResponseBody
		@RequestMapping(value="/comback", method = RequestMethod.POST)
		public JsonResult comback(String mid) {
			
			try {
				EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();			
				String[] item = mid.split(","); 
				for(int i = 0; i < item.length; i++) {
					int creatorId=biz.findcreator(Integer.parseInt(item[i]));
					if(creatorId==userDetails.getEmployee().getId()) {
						biz.updateStatus(0, creatorId);
					}else {
						rbiz.updateStatus(0,Integer.parseInt(item[i]));
					}
				}					
				return new JsonResult(true, "删除成功！");
				
			}catch (Exception e) {
				return new JsonResult(false, e.getMessage());
			}	
			
		}
	//邮件编辑
		@RequestMapping(value="/inbox-edit",method=RequestMethod.GET)
		public String inboxEdit(Model model,@RequestParam(name="id", required=true, defaultValue="0")int id){	
			//如果有id，把数据推送到编辑页面
			if(id>0) {
				model.addAttribute("draft",biz.fetchById(id));
				model.addAttribute("detail",rbiz.fetchId(id));
			}
			//把部门信息推送过去
			model.addAttribute("departments",dbiz.findAll());
			//把员工信息推送去页面
			model.addAttribute("employees",ebiz.fetchAllEmployee());
			//把id推送过去
			model.addAttribute("mid",id);

			return "inbox-edit";
		}
	
    //直接回复
	@ResponseBody
	@RequestMapping(value="sent",method=RequestMethod.POST)
	public JsonResult sent(String title,int eid,Message message) {
		//System.out.println(content);
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//保存message信息
		Employee employee = new Employee();		
		employee.setId(userDetails.getEmployee().getId());
		message.setEmployee(employee);//创建者的id
		message.setSendTime(new Date(System.currentTimeMillis()));//回复日期
		message.setTitle("回复："+title);//回复标题
		//message.setContent(content);
		message.setStatus(0);//是否正常
		message.setLevel(1);//级别情况 1
		message.setIsSent(1);//是否发送				
		biz.addMessage(message);
		message.setId(biz.fetchLate().getId());	
		//添加到收件箱
		MessageReception mr = new MessageReception();
		mr.setMessage(message);
		Employee e = new Employee();
		e.setId(eid);//收件人id		
		mr.setEmployee(e);
		mr.setIsRead(0);
		mr.setStatus(0);
		rbiz.saveRecept(mr);		
		return new JsonResult(true,"发送成功");
	}
	
	
	
	
	//文件上传和发送
		@RequestMapping(value="/save")
		public String Docmentadd(Message message,HttpSession session,MultipartFile file,int[] listemployeeid){
			
			//一些思路
			/*String str = "sss;sss; ^1,2,3";
			String idstr = str.substring(str.lastIndexOf('^')+1);
			String[] ids = idstr.split(",");
			for (int i = 0; i < ids.length; i++) {
				Integer.valueOf(ids[i]);
			}*/
			
			EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
			//保存message信息
			Employee employee = new Employee();
			//创建者的id
			employee.setId(userDetails.getEmployee().getId());
			message.setEmployee(employee);
			message.setSendTime(new Date(System.currentTimeMillis()));
			
			
			//如果从草稿箱进入到编辑页面的话，就直接更新message表
			if(message.getId()>0) {
					biz.updateMessage(message);
			}else {
				biz.addMessage(message);
				message.setId(biz.fetchLate().getId());	
			}
			
			//添加到收件箱里，可发送多个人
			for (int i : listemployeeid) {
				MessageReception mr = new MessageReception();
				mr.setMessage(message);
				Employee e = new Employee();
				e.setId(i);
				mr.setEmployee(e);
				mr.setIsRead(0);
				mr.setStatus(0);
				rbiz.saveRecept(mr);
				
			}		
			
				//如果文件不等于空的时候保存附件
				if (!file.isEmpty()) {
					//获取静态资源对应的真实文件路径
				  String pathName = session.getServletContext().getRealPath("/statics");
					//获取上传文件名称
				  String fileName = file.getOriginalFilename();
					//获取上传文件的文件类型，以供后面判断是否可以上传使用
					String extension = FilenameUtils.getExtension(fileName);
					pathName= pathName+File.separator+"image"+File.separator+fileName ;
					System.out.println(pathName);
					System.out.println(fileName);
					File dest = new File(pathName);
					if(!dest.exists()){
						dest.mkdirs();
					}
					try {
						file.transferTo(dest);
						//保存附件表
						MessageAttachment mach = new MessageAttachment();
						mach.setFileUrl(pathName);
						mach.setName(fileName);
						mach.setMessage(message);
						messageAttachmentBiz.add(mach);
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}											
				}
				
			return "redirect:/inbox-edit";
		}
		
}

  
 