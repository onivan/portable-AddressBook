CREATE TABLE GROUPS( 
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	NAME VARCHAR(50) NOT NULL,
	DESCRIPTION VARCHAR(255),
	IMAGE VARCHAR(255)
);

CREATE TABLE CONTACTS( 
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	FIRST_NAME VARCHAR(64) NOT NULL,
	LAST_NAME VARCHAR(64) NOT NULL,
	IMAGE VARCHAR(255)	
);

CREATE TABLE COUNTRY( 
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	NAME VARCHAR(64) NOT NULL,
	IMAGE VARCHAR(255)	
);

CREATE TABLE SERVICE( 
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	NAME VARCHAR(64) NOT NULL,
	DESCRIPTION VARCHAR(255),
	IMAGE VARCHAR(255)
);

CREATE TABLE ADDRESS(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	STREET VARCHAR(64) NOT NULL,
	NUMBER VARCHAR(64) NOT NULL,	
	CITY VARCHAR(64) NOT NULL,
	ID_COUNTRY INTEGER NOT NULL,
	FOREIGN KEY(ID_COUNTRY) REFERENCES COUNTRY(ID)
);

CREATE TABLE VIRTUAL_ADDRESS(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	IDENTIFIER VARCHAR(64) NOT NULL,
	WEBSITE VARCHAR(64) NOT NULL,	
	ID_SERVICE INTEGER NOT NULL,
	FOREIGN KEY(ID_SERVICE) REFERENCES SERVICE(ID)
);

CREATE TABLE PHONE( 
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	HOUSE_PHONE VARCHAR(64) NOT NULL,
	MOBILE_PHONE VARCHAR(64) NOT NULL,
	WORK_PHONE VARCHAR(64) NOT NULL
);

CREATE TABLE GROUP_CONTACTS(
	ID_GROUP INTEGER NOT NULL,
	ID_CONTACT INTEGER NOT NULL,
	FOREIGN KEY(ID_GROUP) REFERENCES GROUPS(ID),
	FOREIGN KEY(ID_CONTACT) REFERENCES CONTACTS(ID),
	PRIMARY KEY(ID_GROUP,ID_CONTACT)
);

CREATE TABLE CONTACT_ADDRESSES(
	ID_CONTACT INTEGER NOT NULL,
	ID_ADDRESS INTEGER NOT NULL,
	FOREIGN KEY(ID_CONTACT) REFERENCES CONTACT(ID),
	FOREIGN KEY(ID_ADDRESS) REFERENCES ADDRESS(ID),
	PRIMARY KEY(ID_CONTACT,ID_ADDRESS)
);

CREATE TABLE CONTACT_VIRTUAL_ADDRESSES(
	ID_CONTACT INTEGER NOT NULL,
	ID_VIRTUAL_ADDRESS INTEGER NOT NULL,
	FOREIGN KEY(ID_CONTACT) REFERENCES CONTACT(ID),
	FOREIGN KEY(ID_VIRTUAL_ADDRESS) REFERENCES VIRTUAL_ADDRESS(ID),
	PRIMARY KEY(ID_CONTACT,ID_VIRTUAL_ADDRESS)
);

CREATE TABLE CONTACT_PHONES(
	ID_CONTACT INTEGER NOT NULL,
	ID_PHONE INTEGER NOT NULL,
	FOREIGN KEY(ID_CONTACT) REFERENCES CONTACT(ID),
	FOREIGN KEY(ID_PHONE) REFERENCES PHONE(ID),
	PRIMARY KEY(ID_CONTACT,ID_PHONE)
);