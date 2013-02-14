package com.youthministry.repository.event;

import java.util.List;

public interface EventRepository {
	void createEvent(Event event) throws EventAlreadyExistsException;
	
	Event findEventByName(String name);

	List<Event> getAllEvents();
}