CREATE TABLE `m3_fsociety` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(255) DEFAULT NULL,
	`level` int(11) DEFAULT 0,
  	`currentexp` int(11) DEFAULT 0,
	`banktime` int(11) DEFAULT 0,
	`twittime` int(11) DEFAULT 0,
	`radiotime` int(11) DEFAULT 0,
	`poldatatime` int(11) DEFAULT 0,
	`gpstime` int(11) DEFAULT 0,

	PRIMARY KEY (`id`)
);