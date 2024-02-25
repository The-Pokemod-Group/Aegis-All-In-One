# create databases
# Give the user dbuser all privileges on the databases

CREATE DATABASE IF NOT EXISTS `golbat`;
GRANT ALL ON `golbat`.* TO 'dbuser'@'%';
CREATE DATABASE IF NOT EXISTS `dragonite`;
GRANT ALL ON `dragonite`.* TO 'dbuser'@'%';
CREATE DATABASE IF NOT EXISTS `koji`;
GRANT ALL ON `koji`.* TO 'dbuser'@'%';
CREATE DATABASE IF NOT EXISTS `reactmap`;
GRANT ALL ON `reactmap`.* TO 'dbuser'@'%';