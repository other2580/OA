package myoa.mapper;

import java.util.List;

import myoa.entity.ActivityActor;

public interface ActivityActorMapper {

	/**
	 * 根据活动ID查询相关
	 * @param id 活动ID
	 * @return 
	 */
	List<ActivityActor> getByActivityId(int id);
	
	/**
	 * 根据活动参与者ID查询相关
	 * @param id 参与者ID
	 * @return
	 */
	List<ActivityActor> getByActorId(int id);
	
	/**
	 * 新增日程参与者
	 * @param activityActor  
	 */
	void add(ActivityActor activityActor);
	
	/**
	 * 修改日程参与者
	 * @param activityActor
	 */
	void update(ActivityActor activityActor);
	
	/**
	 * 删除日程参与者
	 * @param id 
	 */
	void detele(int id);
	
}
