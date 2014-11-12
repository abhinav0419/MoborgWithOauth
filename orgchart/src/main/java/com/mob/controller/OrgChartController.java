package com.mob.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mob.model.User;
import com.mob.service.UserService;

@Controller
public class OrgChartController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/moborgchart", method = RequestMethod.GET)
	public ModelAndView getMobOrgChart(
			HttpServletRequest request, HttpSession session,
			Map<String, Object> model) {

		ModelAndView modelAndView = new ModelAndView("moborgchart");

		List<User> names = userService.getAllUsers();
		model.put("names", names);

		List<String> fullnames = new ArrayList<String>();

		for (User name : names) {
			fullnames.add(name.getFullName());
		}
		/*System.out.println((Long) session.getAttribute("loggedUserId"));*/
		User user = userService.getUserById((Long) session.getAttribute("loggedUserId"));
		if (!(user == null)) {
			if (user.isActive() == true) {
				User resourceManager = userService
						.getResourceManagerByUserId(user.getResourceManagerId());
				modelAndView.addObject("user", user);

				List<User> users = userService.getSubRelationship(user
						.getUserId());

				if (resourceManager == null) {
					request.setAttribute("isCurrentUserCeo", true);
				} else {
					if (resourceManager.getUserId() == user.getUserId()) {
						request.setAttribute("isCurrentUserCeo", true);
						users.remove(user);
					} else {
						request.setAttribute("isCurrentUserCeo", false);
					}
				}
				model.put("fullnames", fullnames);
				modelAndView.addObject("resourceManager", resourceManager);
				modelAndView.addObject("users", users);
			}
			return modelAndView;

		} else {
			return new ModelAndView("moborgchart?error");
		}

	}

	@RequestMapping("/nup")
	public String newUsPro() {
		return "newuserprofile";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchController", method = RequestMethod.GET)
	public void jsonresponse(HttpServletResponse response,
			Map<String, Object> model, Map<Integer, String> mapId,
			HttpServletRequest request, @RequestParam("term") String term,
			HttpSession session) {
		System.out.println("Inside the orgsearch bar");
		List<User> names = userService.getAllUsers();
		List<String> full = new ArrayList<String>();
		JSONObject jObject = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();
			for (User user : names) {
				full.add(user.getFullName());
				JSONObject nameJson = new JSONObject();
				System.out.println(term + " user name" + user.getFullName());
				if (user.getFullName().toLowerCase()
						.contains(term.toLowerCase())) {
					System.out.println("inside condition for term");
					nameJson.put("label", user.getFullName());
					nameJson.put("value", user.getUserId());
					jArray.add(nameJson);
				}
			}

			jObject.put("nameList", jArray);
			response.setContentType("text/json");
			response.getWriter().write(jObject.toString());
			System.out.println(jObject + " for search ");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}