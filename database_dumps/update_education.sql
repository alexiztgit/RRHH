DROP TABLE IF EXISTS `work_file_has_congress`;

DROP TABLE IF EXISTS `work_file_congress`;

CREATE TABLE `work_file_congress` (
  `work_file_id` int(11) NOT NULL,
  `congress_id` int(11) NOT NULL,  PRIMARY KEY (`work_file_id`,`congress_id`),
  KEY `fk_work_file_has_congress_congress1_idx` (`congress_id`),
  KEY `fk_work_file_has_congress_work_file_idx` (`work_file_id`),
  CONSTRAINT `fk_work_copy_has_congress_congress1` FOREIGN KEY (`congress_id`) REFERENCES `congress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_congress_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `work_file_copy_language`;
DROP TABLE IF EXISTS `work_file_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_language` (
  `work_file_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`language_id`),
  KEY `|` (`language_id`),
  KEY `fk_work_file_has_language_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_language_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_language_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `work_file_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_course` (
  `work_file_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`course_id`),
  KEY `fk_work_file_has_course_course1_idx` (`course_id`),
  KEY `fk_work_file_has_course_work_file__idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_course_work_file_` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `work_file_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_education` (
  `work_file_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`education_id`),
  KEY `fk_work_file_has_education_education1_idx` (`education_id`),
  KEY `fk_work_file_has_education_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_education_education1` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_education_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `work_file_it_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_it_course` (
  `work_file_id` int(11) NOT NULL,
  `it_course_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`it_course_id`),
  KEY `fk_work_file_has_it_course_it_course1_idx` (`it_course_id`),
  KEY `fk_work_file_has_it_course_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_it_course_it_course1` FOREIGN KEY (`it_course_id`) REFERENCES `it_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_it_course_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;