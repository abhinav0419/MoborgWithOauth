package com.mob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mob.model.OfficeAddress;
import com.mob.repository.OfficeAddressRepository;
import com.mob.service.OfficeAddressService;

@Service
public class OfficeAddressServiceImpl implements OfficeAddressService {

	@Autowired
	private OfficeAddressRepository officeAddressRepo;

	@Transactional
	public List<OfficeAddress> getofficeName() {
		List<OfficeAddress> officeList=officeAddressRepo.getOfficeName();
		return officeList;
	}

	@Transactional
	public OfficeAddress getofficeAddress(long userId) {
		OfficeAddress officeName=officeAddressRepo.getofficeAddress(userId);
		return officeName;
	}
	
}
