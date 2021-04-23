CREATE TABLE `hasan_stashouse` (
	`identity` VARCHAR(150) NOT NULL COLLATE 'utf8mb4',
	`houseid` VARCHAR(150) NOT NULL COLLATE 'utf8mb4',
	`price` VARCHAR(150) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_bin'
)
COLLATE='utf8mb4'
ENGINE=InnoDB
;