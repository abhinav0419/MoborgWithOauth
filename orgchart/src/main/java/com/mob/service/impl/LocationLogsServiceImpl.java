package com.mob.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mob.model.LocationLogs;
import com.mob.model.User;
import com.mob.repository.LocationLogsRepository;
import com.mob.service.LocationLogsService;

@Service
public class LocationLogsServiceImpl implements LocationLogsService {

	@Autowired
	private LocationLogsRepository locationLogsRepo;

	@Override
	public void saveUserLocation(LocationLogs locationLogs) {
		locationLogsRepo.save(locationLogs);
	}

	@Transactional
	public LocationLogs geLocationLogs(User userId) {
		
		LocationLogs locationLogs = locationLogsRepo.getLocationLogs(userId);
		/*LocationLogs locationLogs;
	
		Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml"); 
 
        System.out.println(userId.getFullName());
        SessionFactory factory = cfg.buildSessionFactory();
        Session session = factory.openSession();
		Criteria criteria = session.createCriteria(LocationLogs.class);
		//Criterion criterion = Restrictions.eq("userId", userId);
		criteria.setMaxResults(1);
		//criteria.add(criterion);
		locationLogs = (LocationLogs) criteria.uniqueResult();*/
		return locationLogs;
	}
}
