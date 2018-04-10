package myoa.biz;

import java.util.List;

import myoa.entity.Activity;

public interface ActivityBiz {

	List<Activity> findAll();
	
	Activity findActivityById(int creatorId);
	
	int addActivity(Activity activity);
	
	void updateActivity(Activity activity);
	
	void deleteActivity(int id);
	
}
