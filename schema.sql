create table words (
	id integer primary key,
	en text unique,
	eo text unique,
	exported integer not null default 0
);
create table phrases (
	id integer primary key,
	en text unique,
	eo text unique,
	exported integer not null default 0
);
create table facts (
	id integer primary key,
	q text unique,
	a text unique,
	exported integer not null default 0
);
create table log (
	start text primary key,
	actions text,
	thoughts text,
	finish text
);
