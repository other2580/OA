package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.ActivityActorBiz;
import myoa.biz.DocumentBiz;
import myoa.entity.ActivityActor;
import myoa.mapper.ActivityActorMapper;

@Service
public class ActivityActorBizImpl implements ActivityActorBiz{

	@Autowired
	private ActivityActorMapper activityActorMapper;
	
	@Override
	public List<ActivityActor> getByActivityId(int id) {
		return activityActorMapper.getByActivityId(id);
	}

	@Override
	public List<ActivityActor> getByActorId(int id) {
		return activityActorMapper.getByActorId(id);
	}

	@Override
	public void add(ActivityActor activityActor) {
		activityActorMapper.add(activityActor);
	}

	@Override
	public void update(ActivityActor activityActor) {
		activityActorMapper.update(activityActor);
	}

	@Override
	public void detele(int id) {
		activityActorMapper.detele(id);
	}

	public static void main(String[] args) {
		ActivityActorBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(ActivityActorBiz.class);
		List<ActivityActor> list = target.getByActorId(1);
		for(ActivityActor map : list) {
			System.out.println(map.getActivity().getTitle());
		}
	}
	
}
