CREATE TABLE words (
	id integer primary key,
	en text unique,
	eo text unique,
	exported integer not null default 0
);
CREATE TABLE phrases (
	id integer primary key,
	en text unique,
	eo text unique,
	exported integer not null default 0
);
CREATE TABLE facts (
	id integer primary key,
	q text unique,
	a text unique,
	exported integer not null default 0
);
CREATE TABLE log (
	start text primary key,
	actions text,
	thoughts text,
	finish text
);
