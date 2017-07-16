/*
Navicat MySQL Data Transfer

Source Server         : gandazhi
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-16 21:42:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 轮播图', '8', 'add_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 轮播图', '8', 'change_banner');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 轮播图', '8', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '8', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 章节', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 章节', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 章节', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 视频', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 视频', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 视频', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('42', 'Can add 课程资源', '12', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('43', 'Can change 课程资源', '12', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete 课程资源', '12', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 课程资源', '12', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 用户消息', '19', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 用户消息', '19', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 用户消息', '19', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户消息', '19', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(7) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11),
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_know` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', 'django', 'django入门啊', 'primary', '200', '10', '1', 'courses/2017/07/imooc_logo.jpg', '35', '2017-07-09 14:14:00.000000', '1', '后端开发', 'python', null, '', '');
INSERT INTO `courses_course` VALUES ('2', 'HTML+CSS基础课程', '本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础。', '简介：本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础。', 'primary', '540', '0', '0', 'courses/2017/07/htmlcss.jpg', '2', '2017-07-12 21:56:00.000000', '1', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('3', 'Java入门', 'Java', '本教程为Java入门第一季，欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本教程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!', 'primary', '120', '0', '0', 'courses/2017/07/java.jpg', '7', '2017-07-12 22:00:00.000000', '4', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('4', 'Python入门', 'python', 'Python教程基础分《Python入门》和《Python进阶》两门课程，本视频教程是Python第一门课程，是Python开发的入门教程，将介绍Python语言的特点和适用范围，Python基本的数据类型，条件判断和循环，函数，以及Python特有的切片和列表生成式。希望本python教程能够让您快速入门并编写简单的Python程序。', 'primary', '200', '0', '0', 'courses/2017/07/python.jpg', '5', '2017-07-12 22:02:00.000000', '1', '后端开发', 'python', null, '', '');
INSERT INTO `courses_course` VALUES ('5', 'Android攻城狮的第一门课（入门篇）', 'android', '本课程涵盖全部Android应用开发的基础，根据技能点的作用分为5个篇章，包括环境篇、控件篇、布局篇、组件篇和通用篇，本课程的目标就是“看得懂、学得会、做得出”，为后续的学习打下夯实的基础。', 'primary', '300', '0', '0', 'courses/2017/07/android.jpg', '3', '2017-07-12 22:03:00.000000', '2', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('6', 'JavaScript深入浅出', 'JavaScript', '这是一个帮助您系统学习JavaScript编程语言的课程，该课由浅入深的介绍JavaScript的语言特性，结合实际例子解析常见误区，启发你的思考，帮助学习者从入门到掌握，提升您的 JavaScript 技能。', 'primary', '120', '0', '0', 'courses/2017/07/javascript.jpg', '0', '2017-07-12 22:04:00.000000', '4', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('7', 'Ajax全接触', 'Ajax', '本课程通过一个简单的例子，由浅入深，循序渐进的介绍了Ajax的相关概念、原理、实现方式和应用方法，包含HTTP请求的概念、PHP的简单语法、JSON数据格式、Ajax的原生和jQuery实现、跨域等知识点。', 'primary', '100', '0', '0', 'courses/2017/07/ajax.jpg', '0', '2017-07-12 22:06:00.000000', '1', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('8', 'AngularJS实战', 'AngularJS', '欢迎大家与大漠穷秋老师一起学习AngularJS的基础教程，让我们一起通过实例学习并学会AngularJS！', 'primary', '210', '0', '0', 'courses/2017/07/AngularJS.jpg', '0', '2017-07-12 22:07:00.000000', '5', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('9', '手把手教你实现电商网站开发', '前端', '本课程主要介绍电商网站基本制作流程，通过电商网站分步的教学让大家了解和掌握电商网站制作的流程和注意事项。并且运用网站内学习过的知识点，更加快速的掌握整站的开发过程，增加开发经验。', 'middle', '500', '0', '0', 'courses/2017/07/前端.jpg', '0', '2017-07-12 22:08:00.000000', '1', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('10', 'Spring MVC起步', 'Spring', 'Spring MVC为我们提供了一个基于组件和松耦合的MVC实现框架。在使用Java中其它MVC框架多年之后，面对Spring MVC有一种相见恨晚的感觉。Spring MVC是如此的优雅，轻盈与简洁， 让人从其它框架的桎梏解脱出来。本课程将带你步入Spring MVC', 'high', '800', '0', '0', 'courses/2017/07/spring.jpg', '11', '2017-07-12 22:10:00.000000', '1', 'Java后端开发', 'java', '1', '1、MVC的思想精髓 2、Spring MVC的基本概念 3、如何利用Maven搭建Spring MVC开发环境 4、用Spring MVC实际开发一个功能模块', '本课程是JAVA高级课程，小伙伴们需要熟练掌握JAVA开发语言基础语法以及Spring IOC/DI的配置使用。对Spring不熟悉的童鞋慎入~~');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', 'spring相关jar', 'course/resource/2017/07/gradle-wrapper.jar', '2017-07-16 17:41:00.000000', '10');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一节', '2017-07-15 14:46:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '第二节', '2017-07-15 14:47:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('3', '第1章MVC简介', '2017-07-16 16:38:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('4', '第2章 Spring MVC中的基本概念', '2017-07-16 16:38:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('5', '第3章 配置Maven环境', '2017-07-16 16:39:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('6', '第4章 Spring MVC实操', '2017-07-16 16:39:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('7', '第5章 总结', '2017-07-16 16:39:00.000000', '10');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '1-1 Spring MVC起步课程简介', '2017-07-16 16:43:00.000000', '3', 'http://www.imooc.com/video/7237', '0');
INSERT INTO `courses_video` VALUES ('2', '1-2 前端控制器', '2017-07-16 16:44:00.000000', '3', 'http://www.imooc.com/video/7126', '0');
INSERT INTO `courses_video` VALUES ('3', '1-3 MVC概念', '2017-07-16 16:44:00.000000', '3', 'http://www.imooc.com/video/7165', '0');
INSERT INTO `courses_video` VALUES ('4', '2-1 Spring MVC的静态概念', '2017-07-16 16:45:00.000000', '4', 'http://www.imooc.com/video/7501', '0');
INSERT INTO `courses_video` VALUES ('5', '2-2 Spring MVC的动态概念', '2017-07-16 16:48:00.000000', '4', 'http://www.imooc.com/video/7530', '0');
INSERT INTO `courses_video` VALUES ('6', '3-1 Maven介绍', '2017-07-16 16:49:00.000000', '5', 'http://www.imooc.com/video/7417', '0');
INSERT INTO `courses_video` VALUES ('7', '3-2 Maven的安装', '2017-07-16 16:49:00.000000', '5', 'http://www.imooc.com/video/7418', '0');
INSERT INTO `courses_video` VALUES ('8', '3-3 Maven的配置', '2017-07-16 16:49:00.000000', '5', 'http://www.imooc.com/video/7419', '0');
INSERT INTO `courses_video` VALUES ('9', '3-4 用Maven创建项目', '2017-07-16 16:50:00.000000', '5', 'http://www.imooc.com/video/7531', '0');
INSERT INTO `courses_video` VALUES ('10', '3-5 Hello Spring MVC', '2017-07-16 16:50:00.000000', '5', 'http://www.imooc.com/video/7533', '0');
INSERT INTO `courses_video` VALUES ('11', '4-1 从配置文件开始', '2017-07-16 16:51:00.000000', '6', 'http://www.imooc.com/video/7681', '0');
INSERT INTO `courses_video` VALUES ('12', '4-2 Controller-基础代码', '2017-07-16 16:51:00.000000', '6', 'http://www.imooc.com/video/7682', '0');
INSERT INTO `courses_video` VALUES ('13', '4-3 Controller-现代方式', '2017-07-16 16:52:00.000000', '6', 'http://www.imooc.com/video/7683', '0');
INSERT INTO `courses_video` VALUES ('14', '4-4 Controller-传统方式', '2017-07-16 16:52:00.000000', '6', 'http://www.imooc.com/video/7684', '0');
INSERT INTO `courses_video` VALUES ('15', '4-5 Binding', '2017-07-16 16:53:00.000000', '6', 'http://www.imooc.com/video/8358', '0');
INSERT INTO `courses_video` VALUES ('16', '4-6 FileUpload--单文件上传', '2017-07-16 16:53:00.000000', '6', 'http://www.imooc.com/video/8413', '0');
INSERT INTO `courses_video` VALUES ('17', '4-7 JSON（上）', '2017-07-16 16:53:00.000000', '6', 'http://www.imooc.com/video/8602', '0');
INSERT INTO `courses_video` VALUES ('18', '4-8 JSON（中）', '2017-07-16 16:54:00.000000', '6', 'http://www.imooc.com/video/8595', '0');
INSERT INTO `courses_video` VALUES ('19', '4-9 JSON（下）', '2017-07-16 16:54:00.000000', '6', 'http://www.imooc.com/video/8655', '0');
INSERT INTO `courses_video` VALUES ('20', '总结', '2017-07-16 16:55:00.000000', '7', 'http://www.imooc.com/video/8656', '0');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-07-06 20:56:36.640412');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-07-06 20:56:38.311951');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-07-06 20:56:43.829293');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-07-06 20:56:44.755053');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-07-06 20:56:44.825171');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-07-06 20:56:44.888086');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-07-06 20:56:44.953207');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-07-06 20:56:45.000795');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-07-06 20:56:45.066573');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2017-07-06 20:56:51.598210');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2017-07-06 20:56:54.121146');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2017-07-06 20:56:54.266225');
INSERT INTO `django_migrations` VALUES ('13', 'captcha', '0001_initial', '2017-07-06 20:56:54.823105');
INSERT INTO `django_migrations` VALUES ('14', 'courses', '0001_initial', '2017-07-06 20:56:59.511873');
INSERT INTO `django_migrations` VALUES ('15', 'courses', '0002_auto_20170624_1517', '2017-07-06 20:56:59.821666');
INSERT INTO `django_migrations` VALUES ('16', 'courses', '0003_auto_20170624_1518', '2017-07-06 20:57:01.050623');
INSERT INTO `django_migrations` VALUES ('17', 'operation', '0001_initial', '2017-07-06 20:57:10.521483');
INSERT INTO `django_migrations` VALUES ('20', 'users', '0002_banner_emailverifyrecord', '2017-07-06 21:01:34.378361');
INSERT INTO `django_migrations` VALUES ('21', 'users', '0003_auto_20170624_1517', '2017-07-06 21:01:34.670252');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2017-07-06 21:12:25.018932');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0001_initial', '2017-07-06 21:12:30.736945');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0002_log', '2017-07-06 21:12:33.381822');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0003_auto_20160715_0100', '2017-07-06 21:12:34.688108');
INSERT INTO `django_migrations` VALUES ('26', 'organization', '0001_initial', '2017-07-06 21:24:16.005400');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0002_courseorg_category', '2017-07-06 21:36:51.842010');
INSERT INTO `django_migrations` VALUES ('28', 'organization', '0002_auto_20170626_1112', '2017-07-08 09:58:35.213385');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0003_merge', '2017-07-08 09:58:35.300960');
INSERT INTO `django_migrations` VALUES ('30', 'organization', '0004_auto_20170708_1003', '2017-07-08 10:03:37.436217');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0004_course_course_org', '2017-07-09 14:20:00.552211');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0005_teacher_image', '2017-07-10 21:45:50.053822');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0005_course_category', '2017-07-15 14:56:44.308260');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0006_course_tag', '2017-07-15 15:52:46.133040');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0007_video_url', '2017-07-16 16:37:23.907559');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0008_video_learn_time', '2017-07-16 17:36:13.707188');
INSERT INTO `django_migrations` VALUES ('37', 'organization', '0006_remove_courseorg_course_nums', '2017-07-16 21:27:24.968729');
INSERT INTO `django_migrations` VALUES ('38', 'organization', '0007_courseorg_course_nums', '2017-07-16 21:27:25.985760');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0009_course_teacher', '2017-07-16 21:27:28.688365');
INSERT INTO `django_migrations` VALUES ('40', 'courses', '0010_auto_20170716_2136', '2017-07-16 21:36:26.649116');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('few1ctu1hw82o43rxwnej20pzmfaa96n', 'ZjlhMmIwYjMzM2M1OTcxZWZlZTUyNmZiZGNkOGU1YWM4MzdlYzI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiOTZiNjJmMmZlMjhlNGEzYzQwMDUyYTY2MjUwMmFhNmZiOTI4MTE5NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-07-30 21:39:14.048899');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('16', 'gandazhi', '18408243385', 'django', '2017-07-08 20:54:56.129146');
INSERT INTO `operation_userask` VALUES ('17', 'gandazhi', '18408243385', 'django', '2017-07-08 20:55:24.904161');
INSERT INTO `operation_userask` VALUES ('18', 'gandazhi', '18408243385', 'django', '2017-07-08 20:59:37.109124');
INSERT INTO `operation_userask` VALUES ('19', '测试干大志', '18408243385', 'django', '2017-07-08 21:03:07.303691');
INSERT INTO `operation_userask` VALUES ('20', 'dasd', '18408243385', 'django', '2017-07-08 21:09:35.775696');
INSERT INTO `operation_userask` VALUES ('21', 'sadas', 'fasfda', 'asffgsdg', '2017-07-08 21:18:26.695897');
INSERT INTO `operation_userask` VALUES ('22', 'sadas', 'fasfda', 'asffgsdg', '2017-07-08 21:18:41.770319');
INSERT INTO `operation_userask` VALUES ('23', 'sadas', 'fasfda', 'asffgsdg', '2017-07-08 21:18:55.112639');
INSERT INTO `operation_userask` VALUES ('24', 'asdasdf', 'fasfa', '213', '2017-07-08 21:19:04.099963');
INSERT INTO `operation_userask` VALUES ('25', 'sadas', 'wqeqw', 'sadfasf', '2017-07-08 21:21:10.529929');
INSERT INTO `operation_userask` VALUES ('26', 'fdsfsd', 'dasdasd', 'asfasdfds', '2017-07-08 21:21:37.411609');
INSERT INTO `operation_userask` VALUES ('27', '案件粉丝哦', '18408243385', 'sadasf', '2017-07-12 20:22:42.193655');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2017-07-15 15:09:00.000000', '1', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('9', '10', '1', '2017-07-16 11:16:33.282543', '1');
INSERT INTO `operation_userfavorite` VALUES ('11', '1', '2', '2017-07-16 11:29:43.129169', '1');
INSERT INTO `operation_userfavorite` VALUES ('12', '2', '2', '2017-07-16 14:44:53.571931', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京市', '2017-07-06 21:27:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '成都市', '成都市', '2017-07-06 21:27:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '上海市', '上海市', '2017-07-06 21:28:00.000000');
INSERT INTO `organization_citydict` VALUES ('4', '广州市', '广州市', '2017-07-06 21:28:00.000000');
INSERT INTO `organization_citydict` VALUES ('5', '香港', '香港', '2017-07-06 21:28:00.000000');
INSERT INTO `organization_citydict` VALUES ('6', '深圳市', '深圳市', '2017-07-06 21:28:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `study_nums` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。[2]', '0', '0', 'org/2017/07/imooc_logo_Q0F9kZP.jpg', '北京市', '2017-07-06 21:42:00.000000', '1', 'training', '6', '0');
INSERT INTO `organization_courseorg` VALUES ('2', '麦子学院', '麦子学院，国内第一家在美国建立商务中心的IT在线教育机构，目前已与美国知名教育公司取得合作，未来将源源不断向国内输出大量高质量教育资源\r\n前身麦可网，2014年，麦可网完成千万级A轮融资，并更名为”麦子学院“，同时通过“麦子圈”IT职业实名社交圈——提供包括企业招聘对接，猎头，项目外包，经验分享，职业交友等一系列增值服务。\r\n做在线职业教育示范学院，将教育和课程做到极致。除了提供高质量的课程学习之外，也提供包括就业推荐，职业交友，项目外包，创业服务等全面的增值服务，并且线上线下结合，移动设备和传统网络相结合，打造IT职业教育的一个完整生态链。\r\n以高端IT技术型人才培养及服务为核心，探索及倡导技术交流创新模式。提供的不仅仅是技能培养，而是务实的职业导向。', '0', '0', 'org/2017/07/MaiZiEdu_logo_2s0kLgG.jpg', '成都市天府软件园D5', '2017-07-06 21:43:00.000000', '2', 'training', '7', '0');
INSERT INTO `organization_courseorg` VALUES ('3', '极客学院', '极客学院[1]  是中国android开发在线学习平台，汇集了几十名国内顶尖的有多年项目和实战经验的Android开发授课大师，精心制作了上千个高质量视频教程，涵盖了Android开发学习的基础入门、中级进阶，高级提升、项目实战开发等专业的android开发课程。\r\n极客学院[2]  背后是一支疯狂喜欢编程，狂热开发移动app的超有活力团队。他们希望通过最新的，高质量的，专业实战的在线开发课程打破传统的编程学习模式，以新一代的编程学习模式帮助开发者更快更好的学习Android开发，帮助开发者通过技术实现自己的理想。\r\n作为国内最大IT职业在线教育平台，极客学院一直致力于“让学习更有效”，帮助IT从业者在最短的时间内获得最多的知识，技能得到最快的提升。目前，极客学院已拥有60多万IT从业者用户。', '0', '0', 'org/2017/07/jikexueyuan_logo_JlrN1nT.jpg', '上海', '2017-07-06 21:45:00.000000', '3', 'training', '8', '0');
INSERT INTO `organization_courseorg` VALUES ('4', '成都东软学院', '成都东软学院（Chengdu Neusoft University）是经教育部批准成立的全日制普通本科院校，是四川省首批“卓越工程师教育培养试点高校”，国家紧缺型（信息类）人才培养基地，国家火炬计划成都数字娱乐产业化人才培训基地，国家数字媒体技术产业化人才培训基地，中国软件名城（成都）人才培养基地，四川省博士后创新实践基地，教育部应用科技大学改革试点高校。[1] \r\n成都东软学院前身是创建于2003年的成都东软信息职业技术学院，2011年5月18日升格为普通本科院校，学院更名为成都东软学院。[2-3] \r\n据2017年5月学院官网显示，学院地处成都市郊的世界文化遗产——都江堰-青城山风景区，占地面积近40万平方米，总建筑面积20万平方米[1]  ，图书馆舍馆藏文献56万多册，开设18个本科和4个专科IT、泛IT专业[4-5]  ，全日制在校生约1.1万人，留学生6名。[1]', '0', '0', 'org/2017/07/nsu_logo_SeEKBSq.jpg', '都江堰市青城山镇东软大道1号', '2017-07-06 21:46:00.000000', '2', 'university', '9', '0');
INSERT INTO `organization_courseorg` VALUES ('5', '四川大学', '四川大学（Sichuan University），简称“川大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”，入选“2011计划”、“珠峰计划”、“111计划”、“卓越工程师教育培养计划”、“海外高层次人才引进计划”，设有研究生院，拥有研究生自主划线资格，是一所综合性全国重点大学。\r\n四川大学由原四川大学、原成都科学技术大学、原华西医科大学三所全国重点大学经过两次合并而成。原四川大学起始于1896年四川总督鹿传霖奉光绪特旨创办的四川中西学堂，是西南地区最早的近代高等学校；原成都科学技术大学是新中国院系调整时组建的第一批多科型工科院校；原华西医科大学源于1910年由西方基督教会组织在成都创办的华西协合大学，是西南地区最早的西式大学和中国最早培养研究生的大学之一。1994年，原四川大学和原成都科技大学合并为四川联合大学，1998年更名为四川大学。2000年，四川大学与原华西医科大学合并，组建了新的四川大学。\r\n四川大学承文翁之教，聚群贤英才。百余年来，学校先后汇聚了历史学家顾颉刚、文学家李劼人、美学家朱光潜、物理学家吴大猷、植物学家方文培、卫生学家陈志潜、数学家柯召等大师。历史上，吴玉章、张澜曾执掌校务，共和国开国元勋朱德、共和国主席杨尚昆、文坛巨匠郭沫若、人民作家巴金、一代英烈江竹筠（江姐）等曾在川大求学。两院院士中，有50余位是川大校友；2001年评选的近代50位“四川文化名人”中，有36人是川大校友。[1]', '0', '0', 'org/2017/07/sicuan_logo_5CJdvFl.jpg', '武侯区一环路南一段24号', '2017-07-06 21:47:00.000000', '2', 'university', '10', '0');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', 'gandazhi', '1', 'nsusoft', 'Python工程师', 'xxx', '0', '0', '2017-07-09 13:55:00.000000', '1', 'teacher/2017/07/3yi0vxlmqbr-26833.jpg');
INSERT INTO `organization_teacher` VALUES ('2', 'gandazhi2', '1', 'xxx', 'xxx', 'xxx', '0', '0', '2017-07-10 22:52:00.000000', '1', 'teacher/2017/07/20151206180905_K4tYv.jpeg');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `adders` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$u4bptrG8bI69$PRLD3Zdam8clGyR8N51ZjhptFpA0hg8ghAQ6Zp6EJHc=', '2017-07-11 23:17:00.000000', '1', 'gandazhi', '', '', 'gandazhi@gmail.com', '1', '1', '2017-07-06 21:16:00.000000', '干大志', null, 'male', '成都天府大道南段', '', 'image/2017/07/3yi0vxlmqbr-26833.jpg');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-07-06 21:27:40.781658', '127.0.0.1', '1', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-07-06 21:28:17.626171', '127.0.0.1', '2', '成都市', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-07-06 21:28:31.782277', '127.0.0.1', '3', '上海市', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-07-06 21:28:45.686139', '127.0.0.1', '4', '广州市', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-07-06 21:28:56.542524', '127.0.0.1', '5', '香港', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-07-06 21:29:11.970699', '127.0.0.1', '6', '深圳市', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-07-06 21:43:10.985099', '127.0.0.1', '1', 'CourseOrg object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-07-06 21:45:36.563687', '127.0.0.1', '2', '麦子学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-07-06 21:46:41.155286', '127.0.0.1', '3', '极客学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-07-06 21:47:51.519842', '127.0.0.1', '4', '成都东软学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-07-06 21:48:49.958583', '127.0.0.1', '5', '四川大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2017-07-06 21:49:48.210065', '127.0.0.1', '6', 'udacity', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2017-07-09 13:56:30.803957', '127.0.0.1', '1', 'Teacher object', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2017-07-09 14:16:02.721348', '127.0.0.1', '1', 'django入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2017-07-09 14:20:32.814381', '127.0.0.1', '1', 'django入门', 'change', '已修改 course_org 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2017-07-09 21:55:03.313938', '127.0.0.1', '1', 'django入门', 'change', '已修改 course_org 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2017-07-09 22:04:09.775462', '127.0.0.1', '1', 'gandazhi', 'change', '已修改 org 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2017-07-10 21:47:56.071032', '127.0.0.1', '1', 'gandazhi', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2017-07-10 22:15:47.679416', '127.0.0.1', '1', 'django入门', 'change', '已修改 learn_time，students 和 fav_num 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2017-07-10 22:53:47.525632', '127.0.0.1', '2', 'gandazhi2', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2017-07-12 22:00:34.235948', '127.0.0.1', '2', 'HTML+CSS基础课程', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2017-07-12 22:02:05.195489', '127.0.0.1', '3', 'Java入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2017-07-12 22:03:22.419257', '127.0.0.1', '4', 'Python入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2017-07-12 22:04:26.600768', '127.0.0.1', '5', 'Android攻城狮的第一门课（入门篇）', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2017-07-12 22:06:13.345945', '127.0.0.1', '6', 'JavaScript深入浅出', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2017-07-12 22:07:28.747534', '127.0.0.1', '7', 'Ajax全接触', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2017-07-12 22:08:41.285829', '127.0.0.1', '8', 'AngularJS实战', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2017-07-12 22:10:19.214651', '127.0.0.1', '9', '手把手教你实现电商网站开发', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2017-07-12 22:12:08.958627', '127.0.0.1', '10', 'Spring MVC起步', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2017-07-15 14:47:03.085186', '127.0.0.1', '1', 'Lesson object', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2017-07-15 14:47:41.581741', '127.0.0.1', '2', '第二节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2017-07-15 14:58:00.445046', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 category 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2017-07-15 15:09:49.999877', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2017-07-15 15:11:22.014545', '127.0.0.1', '1', 'gandazhi', 'change', '已修改 last_login，nick_name，gender，adders 和 image 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2017-07-16 16:38:52.844652', '127.0.0.1', '3', '第一章MVC简介', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2017-07-16 16:39:13.996662', '127.0.0.1', '4', '第2章 Spring MVC中的基本概念', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2017-07-16 16:39:22.953248', '127.0.0.1', '5', '第3章 配置Maven环境', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2017-07-16 16:39:31.067493', '127.0.0.1', '6', '第4章 Spring MVC实操', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2017-07-16 16:39:39.618368', '127.0.0.1', '7', '第5章 总结', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2017-07-16 16:39:45.399551', '127.0.0.1', '3', '第1章MVC简介', 'change', '已修改 name 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2017-07-16 16:44:22.720936', '127.0.0.1', '1', 'Video object', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2017-07-16 16:44:51.886987', '127.0.0.1', '2', 'Video object', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2017-07-16 16:45:12.801263', '127.0.0.1', '3', 'Video object', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2017-07-16 16:46:26.697289', '127.0.0.1', '4', '2-1 Spring MVC的静态概念', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2017-07-16 16:48:52.618889', '127.0.0.1', '5', '2-2 Spring MVC的动态概念', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2017-07-16 16:49:29.531799', '127.0.0.1', '6', '3-1 Maven介绍', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2017-07-16 16:49:59.031881', '127.0.0.1', '7', '3-2 Maven的安装', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2017-07-16 16:50:23.972856', '127.0.0.1', '8', '3-3 Maven的配置', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2017-07-16 16:50:46.763007', '127.0.0.1', '9', '3-4 用Maven创建项目', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2017-07-16 16:51:15.687088', '127.0.0.1', '10', '3-5 Hello Spring MVC', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2017-07-16 16:51:46.540089', '127.0.0.1', '11', '4-1 从配置文件开始', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2017-07-16 16:52:12.766006', '127.0.0.1', '12', '4-2 Controller-基础代码', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2017-07-16 16:52:38.495009', '127.0.0.1', '13', '4-3 Controller-现代方式', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2017-07-16 16:53:00.129375', '127.0.0.1', '14', '4-4 Controller-传统方式', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2017-07-16 16:53:22.534923', '127.0.0.1', '15', '4-5 Binding', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2017-07-16 16:53:46.642862', '127.0.0.1', '16', '4-6 FileUpload--单文件上传', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2017-07-16 16:54:13.489529', '127.0.0.1', '17', '4-7 JSON（上）', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2017-07-16 16:54:31.263684', '127.0.0.1', '18', '4-8 JSON（中）', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2017-07-16 16:54:53.534747', '127.0.0.1', '19', '4-9 JSON（下）', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2017-07-16 16:55:23.238647', '127.0.0.1', '20', '总结', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2017-07-16 17:49:53.267362', '127.0.0.1', '1', 'CourseResource object', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2017-07-16 21:28:20.936493', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 teacher 和 tag 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2017-07-16 21:32:44.488290', '127.0.0.1', '1', 'gandazhi', 'change', '已修改 work_position 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2017-07-16 21:37:32.067087', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 you_need_know 和 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2017-07-16 21:38:46.544209', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2017-07-16 21:39:01.490653', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2017-07-16 21:39:13.761026', '127.0.0.1', '10', 'Spring MVC起步', 'change', '已修改 teacher_tell 。', '9', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
