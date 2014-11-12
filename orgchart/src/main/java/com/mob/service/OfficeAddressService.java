package com.mob.service;

import java.util.List;

import com.mob.model.OfficeAddress;

public interface OfficeAddressService {

	List<OfficeAddress> getofficeName();

	OfficeAddress getofficeAddress(long userId);

}
