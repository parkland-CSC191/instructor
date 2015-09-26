DROP TABLE IF EXISTS `2012_choice`;
DROP TABLE IF EXISTS `2012_applicant`;

--
-- Table structure for table `2012_applicant`
--

CREATE TABLE `2012_applicant` (
  `applicant_id` mediumint(6) unsigned NOT NULL COMMENT 'Identifier for each applicant',
  `assigned_school` tinyint(2) unsigned NOT NULL COMMENT 'The school ID that was assigned to this applicant',
  `program` varchar(10) NOT NULL COMMENT 'Program for which this applicant is applying to',
  PRIMARY KEY (`applicant_id`),
  KEY `assigned_school` (`assigned_school`,`program`),
  CONSTRAINT `2012_applicant_ibfk_1` FOREIGN KEY (`assigned_school`, `program`) REFERENCES `2012_master` (`school_id`, `program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector table between Master and Choice';

--
-- Table structure for table `2012_choice`
--

CREATE TABLE `2012_choice` (
  `applicant_id` mediumint(6) unsigned NOT NULL COMMENT 'Foreign Key Applicant Identifier',
  `selection_number` tinyint(2) unsigned NOT NULL COMMENT 'Identifies which choice this was (first, second, third, etc)',
  `school_id` tinyint(2) unsigned NOT NULL COMMENT 'Foreign Key School ID',
  `program` varchar(10) NOT NULL DEFAULT 'REGULAR' COMMENT 'Program for which this applicant is applying to',
  `reason_unassigned` varchar(30) DEFAULT NULL COMMENT 'A possible reason why this particular choice was not assigned to the applicant',
  `proximity` varchar(1) DEFAULT NULL COMMENT 'If the school is in a proximity to the applicant, which proximity (A or B)',
  KEY `applicant_id` (`applicant_id`,`school_id`,`program`),
  KEY `school_id` (`school_id`,`program`),
  CONSTRAINT `2012_choice_ibfk_2` FOREIGN KEY (`applicant_id`) REFERENCES `2012_applicant` (`applicant_id`),
  CONSTRAINT `2012_choice_ibfk_1` FOREIGN KEY (`school_id`, `program`) REFERENCES `2012_master` (`school_id`, `program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the choices made by each applicant';

