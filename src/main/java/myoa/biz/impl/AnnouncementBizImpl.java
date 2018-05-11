package myoa.biz.impl;

import java.util.List;

import org.apache.tiles.request.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.AnnouncementBiz;
import myoa.biz.EmployeeBiz;
import myoa.entity.Announcement;
import myoa.mapper.AnnouncementMapper;

@Service
public class AnnouncementBizImpl implements AnnouncementBiz{
	
	@Autowired
	private AnnouncementMapper announcementMapper;

	@Override
	public void addAnnouncement(Announcement a) {
		announcementMapper.addAnnouncement(a);
	}
	
	@Override
	public List<Announcement> getAllAnnouncement() {
		return announcementMapper.getAllAnnouncement();
	}

	@Override
	public Announcement fetchByStatus(int id) {
		return announcementMapper.fetchByStatus(id);
	}

	@Override
	public void delete(int id) {
		announcementMapper.delete(id);
	}

	@Override
	public void updateAnnouncement(Announcement announcement) {
	    announcementMapper.updateAnnouncement(announcement);
	}

	@Override
	public List<Announcement> fetchByStatusIs2(int status) {
		return announcementMapper.fetchByStatusIs2(status);
	}
	
	public static void main(String[] args) {
		AnnouncementBiz target = new ClassPathXmlApplicationContext("spring-beans.xml").getBean(AnnouncementBiz.class);
		System.out.println(target.fetchByStatus(1).getEmployee().getId());
	}

}
