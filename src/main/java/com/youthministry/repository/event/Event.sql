create table Event (id identity,
						eventname varchar unique,
						eventdescription varchar not null,
						starttime varchar, 
						endtime varchar,
						primary key (id));
