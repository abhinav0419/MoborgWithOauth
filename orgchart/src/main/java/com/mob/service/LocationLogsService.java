package com.mob.service;

import com.mob.model.LocationLogs;
import com.mob.model.User;

public interface LocationLogsService {

	public void saveUserLocation(LocationLogs locationLogs);
	
	public LocationLogs geLocationLogs(User userId);
}
