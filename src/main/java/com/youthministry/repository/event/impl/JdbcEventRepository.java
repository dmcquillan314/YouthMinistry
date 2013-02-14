package com.youthministry.repository.event.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.NumberUtils;
import org.joda.time.DateTime;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.youthministry.repository.event.Event;
import com.youthministry.repository.event.EventAlreadyExistsException;
import com.youthministry.repository.event.EventRepository;

@Repository
public class JdbcEventRepository implements EventRepository {

	private final JdbcTemplate jdbcTemplate;

	@Inject 
	public JdbcEventRepository(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Transactional
	public void createEvent(Event event) throws EventAlreadyExistsException {
		try {
			Event e = event;
			jdbcTemplate.update(
					"insert into Event (eventname, eventdescription, starttime, endtime) values (?,?,?,?)",
					event.getEventName(),
					event.getEventDescription(),
					event.getStartTime().toString(),
					event.getEndTime().toString());
		} catch(DuplicateKeyException e) {
			throw new EventAlreadyExistsException(event.getEventName());
		}

	}

	@Override
	public List<Event> getAllEvents() {
		List<Event> events = this.jdbcTemplate.query(
				"select eventname, eventdescription, starttime, endtime from Event",
				new RowMapper<Event>() {
					public Event mapRow(ResultSet rs, int rowNum) throws SQLException {
						Event e = null;
						e = new Event(rs.getString("eventname"),
								rs.getString("eventdescription"),
								rs.getString("starttime"),
								rs.getString("endtime"));
						return e;
					}
				});
		return events;
	}

	@Override
	public Event findEventByName(String name) {
		return jdbcTemplate.queryForObject("select eventname, eventdescription, starttime, endtime from Event " +
				"where eventname = ?", 
				new RowMapper<Event>() {
			public Event mapRow(ResultSet rs, int rowNum) throws SQLException {
				Event e = null;
				e = new Event(rs.getString("eventname"),
						rs.getString("eventdescription"),
						rs.getString("starttime"),
						rs.getString("endtime"));
				return e;
			}
		}, name);
	}

}