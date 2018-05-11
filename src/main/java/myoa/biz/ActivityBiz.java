package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Activity;

public interface ActivityBiz {

	/**
	 * 添加活动日程
	 * 
	 * @param activity
	 *            日程对象
	 */
	void add(Activity activity);

	/**
	 * 删除活动日程
	 * 
	 * @param id
	 *            日程Id
	 */
	void delete(@Param("id") int id);

	/**
	 * 更新活动日程
	 * 
	 * @param activity
	 *            日程对象
	 */
	void update(Activity activity);

	/**
	 * 根据活动日程id 查找日程
	 * 
	 * @return 日程对象
	 */
	Activity fetchActivityById(@Param("id") int id);
	
	/**
	 * 查找全部日程
	 * 
	 * @return 日程对象
	 */
	Activity fetchAllActivity();
	
	/**
	 * 查找全部日程
	 * 
	 * @return 日程对象
	 */
	List<Activity> fetchAllActivityById(@Param("id")int id);
	
}
