package myoa.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myoa.biz.EmployeeBiz;
import myoa.biz.MessageReceptionBiz;
import myoa.entity.Activity;
import myoa.entity.ActivityActor;
import myoa.entity.Employee;
import myoa.mapper.ActivityActorMapper;
import myoa.mapper.ActivityMapper;
import myoa.web.security.EmployeeDetailsImpl;

@Controller
public class ActivityController {

	@Autowired
	private ActivityActorMapper activityActorMapper;
	@Autowired
	private ActivityMapper activityMapper;
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private  MessageReceptionBiz biz;

	
	@PreAuthorize("hasAuthority('activity-calendar')")
	@RequestMapping("/calendar")
	public String calendar() {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		System.out.println(userDetails.getEmployee().getId());
		return "calendar";
	}
	
	@RequestMapping("/updateActivity")
	public String updateActivity(Activity activity) {
		activityMapper.update(activity);
		return "calendar";
	}
	
	@RequestMapping("/addActivity")
	@Transactional(propagation=Propagation.REQUIRED, timeout=60)
	public String addActivity(Activity activity) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		Employee emp = new Employee();
		System.out.println(userDetails.getEmployee().getId());
		emp.setId(userDetails.getEmployee().getId());
		//添加一条日程记录
		activity.setEmployee(emp);
		activity.setCreatetime(new Date(System.currentTimeMillis()));
		activityMapper.add(activity);
		
		//添加一条日程参与者记录
		Activity act = new Activity();
		act.setId(activity.getId());
		ActivityActor actor = new ActivityActor();
		actor.setActivity(act);
		actor.setEmployee(emp);
		activityActorMapper.add(actor);
		return "calendar";
	}
	
	@RequestMapping("/delActivity")
	@Transactional(propagation=Propagation.REQUIRED, timeout=60)
	public String delActivity(int id) {
		activityActorMapper.detele(id);
		activityMapper.delete(id);
		return "calendar";
	}
	
	@ResponseBody
	@RequestMapping("/activity")
	public Map<String, Object> activity() {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		List<ActivityActor> activity = activityActorMapper.getByActorId(userDetails.getEmployee().getId());
		System.out.println(activity.get(0).getActivity().getStartTime());
		Map<String, Object> data=new HashMap<>();
		data.put("data", activity);
		data.put("userId", userDetails.getEmployee().getId());
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/activityById")
	public Activity activityById(int activityId) {
		return activityMapper.fetchActivityById(activityId);
	}
	
	@RequestMapping("/customMeeting")
	public String customMeeting(Model model) {
		List<Employee> employee = employeeBiz.fetchAllEmployee();
		model.addAttribute("employee", employee);
		return "customMeeting";
	}
	
	@RequestMapping("/addCustomMeeting")
	public String AddCustomMeeting(Activity activity, int [] emplo) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		Employee emp = new Employee();
		emp.setId(userDetails.getEmployee().getId());
		//添加一条日程记录
		activity.setEmployee(emp);
		activity.setCreatetime(new Date(System.currentTimeMillis()));
		activityMapper.add(activity);
		
		System.out.println(activity.getId());
		//添加日程参与者记录
		Activity act = new Activity();
		act.setId(activity.getId());
		for(int i=0; i<emplo.length; i++) {
			emp.setId(emplo[i]);
			ActivityActor actor = new ActivityActor();
			actor.setActivity(act);
			actor.setEmployee(emp);
			activityActorMapper.add(actor);
		}
		return "redirect:mySchedule";
	}
	
	@PreAuthorize("hasAuthority('activity-list')")
	@RequestMapping("/mySchedule")
	public String mySchedule(Model model) {
		EmployeeDetailsImpl userDetails = (EmployeeDetailsImpl) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		model.addAttribute("tdayActivity", activityActorMapper.getByActorId(userDetails.getEmployee().getId()));
		model.addAttribute("sid", userDetails.getEmployee().getId());
		return "mySchedule";
	}
	
	@ResponseBody
	@RequestMapping("/myTrip")
	public Activity myTrip(Integer id, Model model) {
		return activityMapper.fetchActivityById(id);
	}
	
}
