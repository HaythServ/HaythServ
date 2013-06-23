CREATE TABLE IF NOT EXISTS `logins` (
  `id`          bigint(11) NOT NULL AUTO_INCREMENT,
  `username`  varchar(32) COLLATE latin1_general_ci NOT NULL,
  `password`  varchar(32) COLLATE latin1_general_ci NOT NULL,
  `privileges`  varchar(32) COLLATE latin1_general_ci NOT NULL,
) ENGINE=MyISAM DEFAULT CHARSET=ascii ;

CREATE TABLE IF NOT EXISTS `loginpms` (
  `id`          bigint(11) NOT NULL AUTO_INCREMENT,
  `getusername`  varchar(32) COLLATE latin1_general_ci NOT NULL,
  `sendusername`  varchar(32) COLLATE latin1_general_ci NOT NULL,
  `message`  varchar(256) COLLATE latin1_general_ci NOT NULL,
) ENGINE=MyISAM DEFAULT CHARSET=ascii ;