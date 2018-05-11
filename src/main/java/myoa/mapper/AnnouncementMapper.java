package myoa.mapper;

import java.util.List;

import myoa.entity.Announcement;

public interface AnnouncementMapper {

	void addAnnouncement(Announcement a);
	
	void updateAnnouncement(Announcement announcement);
	
	List<Announcement> getAllAnnouncement();
	
	Announcement fetchByStatus(int id);
	
	void delete(int id);
	
	List<Announcement> fetchByStatusIs2(int status);
}
