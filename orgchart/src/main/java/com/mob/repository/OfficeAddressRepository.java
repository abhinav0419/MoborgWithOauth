package com.mob.repository;

import java.util.List;

import javax.persistence.MappedSuperclass;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mob.api.jpa.MobJpaRepository;
import com.mob.model.OfficeAddress;

@MappedSuperclass
public interface OfficeAddressRepository extends MobJpaRepository<OfficeAddress, Long>{
    
	@Query("select na from OfficeAddress na")
	List<OfficeAddress> getOfficeName();
    
	@Query("select us.officeLocationId from User us where us.userId=:userId")
	OfficeAddress getofficeAddress(@Param("userId") long userId);

}
