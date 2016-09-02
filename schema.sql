DROP DATABASE IF EXISTS heroku_100ead766ade82c;


CREATE DATABASE heroku_100ead766ade82c
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE heroku_100ead766ade82c;


CREATE TABLE Albums
(
  name VARCHAR(50) UNIQUE PRIMARY KEY,
  title VARCHAR(100),
  date DATETIME,
  description VARCHAR(500),

  -- allow for sorting on date.
  INDEX(date)
)
ENGINE = InnoDB;

CREATE TABLE Photos
(
  album_name VARCHAR(50),
  filename VARCHAR(500),
  description VARCHAR(500),
  date DATETIME,

  FOREIGN KEY (album_name) REFERENCES Albums (name),
  INDEX (album_name, date)
)
ENGINE = InnoDB;


CREATE TABLE Users
(
  user_uuid VARCHAR(50) UNIQUE PRIMARY KEY,
  email_address VARCHAR(150) UNIQUE,

  display_name VARCHAR(100) UNIQUE,
  password VARCHAR(100),

  first_seen_date BIGINT,
  last_modified_date BIGINT,
  deleted BOOL DEFAULT false,

  INDEX(email_address, deleted),
  INDEX(user_uuid, deleted)
)
ENGINE = InnoDB;


