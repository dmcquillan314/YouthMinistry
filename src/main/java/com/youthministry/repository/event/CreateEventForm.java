package com.youthministry.repository.event;

import org.apache.commons.lang.NumberUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateTime;

public class CreateEventForm {
	@NotEmpty(message="You must enter an event name.")
	private String eventName;
	
	@NotEmpty(message="You must enter an event description.")
	private String eventDescription;
	
	private String startTime;
	
	private String endTime;

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
