package myoa.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import myoa.biz.MessageAttachmentBiz;
import myoa.biz.MessageReceptionBiz;
import myoa.entity.MessageAttachment;
import myoa.entity.MessageReception;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class MessageReceptionController {
	
	@Autowired
	private  MessageReceptionBiz biz;
	
	@Autowired
	private MessageAttachmentBiz maBiz;
	
	@PreAuthorize("hasAuthority('message-inbox')")
	@RequestMapping("/inbox")
	public String receptBox(Model model,
			@RequestParam(name="isRead", required=true, defaultValue="-1")int isRead,
			@RequestParam(name="status", required=true, defaultValue="-1")int status,
			@RequestParam(name="pageNum", required=true, defaultValue="1")int pageNum) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		final int pageSize=6;
		List<MessageReception> messageReception=biz.fetchReAll(userDetails.getEmployee().getId(),isRead,status, pageNum, pageSize);
		int row=biz.fetchReRow(userDetails.getEmployee().getId(),isRead, status);
		int totalPages=row%pageSize==0?row/pageSize:row/pageSize+1;
		model.addAttribute("messageReception",messageReception);
		model.addAttribute("totalPages",totalPages);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("row",row);
		//未读邮件
		model.addAttribute("unRead",biz.fetchReRow(userDetails.getEmployee().getId(),0,-1));
		//model.addAttribute("user",userDetails.getEmployee());
		return "inbox";
	}

	//收件箱的详情
		@RequestMapping("/inbox-detail")
		public String receptBox(Model model,int id) {
			biz.updateReaded(1,id);//更新为已读
		    model.addAttribute("detail",biz.fetchId(id));
		    model.addAttribute("attachment",maBiz.fetchAttachById(id));
		    model.addAttribute("attRow",maBiz.fetchAttachRowById(id));
			return "inbox-detail";
		}
	
	/* 删除到垃圾箱 */
	@RequestMapping(value = "/update-Rstatus", method = RequestMethod.POST)
	public String updateStatus(@RequestParam(name="index", required=true, defaultValue="0")int index,
			@RequestParam(name="isRead", required=true, defaultValue="-1")int isRead,
			int... id) {
		for (int i = 0; i < id.length; i++) {
			/*如果是正常的时候，删除去回收站状态改为1*/
			if (index == 0) {
				biz.updateReaded(1,id[i]);//更新为已读
				biz.updateStatus(1,id[i]);				
			}
			/*如果是在回收站的时候，恢复到正常0*/
			if (index ==1)
				biz.updateStatus(0, id[i]);
			/*如果是按彻底删除的时候，状态改为删除*/
			if (index ==2) {
				biz.updateReaded(1,id[i]);//更新为已读
				biz.updateStatus(2, id[i]);
			}			
			if(isRead==0) {
				biz.updateReaded(1,id[i]);//更新为已读
			}
		}
		return "redirect:/inbox?status=0";
	}
}
