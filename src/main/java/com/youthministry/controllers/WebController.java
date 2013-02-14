package com.youthministry.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.youthministry.repository.event.EventRepository;

@Controller
public class WebController {

	private EventRepository eventRepository;
	
	@Inject
	public WebController(EventRepository eventRepository) {
		this.eventRepository = eventRepository;
	}
	
	@RequestMapping(value={"/AlterServers", "/alterservers"})
	public ModelAndView signin(HttpServletRequest request, Model model) {
		System.out.println(request.getServletPath());
	    Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("events", eventRepository.getAllEvents());
		return new ModelAndView("AlterServers", "model", myModel);
	}
	
	@RequestMapping(value={"/CatholicCharities", "/catholiccharities"})
	public ModelAndView cc(HttpServletRequest request, Model model) {
		System.out.println(request.getServletPath());
	    Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("events", eventRepository.getAllEvents());
		return new ModelAndView("CatholicCharities", "model", myModel);
	}

	@RequestMapping(value={"/HighSchoolYouthMinistry","/highschoolyouthministry"})
	public ModelAndView hsym(HttpServletRequest request, Model model) {
		System.out.println(request.getServletPath());
	    Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("events", eventRepository.getAllEvents());
		return new ModelAndView("HighSchoolYouthMinistry", "model", myModel);
	}

	@RequestMapping(value={"/JuniorHighYouthGroup", "/juniorhighyouthgroup"})
	public ModelAndView jhyg(HttpServletRequest request, Model model) {
		System.out.println(request.getServletPath());
	    Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("events", eventRepository.getAllEvents());
		return new ModelAndView("JuniorHighYouthGroup", "model", myModel);
	}

	@RequestMapping(value={"/YoungAdults", "/youngadults"})
	public ModelAndView ya(HttpServletRequest request, Model model) {
		System.out.println(request.getServletPath());
	    Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("events", eventRepository.getAllEvents());
		return new ModelAndView("YoungAdults", "model", myModel);
	}

}
