package com.mob.service;

import java.util.List;

import com.mob.model.OfficeAddress;
import com.mob.model.Title;
import com.mob.model.User;

public interface UserService {

	public void saveUser(User user);

	public List<User> getAllResourceManager();

	public User getUserById(long userId);

	public User getUserByEmailId(String emailId);

	public OfficeAddress getOfficeAddressId(String officeAddressId);

	public Title getTitleId(String titleId);

	public User getResourceManager(String fullName);

	public boolean isUserAvailable(User user);
	public boolean updateLocation(Double latitude, Double longitude,User user);


	List<User> getSubRelationship(Long userId);

//	public List<User> getSubRelationship(Long userId);



	User getResourceManagerByUserId(Long resourceManagerId);

    User getCEO();

//	public User getResourceManagerByUserId(Long resourceManagerId,
//			String emailId);

//	public User getCEO();


	public User loadLocation(User user);
	
	public List<User> getListOfUser();
	

	List<User> getUserInCurrentBounds(Double nelat, Double swlng, Double swlat, Double nelng);
	
	List<User> getHardCodedUsers();

	public Title getCurrentTitle(long userId);

	public User getManager(Long resourceManagerId);

	public List<User> getAllUsers();


	public User getUserId(String fullName);
	
}

