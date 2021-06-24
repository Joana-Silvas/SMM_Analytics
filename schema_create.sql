CREATE TABLE IF NOT EXISTS `player` (
`player_id` VARCHAR(80) NOT NULL PRIMARY KEY,
`image` VARCHAR(120) NULL,
`flag` VARCHAR(3) NULL,
`name` VARCHAR(50) NULL
);


CREATE TABLE IF NOT EXISTS `clears` (
`catch` VARCHAR(30) NULL,
`clears_id` VARCHAR(20) NULL,
`player` VARCHAR(80) NULL
);
ALTER TABLE clears
ADD CONSTRAINT player_id FOREIGN KEY (player) REFERENCES player (player_id);


CREATE TABLE IF NOT EXISTS `plays` (
`catch` VARCHAR(30) NULL,
`play_id` VARCHAR(20) NULL,
`player` VARCHAR(80) NULL
);
ALTER TABLE plays
ADD CONSTRAINT player_id FOREIGN KEY (player_id) REFERENCES player (player_id);


CREATE TABLE IF NOT EXISTS `courses` (
`courses_id` VARCHAR(20) NOT NULL,
`difficulty` VARCHAR(30) NULL,
`gameStyle` VARCHAR(30) NULL,
`maker` VARCHAR(100) NULL,
`title` VARCHAR(100) NULL,
`thumbnail` VARCHAR(250) NULL,
`image` VARCHAR(250) NULL,
`creation` DATETIME NULL
);
ALTER TABLE courses
ADD CONSTRAINT player_id FOREIGN KEY (maker) REFERENCES player (player_id);


CREATE TABLE IF NOT EXISTS `courses_meta` (
`catch` VARCHAR(50) NULL,
`meta_id` VARCHAR(20) NOT NULL,
`firstClear` VARCHAR(100) NULL,
`tag` VARCHAR(50) NULL,
`stars` INT NULL,
`players` INT NULL,
`tweets` INT NULL,
`clears` INT NULL,
`attempts` INT NULL,
`clearRate` FLOAT NULL
);
ALTER TABLE courses_meta
ADD CONSTRAINT player_id FOREIGN KEY (players) REFERENCES player (player_id);
