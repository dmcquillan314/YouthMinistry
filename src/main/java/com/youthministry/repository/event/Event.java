package com.youthministry.repository.event;

public class Event {
	private String eventName;
	private String eventDescription;
	private String startTime;
	private String endTime;
	//TODO: implement group feature of event instance
	
	public Event(String eventName, String eventDescription, String startTime, String endTime) {
		this.eventName = eventName;
		this.eventDescription = eventDescription;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	public String getEventName() {
		return eventName;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public String getStartTime() {
		return startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	
	public String toString() {
		return "Event name: " + eventName + "\n" +
			   "Event description: " + eventDescription + "\n" +
			   "Start Time: " + startTime + "\n" +
			   "End Time: " + endTime + "\n";
			   
	}
}