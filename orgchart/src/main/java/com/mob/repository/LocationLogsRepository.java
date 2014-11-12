package com.mob.repository;

import javax.persistence.MappedSuperclass;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mob.api.jpa.MobJpaRepository;
import com.mob.model.LocationLogs;
import com.mob.model.User;

@MappedSuperclass
public interface LocationLogsRepository extends MobJpaRepository<LocationLogs, Long>{

	//@Query("select location from LocationLogs location where location.userId = :userId order by location.currentDate desc")
	@Query("select location from LocationLogs location where location.userId = :userId")
	LocationLogs getLocationLogs(@Param("userId") User userId);
	
}
