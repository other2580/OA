package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import myoa.biz.ActivityBiz;
import myoa.entity.Activity;
import myoa.mapper.ActivityMapper;

@Service
public class ActivityBizImpl implements ActivityBiz{

	@Autowired
	private ActivityMapper activityMapper;
	
	@Override
	public List<Activity> findAll() {
		return activityMapper.findAll();
	}

	@Override
	public Activity findActivityById(int creatorId) {
		return activityMapper.findActivityById(creatorId);
	}

	@Override
	public int addActivity(Activity activity) {
		return activityMapper.addActivity(activity);
	}

	@Override
	public void updateActivity(Activity activity) {
		activityMapper.updateActivity(activity);
	}

	@Override
	public void deleteActivity(int id) {
		activityMapper.deleteActivity(id);
	}
	
	public static void main(String[] args) {
		ActivityBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(ActivityBiz.class);
		System.out.println(target.findAll().size()+" 123");
	}

}
