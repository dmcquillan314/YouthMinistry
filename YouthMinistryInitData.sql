-- -----------------------------
-- Test Values for Event repo
-- -----------------------------
insert into `YouthMinistry`.event (event_name, event_desc, start_time, end_time) 
	values ('test event 1', 'test event description 1', '2013-05-29 00:00:00', '2013-05-29 00:00:00');
insert into `YouthMinistry`.event (event_name, event_desc, start_time, end_time) 
	values ('test event 2', 'test event description 2', '2013-05-10 00:00:00', '2013-05-29 12:00:00');
insert into `YouthMinistry`.event (event_name, event_desc, start_time, end_time) 
	values ('test event 3', 'test event description 3', '2013-04-29 00:00:00', '2013-05-29 14:00:00');

-- -----------------------------
-- Data population for groups
-- -----------------------------
insert into `YouthMinistry`.group (group_name, group_desc)
	values ('Alter Servers', 'This is the alter servers group');
insert into `YouthMinistry`.group (group_name, group_desc)
	values ('Junior High Youth Group', 'This is the junior high youth group group');
insert into `YouthMinistry`.group (group_name, group_desc)
	values ('High School Youth Ministry', 'This is the high school youth ministry group');
insert into `YouthMinistry`.group (group_name, group_desc)
	values ('Young Adults', 'This is the young adults group');
insert into `YouthMinistry`.group (group_name, group_desc)
	values ('Catholic Charities', 'This is the catholic charities group');

-- -----------------------------
-- Data population for roles
-- -----------------------------
insert into `YouthMinistry`.role (role_name, role_desc)
	values ('admin', 'website administrator');

-- -----------------------------
-- Data population for users
-- -----------------------------
insert into `YouthMinistry`.users (username, password, first_name, last_name, updated) values ('dmcquillan', Password('test'), 'Dan', 'McQuillan', CURRENT_TIMESTAMP);
insert into `YouthMinistry`.users (username, password, first_name, last_name, updated) values ('gbelgard', Password('test'), 'Gregg', 'Belgard', CURRENT_TIMESTAMP);
insert into `YouthMinistry`.users (username, password, first_name, last_name, updated) values ('test', Password('test'), 'test', 'test', CURRENT_TIMESTAMP);