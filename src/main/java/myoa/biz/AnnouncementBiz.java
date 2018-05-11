package myoa.biz;

import java.util.List;

import myoa.entity.Announcement;

public interface AnnouncementBiz {
	
	void addAnnouncement(Announcement a);
	
	void updateAnnouncement(Announcement announcement);
	
	List<Announcement> getAllAnnouncement();
	
	Announcement fetchByStatus(int id);
	
	void delete(int id);
	
	List<Announcement> fetchByStatusIs2(int status);
}
