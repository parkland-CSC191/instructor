DROP TABLE IF EXISTS `2012_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `2012_master` (
  `school_id` tinyint(2) unsigned NOT NULL COMMENT 'School numeric identifier',
  `name` varchar(30) NOT NULL COMMENT 'Name of the school',
  `program` varchar(10) NOT NULL COMMENT 'Programs like SPED, ESL',
  `total_seats` tinyint(2) unsigned NOT NULL COMMENT 'Total capacity of seats',
  `assigned_seats` tinyint(2) unsigned NOT NULL COMMENT 'Number of seats that have been assigned',
  `available_seats` tinyint(2) unsigned NOT NULL COMMENT 'Left overs - seats still available',
  PRIMARY KEY (`school_id`,`program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Master information for each school';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `2012_master`
--

LOCK TABLES `2012_master` WRITE;
/*!40000 ALTER TABLE `2012_master` DISABLE KEYS */;
INSERT INTO `2012_master` VALUES (0, 'UNKNOWN', '', 0,0,0),(9,'BA','RE',62,62,0),(9,'BA','SP',7,3,4),(10,'BO','RE',85,85,0),(10,'BO','SP',7,6,1),(11,'CB','RE',62,62,0),(11,'CB','SP',7,8,0),(12,'ST','ESL',10,10,0),(12,'ST','RE',51,48,3),(12,'ST','SP',8,7,1),(13,'DH','RE',62,49,13),(13,'DH','SP',7,4,3),(14,'GH','BL',23,25,0),(14,'GH','ESL',10,8,2),(14,'GH','RE',48,47,1),(14,'GH','SP',11,12,0),(15,'KW','RE',62,53,9),(15,'KW','SP',7,4,3),(16,'RO','BL',20,0,20),(16,'RO','RE',62,62,0),(16,'RO','SP',7,4,3),(17,'SS','RE',64,60,4),(17,'SS','SP',5,2,3),(18,'WA','RE',63,63,0),(18,'WA','SP',6,4,2),(19,'WV','ESL',15,15,0),(19,'WV','RE',49,49,0),(19,'WV','SP',5,3,2);
/*!40000 ALTER TABLE `2012_master` ENABLE KEYS */;
UNLOCK TABLES;
