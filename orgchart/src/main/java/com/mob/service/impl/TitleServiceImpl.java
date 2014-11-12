package com.mob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mob.model.Title;
import com.mob.repository.TitleRepository;
import com.mob.service.TitleService;

@Service
public class TitleServiceImpl implements TitleService {

	@Autowired
	private TitleRepository titleRepo;

	@Transactional
	public List<Title> getTitleName() {
		List<Title> titleName=titleRepo.getTitleName();
		return titleName;
	}

	

	
	
}
