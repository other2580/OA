package myoa.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import myoa.biz.ActivityBiz;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ActivityMapperTest {

	@Autowired
	private ActivityBiz target;
	
	@Test
	public void testFindAll() {
		System.out.println(target.findAll().size());
	}

}
