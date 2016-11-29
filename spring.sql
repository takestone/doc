/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.0.22-community-nt : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `test`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL auto_increment,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registerTime` datetime NOT NULL,
  `roleId` int(11) default NULL,
  `organizationId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_gex1lmaqpg0ir5g1f5eftyaa1` (`username`),
  KEY `IDX_account_roleId` (`roleId`),
  KEY `IDX_account_organizationId` (`organizationId`),
  KEY `FK_account_role` (`roleId`),
  KEY `FK_account_organization` (`organizationId`),
  CONSTRAINT `FK_account_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_account_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `account` */

insert  into `account`(`id`,`version`,`enable`,`name`,`email`,`username`,`password`,`registerTime`,`roleId`,`organizationId`) values (1,1,1,'MissWhen...','liukemng@sina.com','chenli','31587ee7f1d7d25e44777fed93a785e5','2014-04-02 23:26:40',1,1),(2,0,0,'AAA','123@123.com','AAAA','562363ED4A17A4894D4162A0E64DB7C4','2014-04-03 14:38:38',NULL,NULL),(3,0,0,'WWWWW','123@123.com','FFFFFF','CFBDA3E623045D2C2130D653909397E0','2014-04-03 14:39:00',NULL,NULL),(4,0,0,'TTTT','123@123.com','SSSDD','50F86F5725447FE015467D74A7D7DB11','2014-04-03 14:39:18',NULL,NULL),(5,0,0,'OOOO','123@123.com','LLLL','1F5297672E6BF686ED906F69DBD9B509','2014-04-03 14:39:36',NULL,NULL),(6,0,0,'CCCCC','123@123.com','RRRR','DDF8448BC7A6BEC245B7293CE4EBDA74','2014-04-03 14:40:16',NULL,NULL),(7,0,0,'NNNN','123@123.com','MMMM','A9C51ACEFD41BB51F1A7546B358BF1BD','2014-04-03 14:40:32',NULL,NULL),(8,0,0,'ZZZZZ','123@123.com','TTTTTT','8B5CC63F5053E982AD5EB6A461F69209','2014-04-03 14:40:49',NULL,NULL),(9,0,0,'KKKKK','123@123.com','PPPPP','78EB5B2DDCC23A6E13A48AEF3B28C87D','2014-04-03 14:41:10',NULL,NULL),(10,0,0,'XXXXX','123@123.com','DDDF','AF8B0A62C9844F4B4E339230D85ECBE0','2014-04-03 14:41:49',NULL,NULL),(11,0,0,'RTYV','123@123.com','WWW','B04874C43B023CB87F753717D73C4D6D','2014-04-03 14:42:07',NULL,NULL);

/*Table structure for table `authority` */

DROP TABLE IF EXISTS `authority`;

CREATE TABLE `authority` (
  `id` int(11) NOT NULL auto_increment,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) default NULL,
  `url` varchar(255) NOT NULL,
  `matchUrl` varchar(255) NOT NULL,
  `itemIcon` varchar(255) default NULL,
  `parentId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_authority_parentId_authority` (`parentId`),
  CONSTRAINT `FK_authority_parentId_authority` FOREIGN KEY (`parentId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authority` */

insert  into `authority`(`id`,`version`,`enable`,`name`,`levelCode`,`position`,`theValue`,`url`,`matchUrl`,`itemIcon`,`parentId`) values (1,3,0,'欢迎使用','1',0,'1','/home','^/home$','icon-home',NULL),(2,2,0,'首页','1,2',0,'1','/home/index','/home/index','',1),(3,2,0,'系统设置','3',0,'2','/setting','^/setting$','icon-cogs',NULL),(4,4,0,'用户管理','3,4',0,'1','/account/list','^/account$','',3),(5,1,0,'用户列表','3,4,5',0,'1','/account/list','/account/list','',4),(6,2,0,'账户绑定','3,4,6',0,'2','/account/authorize','/account/authorize','',4),(7,1,0,'角色管理','3,7',0,'2','/role/list','^/role$','',3),(8,1,0,'角色列表','3,7,8',0,'1','/role/list','/role/list','',7),(9,1,0,'权限绑定','3,7,9',0,'2','/role/bind','/role/bind','',7),(10,1,0,'权限管理','3,10',0,'3','/authority/chain','^/authority$','',3),(11,1,0,'权限添加','3,10,11',0,'1','/authority/add','/authority/add','',10),(12,1,0,'权限编辑','3,10,12',0,'2','/authority/edit','/authority/edit','',10),(13,1,0,'权限删除','3,10,13',0,'3','/authority/delete','/authority/delete','',10),(14,1,0,'组织机构管理','3,14',0,'4','/organization/chain','^/organization$','',3),(15,1,0,'组织机构树','3,14,15',0,'1','/organization/chain','/organization/chain','',14),(16,1,0,'组织机构添加','3,14,16',0,'2','/organization/add','/organization/add','',14),(17,1,0,'组织机构编辑','3,14,17',0,'3','/organization/edit','/organization/edit','',14),(18,1,0,'组织机构删除','3,14,18',0,'4','/organization/delete','/organization/delete','',14),(19,1,0,'权限树','3,10,19',0,'4','/authority/chain','/authority/chain','',10),(21,1,0,'微信管理','21',0,'3','/weixinsend','^/weixinsend$','icon-comments',NULL),(22,1,0,'创建菜单','21,22',0,'1','/weixinsend/createmenu','/weixinsend/createmenu','',21),(23,4,0,'查询菜单','21,23',0,'2','/weixinsend/getmenu','/weixinsend/getmenu','',21),(24,2,0,'订单管理','24',0,'1','/order','^/order$','icon-cart',NULL),(25,2,0,'订单列表','24,25',0,'2','/order/list','^/order/list$','icon-list',24);

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(11) NOT NULL auto_increment,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) default NULL,
  `parentId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_organization_parentId_organization` (`parentId`),
  CONSTRAINT `FK_organization_parentId_organization` FOREIGN KEY (`parentId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`id`,`version`,`enable`,`name`,`levelCode`,`position`,`theValue`,`parentId`) values (1,1,0,'总机构','1',0,'1',NULL),(2,1,0,'分机构1-1','1,2',0,'1',1),(3,1,0,'分机构','1,3',0,'',1),(4,1,0,'总机构2','4',0,'2',NULL),(5,2,0,'组织机构2-1','4,5',0,'1',4),(6,1,0,'总机构1','6',1,'',NULL),(7,2,0,'分机构1-1','6,7',0,'',6);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `version` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`version`,`name`,`enable`) values (1,5,'系统管理员',1);

/*Table structure for table `role_authority` */

DROP TABLE IF EXISTS `role_authority`;

CREATE TABLE `role_authority` (
  `roleId` int(11) NOT NULL,
  `authorityId` int(11) NOT NULL,
  KEY `FK_sccf4fx8omb6jlsy2ra75xxer` (`authorityId`),
  KEY `FK_fftr98ew5vtbdpcfetn7xd715` (`roleId`),
  CONSTRAINT `FK_fftr98ew5vtbdpcfetn7xd715` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sccf4fx8omb6jlsy2ra75xxer` FOREIGN KEY (`authorityId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_authority` */

insert  into `role_authority`(`roleId`,`authorityId`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,19),(1,14),(1,15),(1,16),(1,17),(1,18),(1,21),(1,22),(1,23),(1,24),(1,25);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
