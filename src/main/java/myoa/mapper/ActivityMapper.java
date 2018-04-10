package myoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Activity;

public interface ActivityMapper {

	List<Activity> findAll();
	
	Activity findActivityById(@Param("creatorId") int creatorId);
	
	int addActivity(Activity activity);
	
	void updateActivity(Activity activity);
	
	void deleteActivity(@Param("id")int id);
	
}
