package com.youthministry.controllers;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import com.youthministry.repository.event.CreateEventForm;
import com.youthministry.repository.event.Event;
import com.youthministry.repository.event.EventAlreadyExistsException;
import com.youthministry.repository.event.EventRepository;

@Controller
public class CreateEventController {

	private final EventRepository eventRepository;
	
	@Inject
	public CreateEventController(EventRepository eventRepository) {
		this.eventRepository = eventRepository;
	}
	
	@RequestMapping(value={"/CreateEvent","/createevent"}, method=RequestMethod.GET)
	public CreateEventForm createEventForm(WebRequest request) {
		return new CreateEventForm();
	}
	
	@RequestMapping(value={"/CreateEvent","/createevent"}, method=RequestMethod.POST)
	public String createEvent(@Valid CreateEventForm form, BindingResult formBinding, WebRequest request) {
		if(formBinding.hasErrors()) {
			return "CreateEvent";
		}
		try {
			createEvent(form, formBinding);
		} catch (EventAlreadyExistsException e) {
			formBinding.rejectValue("eventname", "event.duplicateEventId", "event id already in use");
		}
		return "CreateEvent";
	}
	
	// Internal helpers
	private void createEvent(CreateEventForm form, BindingResult formBinding) throws EventAlreadyExistsException {
		Event event = new Event(
					form.getEventName(),
					form.getEventDescription(),
					form.getStartTime(),
					form.getEndTime()
				);
		eventRepository.createEvent(event);
	}
}
