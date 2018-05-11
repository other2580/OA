package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.ActivityBiz;
import myoa.entity.Activity;
import myoa.mapper.ActivityMapper;

@Service
public class ActivityBizImpl implements ActivityBiz {

	@Autowired
	private ActivityMapper activityMapper;

	@Override
	public void add(Activity activity) {
		activityMapper.add(activity);
	}

	@Override
	public void delete(int id) {
		activityMapper.delete(id);
	}

	@Override
	public void update(Activity activity) {
		activityMapper.update(activity);
	}

	@Override
	public Activity fetchActivityById(int id) {
		return activityMapper.fetchActivityById(id);
	}
	
	@Override
	public List<Activity> fetchAllActivityById(int id) {
		return activityMapper.fetchAllActivityById(id);
	}
	
	
	
	public static void main(String[] args) {
		ActivityBiz tar = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(ActivityBiz.class);
//		System.out.println(tar.fetchActivityById(1).getCreator().getName());
//		List<Employee> list = tar.fetchActivityById(1).getParticipant();
//		for(Employee map : list) {
//			System.out.println(map.getName());
//		}
		
		System.out.println(tar.fetchActivityById(1).getEmployee().getId());
		
		
	}

	@Override
	public Activity fetchAllActivity() {
		// TODO Auto-generated method stub
		return null;
	}

}
