package com.mob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mob.model.OfficeAddress;
import com.mob.model.Title;
import com.mob.model.User;
import com.mob.repository.UserRepository;
import com.mob.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Transactional
	@Override
	public void saveUser(User user) {
		userRepository.save((User) user);
	}

	@Transactional
	@Override
	public User getUserByEmailId(String emailId) {
		User user = userRepository.getUserByEmailId(emailId);
		return user;
	}

	@Transactional
	@Override
	public OfficeAddress getOfficeAddressId(String addressLine1) {
		OfficeAddress officeAddress = userRepository.getOfficeAddressId(addressLine1);
		return officeAddress;
	}

	@Transactional
	@Override
	public Title getTitleId(String titleId) {
		Title title = userRepository.getTitleId(titleId);
		return title;
	}

	@Transactional
	@Override
	public User getResourceManager(String fullName) {
		User user = userRepository.getResourceManager(fullName);
		return user;
	}

	@Transactional
	@Override
	public boolean isUserAvailable(User user) {
		User userData = userRepository.isUserAvail(user.getEmailId());
		boolean flag = false;
		if (userData != null) {
			return true;
		} else {
			return flag;
		}
	}

	@Transactional
	@Override
	public List<User> getAllResourceManager() {
		List<User> managerList = userRepository.getAllResourceManager();
		return managerList;
	}
	
	@Transactional
	@Override
	public User getUserById(long userId) {
		User user = userRepository.findOne(userId);
		return user;
	}

	@Transactional
	@Override
	public User loadLocation(User user) {
		User userObj = userRepository.loadOfficeLocation(user.getEmailId());
		return userObj;
	}

	@Transactional
	@Override
	public List<User> getSubRelationship(Long userId) {
		List<User> users = userRepository.getSubRelationship(userId);
		return users;
	}

	@Transactional
	@Override
	public User getResourceManagerByUserId(Long resourceManagerId) {
		User resourceManager = userRepository.getResourceManagerByUserId(resourceManagerId);
		return resourceManager;
	}

	@Transactional
	@Override
	public User getCEO() {
		User user = userRepository.getCEO();
		return user;
	}

	@Transactional
	@Override
	public List<User> getListOfUser() {
		List<User> listOfUsers = userRepository.findAll();
		return listOfUsers;
	}

	@Transactional
	@Override
	public List<User> getUserInCurrentBounds(Double nelat, Double swlng,
			Double swlat, Double nelng) {
		System.out.println("$$$$$$$$$$$$$$$$$ "+ nelat + swlng + swlat + nelng);
		List<User> usersInRange = userRepository.getUserInCurrentBounds(nelat, swlng, swlat, nelng);
		return usersInRange;
	}

	@Transactional
	@Override
	public List<User> getHardCodedUsers() {
		List<User> usersInRange = userRepository.getHardCodedUsers();
		return usersInRange;
	}
	@Transactional
	@Override
	public Title getCurrentTitle(long userId) {
		Title currenTitle=userRepository.getCurrentTitle(userId);
		return currenTitle;
	}


	@Transactional
	@Override
	public User getManager(Long resourceManagerId) {
		User manager=userRepository.getManager(resourceManagerId);
		return manager;
	}

	@Transactional
	@Override
	public List<User> getAllUsers() {
		List<User> names=
		userRepository.findAll();
		return names;
	}
	@Transactional
	@Override
	public User getUserId(String fullName) {

		User user = userRepository.getUserId(fullName);
		return user;
	}

	@Transactional
	@Override
	public boolean updateLocation(Double latitude, Double longitude,User user) {
		userRepository.updatelocation(latitude,longitude,user.getUserId());
		return false;
	}
}
