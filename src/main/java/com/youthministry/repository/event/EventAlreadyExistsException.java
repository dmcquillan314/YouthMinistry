package com.youthministry.repository.event;

public class EventAlreadyExistsException extends Exception {
	public EventAlreadyExistsException(String eventName) {
		super("The event already exists '" + eventName + "' is already created.");
	}
}