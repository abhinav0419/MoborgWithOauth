package com.mob.repository;

import java.util.List;

import javax.persistence.MappedSuperclass;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.mob.api.jpa.MobJpaRepository;
import com.mob.model.OfficeAddress;
import com.mob.model.Title;
import com.mob.model.User;

@MappedSuperclass
public interface UserRepository extends MobJpaRepository<User, Long> {

	@Query("select us from User us where us.emailId = :emailId")
	User getUserByEmailId(@Param("emailId") String emailId);

	@Query("select officeadd from OfficeAddress officeadd where officeadd.addressLine1 = :addressLine1")
	OfficeAddress getOfficeAddressId(@Param("addressLine1") String addressLine1);

	@Query("select title from Title title where title.titleName = :titleName order by title.titleName")
	Title getTitleId(@Param("titleName") String titleName);

	@Query("select user from User user where user.fullName = :fullName order by user.fullName")
	User getResourceManager(@Param("fullName") String fullName);
    
	@Query("select mn from User mn where mn.isResourceManager=true")
	List<User> getAllResourceManager();

    @Query("select us.titleId from User us where us.userId = :userId ")
	Title getCurrentTitle(@Param("userId") long userId);
   
    @Modifying
    @Transactional
    @Query("update User us set us.latitude = :latitude, us.longitude = :longitude where us.userId = :userId ")
    void updatelocation(@Param("latitude") Double latitude,@Param("longitude") Double longitude,@Param("userId") Long userId);


	@Query("select user from User user where user.emailId = :userEmailId")
	User isUserAvail(@Param("userEmailId") String userEmailId);

	@Query("select user from User user" 
			+ " where user.emailId = :userEmailId")
	User loadOfficeLocation(@Param("userEmailId") String userEmailId);
//	@Query("select user from User user" 
//			+ "inner join OfficeAddress office\n"
//			+ " where user.emailId = :userEmailId")
//	User loadOfficeLocation(@Param("userEmailId") String userEmailId);
	
//	@Query("select us from User")
//	List<User> getListOfUser();

	
	//mob organization chart queries 
	@Query("SELECT us FROM User us WHERE us.resourceManagerId = :userId")
	List<User> getSubRelationship(@Param("userId") Long userId);
	
//	@Query("SELECT us FROM User us WHERE us.resourceManagerId = :resourceManagerId AND us.emailId = :emailId")
	@Query("SELECT us FROM User us WHERE us.userId = :resourceManagerId")
	User getResourceManagerByUserId (@Param("resourceManagerId") Long resourceManagerId );
	
	@Query("SELECT us FROM User us INNER JOIN us.titleId tl WHERE tl.titleName = 'CEO'")
	User getCEO();


	@Query("SELECT us FROM User us WHERE (us.latitude BETWEEN :swlat AND :nelat) AND (us.longitude BETWEEN :swlng AND :nelng) ")
	List<User> getUserInCurrentBounds(@Param("nelat") Double nelat,@Param("swlng") Double swlng,@Param("swlat") Double swlat,@Param("nelng") Double nelng);
	@Query("SELECT us FROM User us where us.userId =:resourceManagerId ")
	User getManager(@Param("resourceManagerId") Long resourceManagerId);
 
	@Query("select user from User user where user.fullName = :fullName")
	User getUserId(@Param("fullName") String fullName);

	

	@Query("SELECT us FROM User us WHERE (us.latitude BETWEEN 7.510134333942949 AND 18.203836354526242) AND (us.longitude BETWEEN 65.89111305000006  AND 83.82080055000006)")
	List<User> getHardCodedUsers();
}
