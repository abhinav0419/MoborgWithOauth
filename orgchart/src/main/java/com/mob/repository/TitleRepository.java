package com.mob.repository;

import java.util.List;

import javax.persistence.MappedSuperclass;

import org.springframework.data.jpa.repository.Query;

import com.mob.api.jpa.MobJpaRepository;
import com.mob.model.Title;

@MappedSuperclass
public interface TitleRepository extends MobJpaRepository<Title, Long>{

	@Query("select tn from Title tn")
	List<Title> getTitleName();
	

}
