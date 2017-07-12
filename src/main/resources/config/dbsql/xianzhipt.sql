/*
Navicat MySQL Data Transfer

Source Server         : xianzlc
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : xianzhipt

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-06-21 09:06:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xz_blog
-- ----------------------------
DROP TABLE IF EXISTS `xz_blog`;
CREATE TABLE `xz_blog` (
  `blog_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_id` bigint(225) DEFAULT NULL COMMENT '登录表ID',
  `blog_writer` varchar(200) DEFAULT NULL COMMENT '发帖人',
  `blog_title` varchar(200) DEFAULT NULL COMMENT '博客标题',
  `blog_article` varchar(2000) DEFAULT NULL COMMENT '博客内容',
  `blog_time` datetime DEFAULT NULL COMMENT '发帖时间',
  `if_exist` int(2) DEFAULT '1' COMMENT '某条博客是否有评论(2有 1没有)',
  `blog_image` bigint(11) DEFAULT NULL COMMENT '博客图片',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除;1删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `fk_blog_member` (`blog_writer`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_blog
-- ----------------------------
INSERT INTO `xz_blog` VALUES ('1001', null, 'Tom', 'JAVA学习笔记--接口', '在谈论接口之前，我们先了解一下抽象类和抽象方法。我们知道，在继承结构中，越往下继承，类会变得越来越明确和具体，而往上回溯，越往上，类会变得越抽象和通用。我们有时候可能会需要这样一个类，它只是表示了一个接口，但并没有具体的实现，这就是一个抽象类。　　抽象方法只有方法声明而没有方法体，也就是说用户并不知道这个方法是如何实现的。抽象方法的声明用到了 abstract 关键字，声明方法如下：　　abstract void f();　　　　　　　　// 声明一个抽象方法　　包含抽象方法的类叫做抽象类。如果一个类包含一个或多个抽象方法，那么该类必须被限定为抽象的。抽象类也用关键字abstract进行说明。1）抽象类看起来和普通类相像，但是抽象类不能用new操作符创建它的实例；抽象类中抽象方法只有定义而没有实现，它的实现由子类提供；2）抽象类可以被继承，但是其导出类必须为基类中所有的抽象方法提供方法定义，如果不这样做，那么导出类也将被强制限定为抽象类；3）抽象类中可以没有抽象方法，这样的抽象类通常被用作基类型；4）抽象类的构造方法定义为protected，这个构造方法在其子类的构造方法中被调用；5）即使父类是具体的，其子类也可以是抽象的；6）不能用new操作符创建一个抽象类的实例，但是抽象类可以用作一种数据类型被new调用。', '2017-04-01 08:23:38', '2', '13', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1002', null, 'Mark', 'SpringMVC日期类型转换问题三大处理方法归纳', '我们在SpringMVC开发中，可能遇到比较多的问题就是前台与后台实体类之间日期转换处理的问题了，说问题也不大，但很多人开发中经常会遇到这个问题，有时很令人头疼，有时间问题暴露的不是很明显，然后逐渐对问题进行跟踪，会发现是日期类型转换失败“映射”不到对应的持久类的日期属性上造成的，由此我还特意写过一篇博文：SpringMVC中出现\" 400 Bad Request \"错误（用@ResponseBody处理ajax传过来的json数据转成bean）的解决方法。感兴趣的码农可以看一看，总结了常见造成springMVC出现“400 Bad Request”错误的七大原因，其中就有前台的字符串日期类型与后台的Java日期类型匹配不上造成的。\r\n       今天晚上呢，特意抽出宝贵的时间来总结归纳出一下解决这个问题的三大方法，分享给大家，以帮助更多像我一样的人。鄙人不才，如果过程中有讲解的不清或者不对的地方，还望认真阅读的您，留下你的宝贵意见或建议，以便您，我，还有大家更快更好的共同进步！', '2017-04-04 12:23:20', '2', '14', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1003', null, 'Peter', 'Java for Web学习笔记', '在Professional Java for Web Applications中给通书的例子中给出如何利用WebSocket实现聊天室的例子，作为案例，学习一下。用户可以进入聊天室聊天，HTTPSession终结，WebSocket也相应关闭。因此小例子中Server Endpoint是承载在一个HttpSessionListener之上。\r\n在sessionDestroyed()中，关闭WebScoket，向聊天的对方提示状态。', '2017-04-02 17:28:34', '2', '15', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1004', null, 'Lucy', ' Redis安装、启动和关闭', '2、安装\r\n①：方式：源码安装，Redis 是 C 语言编写，对 C 语言编译，然后才能安装，想编译 C 语言，需要安装gcc。\r\n②：查看是否安装 gcc，在 Linux 上输入命令：rpm -qa | grep gcc，如果有安装会显示出gcc 的版本，否则没有。\r\n③：安装好 gcc，进入sftp，把 Redis源码拖上去，进入到 linux 输入命令：ll -h，查看是否有 redis的压缩包。\r\n④：安装在 usr/local/redis 的目录下，先建 redis 目录，cd / ----> cd /usr/local/redis ----> mkdir redis\r\n⑤：复制刚才上传的 redis 压缩包到新建的 redis 目录下：cp /root/redis-3.0.7.tar.gz /usr/local/redis\r\n⑥：查看是否已经复制过去：cd /usr/local/redis ----> ll -h ----> 这时候可以看到 redis 压缩包\r\n⑦：查看权限：ll -h，查看前面的权限，-rwxr-xr-x 代表有执行的权限。', '2017-03-31 01:35:56', '1', '26', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1005', null, 'Kate', 'redis主动向页面push数据', '对于页面上定时刷新显示的数据，之前一直都是比较“传统”的思想——那就是“页面通过ajax请求后台，后台响应后把数据返回给前台展示，如此反复……”，而自己也从来没有过“服务端主动向页面推送数据”的概念。\r\n现在需要用到Redis的发布/订阅，页面“订阅”某一channel，服务端在某一channel“发布”内容。服务端发布后，客户端可以通过订阅实时将刚刚发布的内容展示出来。', '2017-04-21 22:34:56', '2', '27', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1006', null, 'Amber', '一键生成 Android 录屏 gif 的脚本', 'ffmpeg -r 5 和 convert -delay 20 这两个参数值, 分别是 视频抽帧间隔 和 gif每帧间隔, 假设其分别为 video_fps 和 gif_delay, 那么这两个参数在设置时必须满足如下条件: \r\nvideo_fps * gif_delay = 100\r\n\r\n如果乘积小于 100, 则生成的 gif 会比原本的播放速度快; \r\n如果乘积大于 100, 则生成的 gif 会比原本的播放速度慢.\r\n\r\n至于原因, 结合上面对这两个参数的介绍, 思考一下就明白了.', '2017-03-27 23:11:56', '2', '28', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1007', null, 'Jenny', 'Ehcache缓存框架详解', 'name：缓存名称\r\n\r\n        maxElementsInMemory：内存中最大缓存对象数\r\n\r\n        maxElementsOnDisk：硬盘中最大缓存对象数，若是0表示无穷大\r\n\r\n        eternal：true表示对象永不过期，此时会忽略timeToIdleSeconds和timeToLiveSeconds属性，默认为false\r\n\r\n        overflowToDisk：true表示当内存缓存的对象数目达到了\r\n\r\n        maxElementsInMemory界限后，会把溢出的对象写到硬盘缓存中。注意：如果缓存的对象要写入到硬盘中的话，则该对象必须实现了Serializable接口才行。\r\n\r\n        diskSpoolBufferSizeMB：磁盘缓存区大小，默认为30MB。每个Cache都应该有自己的一个缓存区。\r\n\r\n        diskPersistent：是否缓存虚拟机重启期数据，是否持久化磁盘缓存,当这个属性的值为true时,系统在初始化时会在磁盘中查找文件名 为cache名称,后缀名为index的文件，这个文件中存放了已经持久化在磁盘中的cache的index,找到后会把cache加载到内存，要想把 cache真正持久化到磁盘,写程序时注意执行net.sf.ehcache.Cache.put(Element element)后要调用flush()方法。\r\n\r\n        diskExpiryThreadIntervalSeconds：磁盘失效线程运行时间间隔，默认为120秒', '2017-04-05 04:58:17', '1', '13', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1008', null, 'Lily', 'HashMap 内部原理', 'HashMap 内部实现\r\n\r\n通过名字便可知道的是，HashMap 的原理就是散列。HashMap内部维护一个 Buckets 数组，每个 Bucket 封装为一个 Entry<K, V> 键值对形式的链表结构，这个 Buckets 数组也称为表。表的索引是 密钥K 的散列值（散列码）。影响 HashMap 性能的两个因素是初始容量和负载因子。容量是表数组的长度，初始容量只是创建哈希表时的容量。负载因子是衡量哈希表在容量自动增加之前是否允许获取的量度（比例）。\r\n\r\n当散列表中的 Entry 数量超过负载因子和当前容量的乘积时，将会重新散列该表（也就是重建内部数据结构），使得散列表具有大约两倍的容量（这个其实和ArrayList类似）。', '2017-04-06 16:51:03', '1', '14', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1009', null, 'Jack', 'Java代码中常见技术债务处理之Exception', '异常处理是代码中常见的处理，本文根据SonarQube在异常方面的规则和常见检查结果，选取说明了常见异常处理中的技术债务，提倡技术债务最少的编码方式。\r\n\r\nException handlers should preserve the original exceptions\r\n\r\nEither log or rethrow this exception.\r\n\r\nWhen handling a caught exception, the original exception’s message and stack trace should be logged or passed forward. \r\nNONCOMPLIANT CODE EXAMPLE', '2017-03-28 13:56:58', '1', '15', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1010', null, 'Emma', '创建一个Struts2的web项目', '上面的代码中我们重写了基类中用以处理用户请求的execute()方法。 \r\n上述方法的返回值为index，那么程序要怎样识别并返回相应的界面呢？\r\n\r\n所以就需要定义逻辑视图与物理资源之间的映射。这时候就会返回WebContent目录下面的index.jsp文件了。 ', '2017-04-06 03:12:12', '1', '26', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1011', null, 'Bob', ' js正则表达式企业级应用实例', ' 最近工作上大量用到了正则表达式，在此记录一下。（注：本文注重实际效用，具体理论不详述） \r\n作为官方套路，首先还是简单看看度娘上是怎么说的：\"正则表达式，又称规则表达式。（英语：Regular Expression，在代码中常简写为regex、regexp或RE）， \r\n计算机科学的一个概念。正则表通常被用来检索、替换那些符合某个模式(规则)的文本。\" \r\nok，老司机直奔主题！ \r\n\r\n实例one.验证手机号码 ', '2017-04-02 23:11:00', '1', '27', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1012', null, 'Lisa', '史上最简单的 MyBatis 教程', 'MyBatis 是支持普通 SQL 查询，存储过程和高级映射的优秀持久层框架，其几乎消除了所有的 JDBC 代码和参数的手工设置以及结果集的检索。MyBatis 使用简单的 XML 或注解用于配置和原始映射，将接口和 Java 的 POJOs（Plain Old Java Objects，普通的 Java对象）映射成数据库中的记录。MyBatis 应用程序大都使用 SqlSessionFactory 实例，SqlSessionFactory 实例可以通过 SqlSessionFactoryBuilder 获得，而　SqlSessionFactoryBuilder 则可以从一个 XML 配置文件或者一个预定义的配置类的实例获得。', '2017-04-08 11:53:48', '1', '28', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1013', null, 'Kitty', 'Spring Boot 进阶之Banner', '该信息来源于SpringBootBanner类的静态常量BANNER，该属性是一个字符串数组，不指定任何banner属性时，控制台默认输出该数组数据。我们可以通过Spring Boot提供的强大配置功能来改变banner的输出。\r\n1、通过代码设置\r\n  在main方法中创建SpringApplication对象，通过该实例对象设置banner属性，', '2017-03-26 18:54:31', '1', '13', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1014', null, 'Sam', 'SpringMvc+MyBatis+Freemarker 配置', '引入Jar包：\r\nspring所有jar文件\r\nmybatis：mybatis-3.1.1-SNAPSHOT.jar、mybatis-generator-core-1.3.1.jar、mybatis-spring-1.1.1-SNAPSHOT.jar\r\n连接池：commons-dbcp.jar\r\nfreemarker-2.3.26.jar\r\n其他：commons-collections-3.1.jar、commons-logging-1.1.1.jar、commons-pool.jar、mysql-connector-java-5.1.40-bin.jar、servlet-api.jar', '2017-04-01 19:28:46', '2', '25', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1015', null, 'Max', 'jQuery中的事件绑定', '在jQuery中，为元素绑定事件可以使用bind()方法，该方法的语法结构如下：\r\nbind(type,[data],fn)\r\ntype：事件类型。\r\ndata：可选参数，作为event.data属性值传递给事件对象的额外数据对象。大多数的情况下不使用该参数。\r\nfn：绑定的事件处理程序。\r\n例如，为普通按钮绑定一个单击事件，用于在单击该按钮时，弹出提示对话框，可以使用下面的代码：\r\n$(\"input:button\").bind(\"click\",function(){alert(\'您单击了按钮\');});', '2017-04-06 09:55:31', '2', '24', null, null, null, null, '0', null);
INSERT INTO `xz_blog` VALUES ('1016', null, 'Coco', 'Java内存设置与监控分析', '设置Java运行时内存（tomcat为例）\r\n JAVA_OPTS=\"-server -Xms2048M -Xmx2048M -Xmn512M -XX:PermSize=256M -XX:MaxPermSize=256M\";\r\nserver模式，堆内存2G，新生代512MB，永久代256MB，收集器由jvm自动选择。\r\n各区域大小应根据应用的实际情况调整，推荐参数为：不配置。\r\n \r\n内存分配情况查看\r\n查看堆内存分配情况：jmap -heap pid \r\n活动实例采集：jmap–histo:live pid ', '2017-04-03 09:43:35', '2', '23', null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for xz_blog_attent
-- ----------------------------
DROP TABLE IF EXISTS `xz_blog_attent`;
CREATE TABLE `xz_blog_attent` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `writer_id` bigint(225) DEFAULT NULL COMMENT '作者ID',
  `login_id` bigint(225) DEFAULT NULL COMMENT '关注者ID',
  `attent_type` bigint(225) DEFAULT NULL COMMENT '关注状态 1关注 2未关注',
  `delete_type_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(255) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(255) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(255) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(2) DEFAULT NULL COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_blog_attent
-- ----------------------------

-- ----------------------------
-- Table structure for xz_blog_discuss
-- ----------------------------
DROP TABLE IF EXISTS `xz_blog_discuss`;
CREATE TABLE `xz_blog_discuss` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `blog_id` bigint(11) NOT NULL COMMENT '博客编号',
  `discuss_id` bigint(11) NOT NULL COMMENT '评论编号',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记(0未删除 1删除)',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `discuss_id` (`discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_blog_discuss
-- ----------------------------
INSERT INTO `xz_blog_discuss` VALUES ('1', '1001', '1001', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('2', '1001', '1002', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('3', '1002', '1003', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('4', '1002', '1004', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('5', '1001', '1005', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('6', '1002', '1006', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('7', '1001', '1007', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('8', '1001', '1012', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('9', '1001', '1013', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('10', '1003', '1014', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('11', '1003', '1016', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('12', '1006', '1027', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('13', '1016', '1028', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('14', '1015', '1029', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('15', '1015', '1032', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('16', '1006', '1040', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('17', '1014', '1041', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('18', '1005', '1042', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('19', '1001', '1045', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('20', '1003', '1046', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('21', '1016', '1048', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('22', '1016', '1049', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('23', '1014', '1052', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('24', '1001', '1053', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('25', '1002', '1054', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('26', '1001', '1058', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('27', '1002', '1061', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('28', '1001', '1062', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('29', '1001', '1063', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('30', '1001', '1064', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('31', '1001', '1066', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('32', '1001', '1068', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('33', '0', '1074', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('34', '0', '1075', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('35', '1002', '1081', null, null, null, '1');
INSERT INTO `xz_blog_discuss` VALUES ('36', '1002', '1083', null, null, null, '0');
INSERT INTO `xz_blog_discuss` VALUES ('37', '1002', '1087', null, null, null, '1');

-- ----------------------------
-- Table structure for xz_blog_like
-- ----------------------------
DROP TABLE IF EXISTS `xz_blog_like`;
CREATE TABLE `xz_blog_like` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `blog_id` bigint(225) DEFAULT NULL COMMENT '博客ID',
  `writer_id` bigint(225) DEFAULT NULL COMMENT '作者ID',
  `login_id` bigint(225) DEFAULT NULL COMMENT '点赞收藏者ID',
  `like_type` int(2) DEFAULT NULL COMMENT '点赞状态 1为点赞 2已点赞',
  `collect_type` int(2) DEFAULT NULL COMMENT '收藏状态 1未收藏 2已收藏',
  `delete_type_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(255) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(255) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(255) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(2) DEFAULT NULL COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_blog_like
-- ----------------------------

-- ----------------------------
-- Table structure for xz_bolger
-- ----------------------------
DROP TABLE IF EXISTS `xz_bolger`;
CREATE TABLE `xz_bolger` (
  `id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_id` bigint(200) DEFAULT NULL COMMENT '博主ID',
  `Lv` int(10) DEFAULT NULL COMMENT '博主等级',
  `experience` int(10) DEFAULT NULL COMMENT '经验值',
  `delete_message_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(255) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(255) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(255) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(2) DEFAULT NULL COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_bolger
-- ----------------------------

-- ----------------------------
-- Table structure for xz_company
-- ----------------------------
DROP TABLE IF EXISTS `xz_company`;
CREATE TABLE `xz_company` (
  `company_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `login_id` bigint(200) NOT NULL COMMENT '登录表ID',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `company_location` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_picture` varchar(200) DEFAULT NULL,
  `company_intro` varchar(200) DEFAULT NULL COMMENT '公司简介',
  `company_scale` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `company_nature` int(10) DEFAULT NULL COMMENT '公司性质 1国企 2民营',
  `industry` varchar(50) DEFAULT NULL COMMENT '行业',
  `delete_company_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` bigint(255) DEFAULT '0' COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xz_company
-- ----------------------------
INSERT INTO `xz_company` VALUES ('2', '4', '先知蓝创', '沈阳', '024-23232323', 'timg1.jpg', '什么也没写', '20-49人', '1', 'IT', null, null, null, null, '0');
INSERT INTO `xz_company` VALUES ('3', '7', null, null, null, 'timg1.jpg', null, null, '0', null, null, null, null, null, '0');
INSERT INTO `xz_company` VALUES ('4', '17', '琅琊阁', null, null, 'timg1.jpg', null, null, '0', null, null, null, null, null, '0');
INSERT INTO `xz_company` VALUES ('5', '18', '琅琊阁', '啦啦啦啦', '024-58865610', '149673646899507.jpg', '互联网', '20-49人', '2', 'IT', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_cost
-- ----------------------------
DROP TABLE IF EXISTS `xz_cost`;
CREATE TABLE `xz_cost` (
  `cost_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vip_id` bigint(11) NOT NULL COMMENT '会员编号',
  `cost_money` double(20,2) DEFAULT NULL COMMENT '交易金额',
  `cost_type` varchar(20) DEFAULT '支出' COMMENT '交易类型(支出/收入)',
  `cost_reason` varchar(200) DEFAULT NULL COMMENT '交易原因',
  `cost_time` datetime DEFAULT NULL COMMENT '交易时间',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_cost
-- ----------------------------
INSERT INTO `xz_cost` VALUES ('1001', '1019', '50.00', '收入', '会员充值', '2017-04-25 15:13:32', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1002', '1019', '3.12', '支出', '购买课程', '2017-03-26 12:39:08', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1003', '1002', '50.00', '收入', '会员充值', '2017-05-05 21:18:32', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1004', '1002', '12.25', '支出', '参加课程活动', '2017-03-22 15:18:03', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1005', '1002', '6.12', '收入', '课程视频收入', '2017-04-07 07:35:08', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1006', '1019', '10.23', '收入', '课程视频收入', '2017-05-05 09:57:36', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1007', '1003', '50.00', '收入', '会员充值', '2017-05-06 15:58:21', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1008', '1003', '12.80', '收入', '学习心得分享', '2017-05-25 23:21:09', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1009', '1007', '60.00', '收入', '会员充值', '2017-04-09 20:52:35', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1010', '1007', '3.12', '支出', '购买课程', '2017-04-13 09:32:51', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1011', '1007', '8.90', '支出', '观看视频', '2017-04-15 21:09:51', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1012', '1007', '5.00', '收入', '组织活动', '2017-04-27 15:16:05', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1013', '1007', '11.30', '支出', '购买课程', '2017-04-30 07:16:39', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1014', '1007', '3.00', '支出', '购买课程', '2017-05-05 12:17:56', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1015', '1023', '100.00', '收入', '会员充值', '2017-05-18 12:31:17', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1016', '1003', '70.00', '收入', '会员充值', '2017-05-02 11:30:21', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1017', '1003', '5.20', '支出', '观看视频', '2017-05-03 13:54:59', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1018', '1003', '6.07', '支出', '参加课程活动', '2017-05-07 21:56:35', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1019', '1005', '30.00', '收入', '会员充值', '2017-05-02 12:37:19', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1020', '1005', '5.20', '支出', '购买课程', '2017-05-10 09:38:31', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1021', '1020', '120.00', '收入', '会员充值', '2017-04-12 13:58:50', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1022', '1020', '98.00', '支出', '参加课程活动', '2017-05-13 08:37:56', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1023', '1022', '30.00', '收入', '用户充值', '2017-04-04 08:26:09', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1024', '1022', '0.80', '支出', '观看课程视频', '2017-05-22 10:27:53', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1025', '1022', '0.20', '支出', '观看课程视频', '2017-05-25 17:08:56', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1026', '1021', '10.00', '收入', '用户充值', '2017-04-27 08:07:39', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1027', '1021', '9.95', '支出', '参加课程活动', '2017-05-01 16:38:21', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1028', '1007', '0.20', '支出', '观看付费视频', '2017-05-19 11:17:42', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1029', '1007', '0.20', '支出', '观看付费视频', '2017-05-19 18:42:12', null, null, null, '0');
INSERT INTO `xz_cost` VALUES ('1030', '1027', '0.20', '支出', '观看付费视频', '2017-05-20 16:12:49', null, null, null, '0');

-- ----------------------------
-- Table structure for xz_data
-- ----------------------------
DROP TABLE IF EXISTS `xz_data`;
CREATE TABLE `xz_data` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_id` bigint(200) NOT NULL COMMENT '用户编号',
  `type` varchar(200) DEFAULT NULL COMMENT '类型',
  `info` varchar(2000) DEFAULT NULL COMMENT '数值',
  `delete_date` date DEFAULT NULL COMMENT '删除时间',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记(0未删除 1删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xz_data
-- ----------------------------

-- ----------------------------
-- Table structure for xz_discuss
-- ----------------------------
DROP TABLE IF EXISTS `xz_discuss`;
CREATE TABLE `xz_discuss` (
  `discuss_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(225) DEFAULT '0' COMMENT '用户ID',
  `member_picture` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `discuss_writer` varchar(200) DEFAULT NULL COMMENT '评论人',
  `discuss_article` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `discuss_time` datetime DEFAULT NULL COMMENT '评论时间',
  `reply_id` bigint(11) DEFAULT NULL COMMENT '回复',
  `exist` int(2) DEFAULT '1' COMMENT '该条评论是否有回复(1没有 2有)',
  `discuss_type` varchar(20) DEFAULT '博客' COMMENT '评论类型(视频评论/博客评论)',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`discuss_id`),
  KEY `fk_discuss_member` (`discuss_writer`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_discuss
-- ----------------------------
INSERT INTO `xz_discuss` VALUES ('1001', null, null, 'Jenny', '接口把方法的特征和方法的实现分割开来。这种分割，体现在接口常常代表一个角色（role），它包装与该角色相关的操作和属性，而实现这个接口的类便扮演这个角色的演员（类）。', '2017-04-01 12:12:28', null, '2', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1002', null, null, 'Amy', '不能构造接口的对象，却能声明接口的变量。', '2017-04-08 12:57:50', null, '2', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1003', null, null, 'Kim', '如果将日期类型转换为String在页面上显示，需要配合一些前端的技巧进行处理。', '2017-03-26 23:16:33', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1004', null, null, 'John', '集成开发环境（IDE），功能齐全，调试功能很强，程序编好后，可以立刻在环境中调试以获得初步测试结果，然后，可以方便地做成beta版形式，拿到实际环境中进一步测试，最后做成软件发行版。', '2017-04-24 21:22:46', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1005', null, null, 'Mary', 'Java 是由Sun Microsystems公司于1995年5月推出的高级程序设计语言。', '2017-03-12 20:23:45', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1006', null, null, 'David', 'MyBatis 本是apache的一个开源项目iBatis, 2010年这个项目由apache software foundation 迁移到了google code，并且改名为MyBatis 。MyBatis是一个基于Java的持久层框架。', '2017-03-06 23:14:41', null, '2', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1007', null, null, 'Kimi', '接口与接口之间可以是继承关系，而且可以实现多继承。', '2017-05-05 18:42:12', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1008', null, null, 'Henry', '由于消费电子产品所采用的嵌入式处理器芯片的种类繁杂，如何让编写的程序跨平台运行也是个难题。', '2017-04-30 23:27:06', '1001', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1009', null, null, 'Susan', '采用上述开发模型，不仅实现了视图、控制器与模型的彻底分离，而且还实现了业务逻辑层与持久层的分离。这样无论前端如何变化，模型层只需很少的改动，并且数据库的变化也不会对前端有所影响，大大提高了系统的可复用性。而且由于不同层之间耦合度小，有利于团队成员并行工作，大大提高了开发效率。', '2017-04-08 13:07:10', '1002', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1010', null, null, 'Willam', 'Struts作为系统的整体基础架构，负责MVC的分离，在Struts框架的模型部分，控制业务跳转，利用Hibernate框架对持久层提供支持。', '2017-04-16 03:07:33', '1002', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1011', null, null, 'Cici', '它通过采用 Java Servlet/JSP 技术，实现了基于Java EEWeb应用的MVC设计模式的应用框架，是MVC经典设计模式中的一个经典产品。', '2017-04-12 16:16:16', '1006', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1012', null, null, 'Tonny', '对JDBC访问数据库的代码做了封装，大大简化了数据访问层繁琐的重复性代码。', '2017-04-18 11:35:03', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1013', null, null, 'gycx', '通讯技术的发展，促进了个人/组织在信息获取上的平等发展，数据不再是限制我们努力的因素了。', '2017-04-13 12:25:33', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1014', null, null, 'tuantuan', '减少互联网富应用（RIA )对Flash、Silverlight、Java Applet等的依赖，并且提供更多能有效增强网络应用的API。', '2017-04-11 12:50:35', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1015', null, null, 'wangshiyu', '根据运作问题和目标，通过数据挖掘和分析，寻找有效的数据指标。通过对关键指标的趋势预测，发现潜在风险、发掘改善途径。', '2017-03-27 13:05:16', '1013', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1016', null, null, 'Bill', 'sql语句使用硬编码在Java程序中，修改sql语句，就需要重新编译java代码，不利于系统维护 \r\n解决：把sql语句放在xml配置文件中，修改sql语句也不需要重新编译java代码 ', '2017-03-26 21:33:21', null, '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1017', null, null, 'Lily', '作为程序员，相比于共享一个变量的开销要比每次创建一个新变量要小很多。', '2017-04-15 10:17:04', '1006', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1018', null, null, 'Kate', '在线程中添加了runloop，并运行起来，实际上是添加了一个do，while循环，这样这个线程的程序就一直卡在do，while循环上，这样相当于线程的任务一直没有执行完，所有线程一直不会销毁。', '2017-05-24 10:50:32', '1001', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1019', null, null, 'Jackson', 'HashMap和LinkedList合二为一即是LinkedHashMap。所谓LinkedHashMap，其落脚点在HashMap，因此更准确地说，它是一个将所有Entry节点链入一个双向链表LinkedList的HashMap。', '2017-05-06 10:50:43', '1001', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1020', null, null, 'Mark', '在java应用执行期间，只要对象的equals方法的比较操作所用到的信息没有被修改，那么对这同一对象调用多次hashCode方法都必须始终如一地同一个整数。', '2017-06-09 10:51:07', '1001', '1', '博客', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1021', null, null, 'xiaoqi', 'removeView的代码很清晰，首先通过findViewLocked来查找待删除的索引，这个超找过程就是建立的数组遍历，然后调用removeViewLocked来进一步的删除。', '2017-05-27 10:51:20', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1022', null, null, 'wangshiyu', 'next用于维护HashMap各个桶中的Entry链，before、after用于维护LinkedHashMap的双向链表，虽然它们的作用对象都是Entry，但是各自分离，是两码事儿。', '2017-05-12 10:51:32', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1023', null, null, 'xiaoqi', '自定义Mode：可以设置自定义的运行模式Mode，你也可以用CFRunLoopAddCommonMode添加到NSRUnLoopCommonModes中。', '2017-06-08 10:51:47', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1024', null, null, 'xiaoqi', 'DNSSEC是一种被设计出来防御DNS缓存中毒攻击的技术，实验过程中，我们需要禁止该技术。我们需要改变/etc/bind/named.conf.options文件：找到\"dnssec-validation auto\"这一行，并注释掉，然后添加新的一行。', '2017-06-01 10:51:58', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1025', null, null, 'wangshiyu', '在多窗口模式中，在指定时间只有最近与用户交互过的 Activity 为活动状态。 该 Activity 将被视为顶级 Activity。 所有其他 Activity 虽然可见，但均处于暂停状态。', '2017-06-03 10:52:10', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1026', null, null, 'xiaoqi', '每个线程都由一个Run Loop，主线程的Run Loop会在App运行的时自动运行，子线程需要手动获取运行，第一次获取时，才会去创建。', '2017-05-02 10:52:33', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1027', null, null, 'gycx', '计算机硬件是由运算器、控制器、存储器、输入/输出设备等设备组成的，而能够让机箱内各种设备各司其职东西就叫做——系统内核。内核负责驱动硬件、管理活动和分配/管理硬件资源，如此说来系统内核对计算机来讲可真的是太重要了，所以它不能直接让用户操作。', '2017-05-15 14:13:43', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1028', null, null, 'gycx', 'DNS服务器需要在启动时读取/etc/bind/named.conf配置文件，该配置文件通常需要导入一个选项文件，这里命名为named.conf.options，且将其放在/etc/bind/目录下，最后将下面的内容添加至该选项文件。', '2017-05-15 14:15:10', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1029', null, null, 'gycx', 'Run Loop的处理两大类事件源：Timer Source和Input Source(包括performSelector *方法簇、Port或者自定义的Input Source），每个事件源都会绑定在Run Loop的某个特定模式mode上，而且只有RunLoop在这个模式下运行的时候，才会触发Timer和Input Source。', '2017-05-15 14:15:33', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1034', null, null, 'gycx', '当setState方法调用的时候React就会重新调用render方法来重新渲染组件；setState通过一个队列来更新state。', '2017-05-26 17:34:34', '1014', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1035', null, null, 'qa', 'Classloader重写，通过自定义classloader加载相应的jsp编译后的class到JVM中。 通过动态修改内存中的字节码，将修改过的class再次装载到JVM中。', '2017-06-03 12:51:03', '1022', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1036', null, null, 'qa', 'inception结构的主要思想在于卷积视觉网络中一个优化的局部稀疏结构怎么样能由一系列易获得的稠密子结构来近似和覆盖。', '2017-05-15 10:21:33', '1026', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1037', null, null, 'snow', '使用HTTPS传输增加的开销不仅仅是两次TLS握手的过程。优化性能首先要知己知彼。了解性能损耗在哪里，才能有针对性的进行部署。', '2017-06-10 10:51:27', '1014', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1040', null, null, 'syf', '啥东西?看不懂!简单点不行吗?', '2017-05-27 14:10:20', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1042', null, null, 'syf', '就发货的数量方法里的世界很过分了低速级非得死丰富的似乎', '2017-05-27 14:34:20', null, '2', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1043', null, null, 'syf', '发GV哦嘿哦等级分为热狗VB热  ', '2017-05-27 14:34:35', '1042', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1044', null, null, 'syf', 'UR引入人', '2017-05-27 14:35:39', '1028', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1045', null, null, 'anchshn521h', '但是非常的舒服', '2017-05-27 14:36:08', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1046', null, null, 'anchshn521h', '的撒等会', '2017-05-27 14:39:00', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1047', null, null, 'anchshn521h', '萨达省', '2017-05-27 14:39:14', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1048', null, null, 'anchshn521h', '撒旦萨达萨达', '2017-05-27 14:39:43', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1049', null, null, 'anchshn521h', '阿瑟大时代', '2017-05-27 14:39:53', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1050', null, null, 'anchshn521h', '萨达萨达撒旦', '2017-05-27 14:40:08', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1051', null, null, 'anchshn521h', '沙发上地方', '2017-05-27 14:40:31', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1052', null, null, 'anchshn521h', '啊撒大事', '2017-05-27 14:41:44', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1053', null, null, 'wangshibo', 'jhjkhkkj', '2017-05-27 14:54:26', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1054', null, null, 'wangshibo', 'hahahhb', '2017-05-27 14:55:01', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1055', null, null, 'wangshibo', 'hehehhe ', '2017-05-27 14:55:15', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1056', null, null, 'wangshibo', 'afgaga', '2017-05-27 14:55:25', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1057', null, null, 'wangshibo', 'jhakjhfgkjawhgkjahlkjh', '2017-05-27 14:56:06', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1061', null, null, 'anchshn', 'asdadas', '2017-06-01 18:54:55', null, '2', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1063', '2', '1496888530108123123.png', 'asdasd', '哈哈哈', '2017-06-05 10:43:07', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1064', '2', '1496888530108123123.png', 'asdasd', 'sdfgsdfsdzfasfa', '2017-06-05 13:37:55', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1065', '0', null, 'syf', '嘿嘿,我不懂', '2017-06-06 15:34:06', '1002', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1066', '8', '1496734386532C[$63Y[1I7~78UYHG[}}ZYU.png', 'anchshn', '撒带我去', '2017-06-06 15:42:44', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1067', '0', null, 'syf', '地方换个地方还是感动过水电费', '2017-06-06 15:47:22', '1001', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1068', '12', '149673672342611.jpg', 'syf', '发过火', '2017-06-06 15:47:59', null, '2', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1069', '0', null, 'syf', '如教育厅', '2017-06-06 15:48:13', '1068', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1070', null, null, 'wangshibo', '到此一游', '2017-06-06 15:50:38', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1071', null, null, 'wangshibo', '到此一游', '2017-06-06 15:50:49', null, '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1072', null, null, 'wangshibo', '12', '2017-06-06 15:51:17', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1073', '0', null, 'wangshibo', '123', '2017-06-06 15:51:28', '1072', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1074', '11', 'timg1.jpg', 'ss', '333', '2017-06-06 15:51:53', null, '2', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1075', '11', 'timg1.jpg', 'ss', '22', '2017-06-06 15:52:46', null, '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1076', '0', null, 'ss', '111', '2017-06-06 15:52:54', '1074', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1077', '0', null, 'wangshibo', '哥哥王府井哈维空间划分空间啊', '2017-06-06 15:52:59', '1072', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1078', '0', null, 'ss', '111', '2017-06-06 15:52:59', '1074', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1079', '0', null, 'ss', '867', '2017-06-06 15:53:42', '1061', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1080', '0', null, 'ss', '756987', '2017-06-06 15:53:49', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1081', '11', 'timg1.jpg', 'ss', '345 345v ', '2017-06-06 15:55:09', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1082', '0', null, 'wangshibo', '123\r\n', '2017-06-06 15:59:02', null, '1', '视频', null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1083', '12', '149673672342611.jpg', 'syf', '很久没', '2017-06-06 16:12:06', null, '2', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1084', '0', null, 'syf', '和费用也就那么', '2017-06-06 16:12:18', '1083', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1085', '0', null, 'wangshibo', 'watqweghse', '2017-06-06 16:21:48', '1061', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1086', '0', null, 'wangshibo', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2017-06-06 16:22:12', '1083', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1087', '8', '1496734386532C[$63Y[1I7~78UYHG[}}ZYU.png', 'anchshn', '反方向GV十多个', '2017-06-06 16:22:40', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1088', '0', null, 'anchshn', '防守打法', '2017-06-06 16:22:57', null, '1', null, null, null, null, null, '1');
INSERT INTO `xz_discuss` VALUES ('1089', '0', null, 'ss', '是滴是滴所多', '2017-06-06 16:24:02', '1068', '1', null, null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1090', null, null, 'asdasd', '啊哈哈哈哈', '2017-06-07 16:31:59', null, '2', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1091', '0', null, 'asdasd', '再笑一个', '2017-06-07 16:32:10', '1090', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1092', '0', null, 'asdasd', '傻子\r\n', '2017-06-07 16:32:20', '1090', '1', '视频', null, null, null, null, '0');
INSERT INTO `xz_discuss` VALUES ('1093', null, null, 'asdasd', 'haha楼上两个傻子', '2017-06-14 14:52:09', null, '1', '视频', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_education
-- ----------------------------
DROP TABLE IF EXISTS `xz_education`;
CREATE TABLE `xz_education` (
  `education_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '学历表ID',
  `login_id` bigint(200) NOT NULL COMMENT '会员ID',
  `education` varchar(20) DEFAULT NULL COMMENT '学历 ',
  `school` varchar(20) DEFAULT NULL COMMENT '学校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `enrollment_date` date DEFAULT NULL COMMENT '入学时间',
  `graduate_date` date DEFAULT NULL COMMENT '毕业时间',
  `education_skill` varchar(2000) DEFAULT NULL COMMENT '专业技能',
  `delete_education_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(255) DEFAULT '0' COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xz_education
-- ----------------------------
INSERT INTO `xz_education` VALUES ('1', '2', '高中', '山东蓝翔', '机械工程', '2017-05-02', '2017-05-30', '挖掘机', null, null, null, null, '0');
INSERT INTO `xz_education` VALUES ('2', '2', '大专', '辽宁职业技术学院', '汽车工程', '2017-05-02', '2017-05-03', '挖掘机', null, null, null, null, '0');
INSERT INTO `xz_education` VALUES ('3', '8', '高中', 'sfdsf', 'ewrew', '2017-05-03', '2017-05-17', 'dsf', '2017-06-06', null, null, null, '1');
INSERT INTO `xz_education` VALUES ('4', '2', 'asd', 'asd', 'asd', '2017-06-05', '2017-06-06', 'asd', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_education` VALUES ('5', '2', 'fff', 'fff', 'fff', '2017-06-05', '2017-06-06', 'fff', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_education` VALUES ('6', '2', '高中', '清华', '挖掘机', '2017-05-29', '2017-07-08', '挖掘机', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_education` VALUES ('7', '8', '大专', '西安外事学院', '机电一体化', '2017-06-07', '2017-06-14', 'java', null, null, null, null, '0');
INSERT INTO `xz_education` VALUES ('8', '12', '高中', '芙蓉蛋糕', '讽德诵功', '2017-06-07', '2017-06-14', '奉公如法', null, null, null, null, '0');
INSERT INTO `xz_education` VALUES ('9', '16', '本科', '哈佛大学', '念经', '2017-05-30', '2017-06-30', '念经不困啊', null, null, null, null, '0');
INSERT INTO `xz_education` VALUES ('10', '19', '大专', '大声的', '的撒旦', '2017-05-29', '2017-06-15', '撒但是我', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_event
-- ----------------------------
DROP TABLE IF EXISTS `xz_event`;
CREATE TABLE `xz_event` (
  `event_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime DEFAULT NULL COMMENT '举办时间',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `event_place` varchar(200) DEFAULT NULL COMMENT '活动地点',
  `event_by` varchar(200) DEFAULT NULL COMMENT '主办人或主办方',
  `event_writer` varchar(200) DEFAULT NULL COMMENT '活动发布者',
  `event_title` varchar(200) DEFAULT NULL COMMENT '活动标题',
  `event_article` varchar(2000) DEFAULT NULL COMMENT '活动内容简介',
  `event_type` varchar(200) DEFAULT NULL COMMENT '活动类别',
  `event_image` bigint(11) DEFAULT NULL COMMENT '活动图片',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_event
-- ----------------------------
INSERT INTO `xz_event` VALUES ('1001', '2017-04-01 17:16:58', '2017-04-05 10:02:42', '沈阳', '先知蓝创', 'Tom', '面向对象', '我们常说高级语言分为：面向过程和面向对象。面向过程和面向对象都是解决实际问题的一种具体思路。解决简单问题可以使用面向过程解决，解决复杂问题：宏观上使用面向对象把握，细节处理上仍然使用面向过程\r\n\r\n面向对象思考方式：遇到复杂问题，先从问题中找到名词，然后确立这些名词哪些可以作为类，再根据问题需求确定类的属性和方法，确定类之间的关系。', '项目实战', '17', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1002', '2017-04-10 20:03:54', '2017-04-12 20:08:54', '大连', '软件园', 'Jenny', 'java中的几个线程安全/非安全类', 'Arraylist是非线程安全的，其对应的线程安全类是Vector\r\nHashMap是非线程安全的，其对应的线程安全类是Hashtable\r\nStringBuilder是非线程安全的，其对应的线程安全类是StringBuffer', '企业宣传', '18', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1003', '2017-04-02 11:33:48', '2017-04-06 21:00:00', '鞍山', '东软', 'Jackson', 'ArrayList,LinkedList的对比', 'LinkedList的实现方式\r\n\r\n内部采用双向链表Node内部类来存储数据，由于采用了双向链表，LinkedList也可以当做栈和队列来使用，但是效率比较低，Java提供了ArrayDeqeue的高效率实现。', '行业规划', '19', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1004', '2017-04-01 00:00:00', '2017-05-01 00:00:00', '丹东', '软件园', 'Kenny', '学习Java分为几个阶段，分别是什么？', '多年前我自学的时候是很茫然，上网问问题，总是一堆外行的人说很难啊，你需要这样需要那样，不然就是，一堆人说一些空话，多看多写，买好书，我很无语，除了这些就没有自己的一些想法吗？ \r\n首先很多人认为学JAVA要C的基础，但是实际上不用，学开车，我不想先学骑自行车，没有必要。第一阶段： \r\n1． JAVA语法和基础，包括循环。。和类的相关内容，如实现，继承什么的 \r\n2． 你需要掌握几个重点的集合，List接口的两个子类LinkedList,ArrayList;然后是Map几口的两个子类HashMap，HashTable；Set接口 掌握List后学Set就容易了；掌握Collection和Collections的区别 \r\n3．掌握IO一章，重点的几个流 InputStream,OuputStream;BufferedReader,BufferedWrite; \r\nObjectInputStream, ObjectOutputStream,,PrintWriter，FileReader,FileWriter了解JAVA的序列化,掌握JAVA的File类。 \r\n4．JDBC非常重要，重点掌握Connection，PreparedStatement, Statement,ResultSet, 其他的可以在学习或项目中如果碰到再学，但早期重点掌握前面几个，其他了解足够， \r\n数据库建议新手用MySql,下载Navicat for MySQL管理工具 \r\n5.如果你想快速上手的话，那么你需要跳过这些， \r\n包括：线程，网络编程，GUI编程。好的，现在你可以进入第二阶段了\r\n\r\n1． HTML+JAVASCRIPT不必说了，掌握多少看自己把握了，CSS做了解 \r\n2． JSP+Servlet，你需要重点掌握几个，Request,Response,Session，其次是Application.\r\n\r\n另外你需要知道Redirect,ForWard的区别，Servlet的生命周期等 \r\n3． 标签方面：（1）掌握EL表达式；（2）最好掌握JSTL标签，不会也可，但如果掌握了JSP标签，学JSTL也十分简单，重点是迭代标签和格式化标签， \r\n4． 学习AJAX，简单点就行了，无需深入研究 \r\n5． 掌握了上面的，你可以继续学习框架:Struts2.0；Hibernate3；Spring 2.0 \r\n6． 如果上面你都做到的话，并且在期间做了2到3个项目的话，OK你可以参加工作了 \r\n这只是我给新人的一点指引，并非JAVA要学的全部。', '技术宣讲', '29', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1005', '2017-04-03 00:00:00', '2017-04-07 00:00:00', '沈阳', '东软', 'Mark', '从构造函数看线程安全', '线程是编程中常用而且强大的手段，在使用过程中，我们经常面对的就是线程安全问题了。对于Java中常见的数据结构而言，一般的，ArrayList是非线程安全的，Vector是线程安全的；HashMap是非线程安全的，HashTable是线程安全的；StringBuilder是非线程安全的，StringBuffer是线程安全的。\r\n\r\n然而，判断代码是否线程安全，不能够想当然，例如Java 中的构造函数是否是线程安全的呢？ \r\n\r\n自己从第一感觉来看，构造函数应该是线程安全的，如果一个对象没有初始化完成，怎么可能存在竞争呢？ 甚至在Java 的语言规范中也谈到，没有必要将constructor 置为synchronized，因为它在构建过程中是锁定的，其他线程是不可能调用还没有实例化好的对象的。其中 MakeObjects 是一个 Supplier 通过get（）方法产生一个 List. 这个 List 从 每个HasID 对象中得到一个ID。test() 方法创建了两个并行的CompletableFutures 来运行MakeObjects suppliers, 然后就每个结果使用Guava库的Sets.intersection() 来找出两个List中有多少个共有的ID。现在，测试一下多个并发任务调用这个StaticIDField类的结果：有大量的重复值，显然 static int 不是线程安全的。', '企业宣传', '30', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1006', '2017-04-03 14:57:11', '2017-04-07 21:00:00', '鞍山', '软件园', 'Kim', '如何实现和提升软件易用性', '今天给大家分享一个同事的工作感言。近两三年做管理类、工具类软件设计，对软件易用性提升和UI设计有一些体会和思考。很显然，软件的易用性与UI设计是直接相关的。下面，我们从软件研发过程来看一下如何提升软件易用性。上下文梳理是明确研发系统与哪些外部实体存在关系。在梳理软件的上下文的时候，一般会更加关注与软件系统有直接功能交互关系的实体，有时会忽略软件系统的用户，而明确软件的用户，是易用性提升的起点。\r\n因此，在上下文梳理时需要明确软件的目标用户。例如某个软件的目标用户是外部客户和内部服务工程师，那么在上下文分析的时候，应该明确出来。需要注意的是，在对软件首个版本分析上下文的时候，不能只看软件当前版本范围的需求，而是需要看软件所有的需求，例如当前版本做不面向外部客户的特性，但在上下文分析的时候仍然需要明确出来，否则容易遗漏影响架构的需求。2、需求场景分析\r\n• 使用场景定义\r\n从易用性分析出发，前面上下文分析明确了用户角色，这里要围绕用户角色来梳理用户的使用场景。使用场景表明了软件被用户用来干什么。\r\n梳理使用场景，即基于对用户对软件业务/功能诉求的理解，进行场景的定义。基于使用场景对软件的各个大大小小相关的需求特性进行归类，便于下一步的需求分析。更重要的是，使用场景是UI设计的重要依据和输入。\r\n• 需求特性的易用性分析\r\n需求特性的场景分析，通常是按业务/功能特性的维度展开，围绕系统和外部实体之间，对业务/功能特性的功能交互过程进行澄清和细化。\r\n从易用性分析的角度出发，在对需求特性进行场景分析的时候，需要强调的地方是：关注业务/功能特性对易用性的特定要求，例如需要给用户呈现哪些信息，呈现信息的要求，提供哪些操作功能等。\r\n易用性分析只是对需求场景分析过程增加了一些要求，并非引入了另一个独立的分析活动，在', '项目实战', '31', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1007', '2017-04-02 19:25:11', '2017-04-06 14:58:49', '北京', '先知蓝创', 'Max', '以太网进化历程半景-从10Mbps到1Tbps', '场景分析的活动中就一次性完成了，因此易用性分析没必要单独拆分出来作为一项独立活动，否则会带来很多重复和工作量浪费。软件易用性设计约束或要求梳理\r\n除了特定需求特性在易用性方面的要求在场景分析中完成，软件在易用性方面有一些公共的设计约束或要求需要梳理，包括：\r\n呈现风格要求：如采用网页的平铺式呈现风格，或传统的窗口式风格等。\r\n呈现信息要求：确定呈现信息的风格，如左树右表方式或者其它的风格；页面刷新速率等。\r\n使用操作要求：如采用导航式组织操作、提供功能快捷入口、操作响应延迟、操作步骤、操作集中还是分散等。\r\n可扩展性要求：信息和和操作功能的组织和呈现，能够方便软件未来功能的扩展，例如要求支持UI可定制或可配置驱动页面呈现等。', '行业规划', '32', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1008', '2017-04-04 12:30:37', '2017-04-08 14:21:48', '天津', '中软', 'Lisa', '带你深入理解传递参数', '基于前面分析给出的使用场景以及易用性设计约束和要求，UI框架视图的内容包括：\r\n确定UI的呈现模式：如采用网页的平铺式呈现，或传统的窗口式等。\r\n确定页面区域布局的方案：包括操作功能布局和信息组织布局，以UI框架草图的形式呈现。\r\nUI设计原则和约束。\r\n同软件架构设计的其它技术方案一样，UI架构设计方案也需要反复权衡并做出选择。同时，UI架构设计主要是确定后续UI设计的方向，因此在这个阶段不必急于深入具体的细节。\r\nUI的架构设计最好由软件设计师来负责，UI设计师参与讨论和评审，给出专业意见。这是因为对UI进行架构设计，需要对软件的产品概念和软件业务功能场景有深刻的理解和认识才行。\r\n软件的产品概念除了包括软件是什么、能干什么，还包括软件应该长什么样子。在软件设计过程中不能破坏概念的完整性。例如打算做的是一款给专业人士用的专业软件，需要UI体现专业性，让用户容易对软件功能产生信赖感。如果在UI设计时过于花哨或娱乐化，无法体现专业性，这样就破坏了软件产品概念的完整性，导致软件设计失败。', '技术宣讲', '17', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1009', '2017-04-04 15:03:21', '2017-04-08 18:12:45', '鞍山', '东软', 'Simon', 'Java 注解那些事儿', '另外，UI是表象，软件业务功能是内涵，UI服务于软件的业务功能场景。\r\n对软件的产品概念理解最准确的应该是软件设计师，对软件的业务功能场景理解最准确的也是软件设计师，因此，UI的架构设计最好由软件设计师来负责。\r\n由于UI设计师在其专业方面经验更加丰富，对业界趋势和友商情况更加了解，UI设计师参与设计讨论和评审，给出专业意见，有助于弥补软件设计师在UI设计专业领域方面存在的短板。\r\n现实情况下存在这样的做法：由UI设计师负责UI的设计。由于UI设计师并不熟悉软件业务，就需要软件设计师在旁边“指导”。由于存在学习和沟通的成本，自然效率不可能高的。更可能发生的情况是：软件设计师可能忙着其它设计工作而疏于“指导”，UI设计师不得不自己摸着石头过河，这样就很容易发生设计方向偏差，从而导致更大的返工', '行业规划', '18', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1010', '2017-04-05 09:01:33', '2017-04-09 22:57:06', '上海', '先知蓝创', 'Willam', '梯度下降优化算法综述', '一般通过低保真设计，就能展示出软件会做成什么样子，高保真一般是在低保真方案定稿后才进行，在此之前低保真设计反复讨论评审、迭代优化。现实情况下，这个设计阶段容易出现的问题是：容易议而不决。导致议而不决的原因，大致有如下几方面：\r\n参与评审的意见会很多，特别是如果做的是一款各方关注的软件，那方方面面的意见最好都要征集到。\r\nUI的评审意见很容易提：不需要很懂技术，每个人都能根据自己的审美和体验提出意见，有些能给出与现有设计完全不同的建议。审美相关的意见无所谓对错，也导致了很难做取舍（想以理服人很难做到）。\r\n意见声音的“大”和“小”，也或多或少会影响到设计方案的裁决。', '项目实战', '19', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1011', '2017-04-05 11:20:16', '2017-04-09 08:33:46', '天津', '软件园', 'Cici', '实现多线程切换和调度实验介绍', '从软件研发的进展来看，议而不决的状态是不能接受的，无论如何UI设计都要在适当的时刻进行基线化，这样软件的研发过程才能继续按计划推进。因此，对软件设计师和UI设计师来说，既要充分考虑各方意见，又要把握UI架构设计确定的原则和方向不丢失、不偏离，同时仔细鉴别真正代表用户、符合使用场景的意见。\r\n如果实在不能和所有人达成一致，那就需要设计师果断裁决，设计必须最终由设计师说了算。', '技术宣讲', '29', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1012', '2017-04-02 23:11:08', '2017-04-06 05:12:09', '丹东', '中软', 'Lucy', '实战卷积神经网络', '前面UI设计的评审讨论，基本上还是“纸上谈兵”。软件真正用起来，好不好用立刻就有感觉了，用户可以体验到软件的真实操作响应、页面刷新速度、信息呈现的效果等，这些是无法通过低保真/高保真体验到的。这样软件在交付前可以有针对性进行优化。\r\n因此，尽早组织软件试用是一个确保软件交付时的易用性质量的有效性手段。总之，提升软件的易用性的有效途径包括：\r\n需求阶段明确软件的用户、使用场景和易用性的设计约束和要求。\r\n开展或加强UI的架构设计活动，给出UI框架视图。\r\n在UI的低保真/高保真设计阶段，把握UI架构设计确定的原则和方向不丢失、不偏离，同时仔细鉴别真正代表用户、符合使用场景的意见，果断决策避免议而不决。\r\n软件开发完成后尽早组织软件试用，在交付前可以有针对性进行优化，确保软件交付时的易用性质量。', '项目实战', '30', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1013', '2017-04-04 03:58:22', '2017-04-08 17:29:58', '沈阳', '东软', 'Peter', '基于Servlet的技术问答网站系统实现', 'Nginx安装好之后，开始使用它来简单实现反向代理与负载均衡的功能。在这之前，首先得脑补一下什么是反向代理和负载均衡。\r\n\r\n  反向代理：是指以代理服务器来接收Internet上的请求，然后将请求转发到内部网络的服务器上，并将结果返回给Internet上连接的客户端，此时的代理服务器对外就表现为反向代理服务器。\r\n\r\n   通俗来讲，反向代理服务器就好比我们常说的中介，Internet客户端可以看作是租房的客户，而内部网络的服务器好比是房东。租户通过中介与房东沟通，最后租到房子。', '企业宣传', '31', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1014', '2017-04-05 17:34:20', '2017-04-09 11:11:11', '上海', '先知蓝创', 'Olivia', '分布式系统常见的事务处理机制', '我们从外部进行访问时，实际访问的是Nginx服务器，但是Nginx服务器将我们的请求转发给内部的tomcat服务器，从外相来看，我们访问的是Nginx，实际上是tomcat。此时的Nginx服务器就作了反向代理的功能，这样的优点就是，众多用户同时访问一台服务器，通过反向代理，可以实现将请求转向多台内部服务器，既能加快处理的速度，又能减轻服务器的压力。\r\n\r\n简单的反向代理与负载均和实例就完成了，看似很简单的功能，但是对于Linux菜鸟来说在操作时会遇到各种问题。比如修改配置文件，如何使用命令来操作等，当然等熟练之后也就得心应手了，而且现在有好多专门的工具进行文件的修改。', '项目实战', '20', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1015', '2017-04-03 05:06:48', '2017-04-05 13:08:09', '北京', '中软', 'John', 'RSA算法 JS加密 JAVA解密', '为保障系统的可用性、可靠性以及性能，在分布式系统中，往往会设置数据冗余，即对数据进行复制。举例来说，当一个数据库的副本被破环以后，那么系统只需要转换到其他数据副本就能继续运行下去。另外一个例子，当访问单一服务器管理的数据的进程数不断增加时，系统就需要对服务器的数量进行扩充，此时，对服务器进行复制，随后让它们分担工作负荷，就可以提高性能。但同时，如何保障多个数据节点之间数据的一致以及如何处理分布式事务，将成为为一个复杂的话题。本文将介绍常用的事务处理机制。', '项目实战', '21', null, null, null, null, '0');
INSERT INTO `xz_event` VALUES ('1016', '2017-04-01 12:12:12', '2017-04-06 12:12:12', '深圳', '先知蓝创', 'Amy', 'PHP 会话控制 cookie与session 全解析', '其实，数据的一致性也分几种情况，大致可以分为：\r\n\r\nWeak 弱一致性：当你写入一个新值后，读操作在数据副本上可能读出来，也可能读不出来。比如：某些存储系统，搜索引擎，实时游戏，语音聊天等，这些数据本文对完整性要求不高，数据是否一致关系也不大。\r\nEventually 最终一致性：当你写入一个新值后，并不一定能马上读出来，但在某个时间窗口之后保证最终能读出来。比如：DNS，电子邮件，消息中间件等系统，大部分分布式系统技术都采用这类模式。\r\nStrong 强一致性：新的数据一旦写入，在任意副本任意时刻都能读到新值。比如：文件系统，RDBMS都是强一致性的。\r\n也就是说，在设计分布式系统时，我们并不一定要求是强一致性的，根据应用场景可以选择弱一致性或者是最终一致性。', '技术宣讲', '22', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_image
-- ----------------------------
DROP TABLE IF EXISTS `xz_image`;
CREATE TABLE `xz_image` (
  `image_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image_type` varchar(200) DEFAULT NULL COMMENT '图片类别',
  `image_path` varchar(2000) DEFAULT NULL COMMENT '图片路径',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`image_id`),
  KEY `image_type_id` (`image_type`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_image
-- ----------------------------
INSERT INTO `xz_image` VALUES ('1', '师资', 'fc.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('2', '师资', 'fc1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('3', '师资', 'fc2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('4', '师资', 'fc3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('5', '师资', 'fc4.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('6', '师资', 'fc5.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('7', '师资', 'fc6.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('8', '师资', 'fc7.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('9', '师资', 'fc8.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('10', '项目', 'q1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('11', '项目', 'q2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('12', '项目', 'q3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('13', '博客', 'blog1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('14', '博客', 'blog2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('15', '博客', 'blog3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('16', '行业动态', 'course.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('17', '活动', 'e1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('18', '活动', 'e2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('19', '活动', 'e3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('20', '近期活动', 't4.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('21', '近期活动', 't2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('22', '近期活动', 't7.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('23', '近期博客', 't1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('24', '近期博客', 't8.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('25', '近期博客', 't3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('26', '博客', 'b1.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('27', '博客', 'b2.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('28', '博客', 'b3.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('29', '活动', 'dd.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('30', '活动', 'fff.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('31', '活动', 'hh.jpg', null, null, null, '0');
INSERT INTO `xz_image` VALUES ('32', '活动', 'hj.jpg', null, null, null, '0');

-- ----------------------------
-- Table structure for xz_item
-- ----------------------------
DROP TABLE IF EXISTS `xz_item`;
CREATE TABLE `xz_item` (
  `item_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '项目编号(主键)',
  `item_title` varchar(200) DEFAULT NULL COMMENT '项目标题',
  `item_article` varchar(2000) DEFAULT NULL COMMENT '项目简介',
  `item_writer` varchar(200) DEFAULT NULL COMMENT '发布者',
  `item_time` datetime DEFAULT NULL COMMENT '发布时间',
  `item_image` bigint(11) DEFAULT NULL COMMENT '图片',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_item
-- ----------------------------
INSERT INTO `xz_item` VALUES ('1001', 'JAVA', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。', 'Jenny', '2017-03-27 19:21:11', '10', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1002', 'HTML5', 'HTML5将会取代1999年制定的HTML 4.01、XHTML 1.0标准，以期能在互联网应用迅速发展的时候，使网络标准达到符合当代的网络需求，为桌面和移动平台带来无缝衔接的丰富内容。', 'Kate', '2017-04-15 11:35:28', '11', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1003', '大数据', '大数据指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产。', 'Tom', '2017-05-05 08:01:48', '12', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1004', 'iOS', 'iOS是由苹果公司开发的移动操作系统。苹果公司最早于2007年1月9日的Macworld大会上公布这个系统，最初是设计给iPhone使用的，后来陆续套用到iPod touch、iPad以及Apple TV等产品上。iOS与苹果的Mac OS X操作系统一样，属于类Unix的商业操作系统。', 'John', '2017-04-09 03:05:58', '10', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1005', 'ASP.NET', 'ASP.NET又称为ASP+，不仅仅是ASP的简单升级，而是微软公司推出的新一代脚本语言。ASP.NET基于.NET Framework的Web开发平台，不但吸收了ASP以前版本的最大优点并参照Java、VB语言的开发优势加入了许多新的特色，同时也修正了以前的ASP版本的运行错误。', 'Jackson', '2017-04-29 13:28:33', '11', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1006', '云计算', '云计算（cloud computing）是基于互联网的相关服务的增加、使用和交付模式，通常涉及通过互联网来提供动态易扩展且经常是虚拟化的资源。云是网络、互联网的一种比喻说法。过去在图中往往用云来表示电信网，后来也用来表示互联网和底层基础设施的抽象。', 'Lisa', '2017-04-06 15:08:57', '12', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1007', 'PHP', 'PHP是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。PHP 独特的语法混合了C、Java、Perl以及PHP自创的语法。它可以比CGI或者Perl更快速地执行动态网页。', 'Mary', '2017-05-10 07:09:15', '10', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1008', '物联网', '物联网是新一代信息技术的重要组成部分，也是“信息化”时代的重要发展阶段。顾名思义，物联网就是物物相连的互联网。这有两层意思：其一，物联网的核心和基础仍然是互联网，是在互联网基础上的延伸和扩展的网络；其二，其用户端延伸和扩展到了任何物品与物品之间，进行信息交换和通信，也就是物物相息。', 'Susan', '2017-03-13 23:10:11', '11', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1009', 'C++', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。C++擅长面向对象程序设计的同时，还可以进行基于过程的程序设计，因而C++就适应的问题规模而论，大小由之。', 'Amy', '2017-04-25 19:10:25', '12', null, null, null, '0');
INSERT INTO `xz_item` VALUES ('1010', 'Oracle', 'Oracle Database，是甲骨文公司的一款关系数据库管理系统。它是在数据库领域一直处于领先地位的产品。可以说Oracle数据库系统是目前世界上流行的关系数据库管理系统，系统可移植性好、使用方便、功能强，适用于各类大、中、小、微机环境。它是一种高效率、可靠性好的 适应高吞吐量的数据库解决方案。', 'Mark', '2017-03-06 23:26:59', '10', null, null, null, '0');

-- ----------------------------
-- Table structure for xz_leave_message
-- ----------------------------
DROP TABLE IF EXISTS `xz_leave_message`;
CREATE TABLE `xz_leave_message` (
  `id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `leave_id` bigint(200) DEFAULT NULL COMMENT '被留言者ID',
  `login_id` bigint(200) DEFAULT NULL COMMENT '留言者ID',
  `message` varchar(200) DEFAULT NULL COMMENT '留言内容',
  `status` int(2) DEFAULT NULL COMMENT '查看状态 1未查看 2已查看',
  `delete_type_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(255) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(255) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(255) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(2) DEFAULT NULL COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_leave_message
-- ----------------------------

-- ----------------------------
-- Table structure for xz_login
-- ----------------------------
DROP TABLE IF EXISTS `xz_login`;
CREATE TABLE `xz_login` (
  `login_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '登录表ID',
  `login_count` varchar(50) DEFAULT NULL COMMENT '账号',
  `login_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `login_type` int(10) NOT NULL DEFAULT '0' COMMENT '登录类型 0个人 1公司',
  `login_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `login_active` int(10) NOT NULL DEFAULT '0' COMMENT '激活状态 0未激活 1激活 ',
  `delete_login_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_login
-- ----------------------------
INSERT INTO `xz_login` VALUES ('1', 'admin123', '123123', '0', null, '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('2', 'asdasd', 'e341450e51b6ae4f266c8963f88f825e', '1', '651049136d@qq.com', '1', '2017-06-01', null, null, null, '0');
INSERT INTO `xz_login` VALUES ('4', 'qweqwe', 'efe6398127928f1b2e9ef3207fb82663', '2', 'wangtianyue001@163.com', '1', '2017-06-01', null, null, null, '0');
INSERT INTO `xz_login` VALUES ('5', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', '1', '1209299055@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('7', 'ccc', '9df62e693988eb4e1e1444ece0578579', '2', 'aaa@aa.aa', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('8', 'anchshn', '202cb962ac59075b964b07152d234b70', '1', '306452874@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('10', 's', '03c7c0ace395d80182db07ae2c30f034', '1', '747122355@qq.co', '2', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('11', 'ss', '3691308f2a4c2f6983f2880d32e29c84', '1', '747122355@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('12', 'syf', '202cb962ac59075b964b07152d234b70', '1', '1806300322@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('13', 'sl', '54a2bf8c09ace67d3513aaa1aa7aa0f3', '1', '774843012@qq.com', '2', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('14', 'wangshibo', '202cb962ac59075b964b07152d234b70', '1', '943132119@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('16', 'gycx', '202cb962ac59075b964b07152d234b70', '1', '459269519@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('18', 'ggg', 'ba248c985ace94863880921d8900c53f', '2', '1350630059@qq.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('19', 'anchshn521h', 'abc48663eb03f6c72908fd84a4d9b9e0', '1', 'lei19880211@126.com', '1', null, null, null, null, '0');
INSERT INTO `xz_login` VALUES ('20', 'ceshi', '698d51a19d8a121ce581499d7b701668', '1', '651049136@qq.com', '1', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_member
-- ----------------------------
DROP TABLE IF EXISTS `xz_member`;
CREATE TABLE `xz_member` (
  `member_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '会员信息表ID',
  `login_id` varchar(200) DEFAULT NULL COMMENT '账号',
  `member_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `member_sex` int(10) DEFAULT '0' COMMENT '性别_0:男_1:女',
  `member_age` int(10) DEFAULT NULL COMMENT '年龄',
  `member_education` varchar(10) DEFAULT NULL COMMENT '学历',
  `member_IDcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `member_picture` varchar(200) DEFAULT NULL COMMENT '相片路径',
  `member_phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `member_address` varchar(20) DEFAULT NULL COMMENT '居住地址',
  `member_email` varchar(20) DEFAULT NULL COMMENT '用户邮箱',
  `delete_member_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_member
-- ----------------------------
INSERT INTO `xz_member` VALUES ('1', '2', '哈哈哈', '1', '20', '本科', '210114199412090334', '1496888530108123123.png', '13840476545', '沈阳', '651049136@qq.com', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('2', '5', null, '0', null, null, null, 'timg1.jpg', null, null, null, null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('4', '8', '甘汝雷', '1', '30', '本科', '211422198702444512', '1496734386532C[$63Y[1I7~78UYHG[}}ZYU.png', '13190069232', '沈阳市于洪区迎宾路', '306455sad2qwwq', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('5', '9', null, '0', null, null, null, 'timg1.jpg', null, null, null, null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('6', '10', null, '0', null, null, null, 'timg1.jpg', null, null, null, null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('7', '11', 'qwer', '1', '18', '硕士', '211422199205205415', 'timg1.jpg', '15802495555', '77', '77', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('8', '12', '宋亚峰', '1', '12', '大专', '210321199312260214', '149673672342611.jpg', '15196237122', '萨达', '123', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('9', '13', null, '0', null, null, null, 'timg1.jpg', null, null, null, null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('10', '14', '大杀特杀', '1', '12', '博士', '210725199502304785', 'timg1.jpg', '13149836985', '12', '943132119@qq.com', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('11', '15', null, '0', null, null, null, 'timg1.jpg', null, null, null, null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('12', '16', '哇哈哈', '1', '50', '研究生', '210411199955664567', 'timg1.jpg', '15042368599', '老司机法律手段顾客花里胡哨', '459269519@qq.com', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('13', '19', '洪七公', '1', '108', '博士', '211455196502351245', '1496738095832N3~[4B@C0PWCRG1CIL90_D5.png', '13190064521', '沈阳市三好街', 'lei1988Q126.com', null, null, null, null, '0');
INSERT INTO `xz_member` VALUES ('14', '20', '哈哈哈', '1', '32', '本科', '210114199412090334', 'timg1.jpg', '13840476517', '沈阳', '651049136@qq.com', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_news
-- ----------------------------
DROP TABLE IF EXISTS `xz_news`;
CREATE TABLE `xz_news` (
  `news_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_writer` varchar(200) DEFAULT NULL COMMENT '发布者',
  `news_title` varchar(200) DEFAULT NULL COMMENT '动态标题',
  `news_article` varchar(2000) DEFAULT NULL COMMENT '动态内容',
  `news_date` date DEFAULT NULL COMMENT '发布日期',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  FULLTEXT KEY `aa` (`news_title`)
) ENGINE=MyISAM AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_news
-- ----------------------------
INSERT INTO `xz_news` VALUES ('1001', 'Kate', '为什么程序员话少钱多死得早？-一位人生悲惨的程序员与你讲述其中原因', '为什么有人说我们话少：\r\n\r\n首先我们来看看说程序员话少的群体是什么？\r\n\r\n程序员的女朋友，如果有的话。\r\n程序员的非程序员朋友。\r\n从来没有遇到过程序员的人，通过网络以及其他途径了解程序员群体的人。\r\n第一，程序员的女朋友其实应该是最了解程序员的人，但是他们为什么会这么说程序员，话少呢？这个原因是和程序员本身有关，程序员由于大学四年加上工作几年投身于国家的互联网IT事业当中，天天加班，除了同学聚会，没有社交场合，而同学聚会都是熟人，程序员根本不会和陌生人打交道，最主要的社交手段就是网络聊天，和女友在一起的时候，见到活的女友，很少会有程序员对女友油嘴滑舌，因为他们会不好意思说出口，但是你会发现，如果你和一个程序员聊QQ聊微信的话，他们很会BB的。而且程序员和女友话少还有一个原因，放在后面讲。 \r\nPS：不要和程序员斗图，你会死的很惨。为什么没共同语言呢，因为我们满脑子想的都是编程方面的东西，而你不懂什么是Android开发，你不懂什么是后台什么是数据库，你不懂iOS开发用的是oc或Swift，你不懂web前段现在多么火，所以我不知道和你说些什么好。一个连1024的概念都没有的人，我和他说不出什么来。为什么说不出呢，还是放到后面。其实好多程序员都是这样，都有一些小小的鄙视他人的感觉，“你看，我知道好多语言，好多技术，框架，系统。而普通的凡人怎么明白其中道理？？？”所以有时候我们是无意识的不屑说话。只是我们自己没察觉到自己的这种傲气而已。\r\n\r\n三， 从来没有遇到过程序员的人，通过网络以及其他途径了解程序员群体的人。他们说程序员话少，是因为在网络得知程序员很闷，恩，很好很自然，没毛病。我们为什么话少：\r\n\r\n好了上面我们挖了两个坑，一个是程序员和女朋友没话说，一个是程序员和自己的非程序员朋友没话说，现在要填坑了。\r\n\r\n其实这两个坑算一个坑。这个坑要怎么解释，我们还要看到我最开始说的话：”其实最开始听到这个词的时候我是拒绝的。”我听到这个词的时候，那是后我还是个准程序员，一些程序员经历过的事我没有经历过，现在我是一个实习程序员，一些事也慢慢地懂了。我是我不和你们说话，而是每次我说的时候，你们不懂，不认同，我无法说。程序员的最大共同特点就是想让人认同我，给我存在感。\r\n\r\n最开始我们为什么做程序员？因为在我们不懂编程的时候，写出来一个helloworld的成就感大大的满足了我们，我们写程序有很大原因是拿来炫耀的。我们能做出来别人做不出来的东西，或者说别人正在用的软件我们是能做出来的，我们觉得自己很吊，我们的存在感爆棚，想想当你在大学时，写出几个程序，给别人看，别人都很羡慕，写出一个软件，别人正在讨论的火热的app你能做出来，别人又觉得你diao。可是后来我们就变了。\r\n\r\n后来我们在IT的路上越走越远，越陷越深，研究各种算法框架新特性等等。我们渐渐地发现，在我们身边的人还在探讨着陪着他们度过这段时间的热剧时，在他们探讨着陪着他们这段时间的火热的游戏的时候，我们想探讨陪我们度过这段时间的技术的时候，已经没有人可以作为我们的倾诉对象了。\r\n\r\n编程是孤独的。逐渐的我们发现，当和别人聊天的过程中，感觉自己与这个世界格格不入。别人找你时，问你在干嘛呢？回答敲代码呢，编程呢，别人就会以为你在炫耀，因为在非IT人的眼里，搞IT是一件高智商的事情，甚至是高逼格的事情，所以他们会觉得你在炫耀你的智商，你的职业，你的优越感。所以当我们回答“工作呢“的时候，他们又会觉得你在炫耀你的工作。这世界从来都是这样，所有人都不希望身边的人过的比自己好。而在我们敲代码且沉浸其中时，别人的请求我们通常会说待会或者等会，这时候别人就会觉得我的事没你的代码重要。其实是他们不懂得我们现在所做的工作的重要罢了。以上只是我举的说话的一个例子，他代表了我们程序员与人交流的时候的代沟，这种代沟出现的原因是，我们在我们最该锻炼与人交际能力的时候，把精力全都投入了敲代码的事情，所以我们不善交际，所以我们出现了鸿沟。还有一方面。就是在老家，尤其是很多人在一起聊天的时候。长辈们聊天最喜欢问的就是工作和对象。对象是一定没有的，不用说了，当同辈的别人有对象的时候，这时候大家回和他聊起他的感情生活，例如对象工作是什么，哪里人，打算结婚吗？什么时候结婚。这时候我们程序员只能站在一边，没有说话的机会。而不谈对象这个话题，谈工作的话，我们还是吃亏的，一谈起工作，我们说我们做的什么什么app或者什么什么后台什么什么系统，大家都不明白怎么回事，刚开始可能还有人瞎猜，是不是修电脑啊或者巴拉巴拉之类的，我们当然极力说不是不是，然后大家都搞不懂你的工作，就没人谈论你的工作，你又不知如何解释，（是从C语言开始给他们解释呢？还是先从二进制说起？）当然你就无语的说不上话了。', '2017-04-20', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1002', 'Mark', 'JavaScript引用是如何工作的', '摘要：JavaScript中没有指针，并且JavaScript中的引用与我们通常看到的大多数其他流行编程语言的工作方式不同。在JavaScript中，不可能有一个变量到另一个变量的引用。而且，只有复合值（例如对象或数组）可以通过引用来赋值。\r\n\r\n整片文章中将使用下列属于：\r\n1、标量–单个值或数据单元（如整数、布尔值、字符串）\r\n2、复合--由多个值组成（如数组、对象、集合）\r\n3、原始 - 直接的价值，而不是对包含值的东西的引用。\r\nJavaScript的标量类型是原语，不像其他一些语言（如Ruby）具有标量引用类型。注意，在JavaScript中，标量原始值是不可变的，而复合值是可变的。\r\n概要：\r\n1.分配给变量的值的类型决定该值存储的是值还是引用。\r\n2.在变量赋值的时候，标量原始值（Number，String，Boolean，undefined，null，Symbol）通过值来赋值，复合值通过引用来赋值。\r\n3.JavaScript中的引用仅指向包含的值，不指向其他变量或引用。\r\n4.在JavaScript中，标量原始值是不可变的，复合值是可变的。\r\n通过值赋值的快速示例\r\n在下面的代码片段中，我们将一个标量原始值（一个数字）分配给一个变量，因此这里是通过值来赋值。首先，变量 batman被初始化，当变量superman被分配存储在batman中的值的时候，实际上是创建了该值的一个副本并存储在变量superman中。当变量superman被修改时，变量batman不会受到影响，因为它们指向不同的值。通过引用赋值的快速示例\r\n在下面的代码片段中，我们将一个复合值（数组）赋值给一个变量，因此这里是通过引用赋值。变量flash和quicksilver是相同的值（也称为共享值）的引用。当修改共享值时，引用将指向更新的值。如何创建一个新的引用\r\n当变量中的复合值被重新赋值的时候，将创建一个新的引用。在JavaScript中，与大多数其他流行的编程语言不同是：引用指向存储在变量中的值，不指向其他变量或者引用。当引用作为函数参数传递时，引用如何工作\r\n在下面的代码片段中，变量magneto是一个复合值（一个数组），因此它作为一个引用被赋值给了变量x（函数参数）。\r\n\r\n在IIFE中调用的Array.prototype.push方法会通过JavaScript引用来改变变量中的值。但是，变量x的重新赋值会创建一个新的引用，并且对变量x的进一步修改不会影响到变量magneto的引用。                                 如何更改作为函数参数通过JavaScript引用传递的复合变量中的原始值\r\n这里的解决方案是修改引用指向的现有复合值。在下面的代码片段中，变量wolverine是一个复合值（一个数组）并且在IIFE中被调用，变量x（函数参数）是被赋值了一个引用。\r\n可以通过将属性Array.prototype.length的值设置为0来创建一个空数组。因此，变量wolverine通过JavaScript引用更改为变量x中的新值。如何通过按值赋值来存储复合值\r\n这里的解决方案是制作复合值的手动副本，然后将复制的值分配给变量。因此，分配值的引用不指向原始值。\r\n创建一个（浅）复合值副本（数组对象）推荐调用Array.prototype.slice方法，而不传递任何参数。\r\n总结\r\n很好地理解JavaScript中的引用可以帮助开发人员避免许多常见的错误，并编写出更好的代码。\r\n编码快乐！！', '2017-04-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1003', 'John', '手把手教你为iOS系统开发TensorFlow应用（附开源代码）', '在你使用深度神经网络做预测之前，你首先要训练神经网络。现在存在许多不同的神经网络训练工具，TensorFlow 正迅速成为其中最热门的选择。近日，独立开发者 Matthijs Hollemans 在 machinethink.net 的博客上发布了一篇讲解如何在 iOS 系统上运行 TensorFlow 的深度长文教程，并开源了相关的代码。机器之心对本文进行了编译介绍。关于 TensorFlow 的更多资讯和教程，请参阅机器之心文章《谷歌召开首届 TensorFlow 开发者大会，正式发布 TensorFlow 1.0》和《首届 TensorFlow 开发者大会：值得关注的亮点都在这里（附资源）》。                       项目地址：https://github.com/hollance/TensorFlow-iOS-Example\r\n\r\n你可以使用 TensorFlow 来训练你的机器学习模型，并使用这些模型进行预测。训练通常在强大的机器上或云端完成，但是 TensorFlow 也可以在 iOS 上运行——尽管有一些限制。\r\n\r\n在这篇博文中，我将解释 TensorFlow 背后的思想，如何使用它来训练一个简单的分类器，以及如何将这个分类器放在你的 iOS 应用程序中。\r\n\r\n我们将通过音频和语音分析的性别识别数据集（Gender Recognition by Voice and Speech Analysis，https://www.kaggle.com/primaryobjects/voicegender）来学习如何将一段录音识别为男性或女性的声音。你可以在上面的 GitHub 地址找到此项目的源代码。                 什么是 TensorFlow 以及为何我需要它？\r\n\r\nTensorFlow 是一个用于构建计算图（computational graph）以便进行机器学习的软件库。\r\n\r\n许多其它的工具工作在更高的抽象层次上。以 Caffe 为例，你可以通过连接不同类型的「层（layer）」来设计神经网络。这和 iOS 中 BNNS 以及 MPSCNN 的功能类似。在 TenseFlow 中，你也可以使用这样的层来工作，不过你还可以做得更深入，一直到构成你算法的单个计算。\r\n\r\n你可以将 TensorFlow 视为一个实现新机器学习算法的工具包，而其它的深度学习工具则是为了使用其他人实现的那些算法。\r\n\r\n这并不意味着你总是要从头开始构建一切。TensorFlow 附带有可复用的构建块的集合，而且还有其他库（如 Keras）也在 TensorFlow 上提供了方便的模块。\r\n\r\n所以精通数学不是使用 TensorFlow 的一个要求，但如果你想成为顶尖专家，还是应该掌握。                       基于 logistic 回归的二值分类\r\n\r\n在这篇博文中，我们将使用 logistic 回归算法创建一个分类器。是的，我们将从头开始构建它。那就卷起袖子开始吧！\r\n\r\n分类器接收一些输入数据，然后告诉你该数据属于哪个类别或类。对于这个项目，我们只有两个类：男性或女性，因此我们是一个二值分类器（binary classifier）。\r\n\r\n注：二值分类器是最简单的分类器，但它使用的思路与可以区分数百或数千个不同的类的分类器相同。所以即使我们在本教程中并没有做到真正的深度学习，但两者也仍有很多共同之处。\r\n\r\n我们将使用的输入数据由 20 个数字组成，这些数字代表某人说话的特定录音的各种声学特性。稍后我会再解释一下，其中包括音频的频率这样的信息。\r\n\r\n在下图中，你可以看到这 20 个数字连接到一个叫做 sum 的小块。根据分类器，这些连接具有不同的权重（weight），这对应于这 20 个数字中的每一个的重要程度。\r\n\r\n这是 logistic 分类器工作方式的框图：                               在 sum 块内，由 x0 - x19 给出的输入及其连接权重 w0 - w19 的权重被简单的加在一起。这就是一个常规的点积：\r\n\r\n我们还在最后添加了一个所谓的偏置（bias）项 b。这只是另一个数字。\r\n\r\n数组中的权重 w 和 b 的值是该分类器要学习的内容。训练分类器就是找到 w 和 b 的正确数字的问题。最初，我们将所有的 w 和 b 设为零。经过多轮训练，w 和 b 将包含一组数字，分类器可以用它们来分辨男性的语音和女性的语音。\r\n\r\n为了将这个 sum 值转换成 0 到 1 之间的概率值。', '2017-04-11', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1004', 'Bob', '2016年Java面试题整理', '面试是我们每个人都要经历的事情，大部分人且不止一次，这里给大家总结最新的2016年面试题，让大家在找工作时候能够事半功倍。\r\n\r\n1 Switch能否用string做参数？\r\n\r\na.在 Java 7 之前, switch 只能支持byte,short,char,int 或者其对应的封装类以及 Enum 类型。在JAVA 7中,String 支持被加上了。\r\n\r\n2 equals与==的区别：\r\n\r\na.==是判断两个变量或实例是不是指向同一个内存空间 equals是判断两个变量或实例所指向的内存空间的值是不是相同\r\n\r\n3 Object有哪些公用方法？\r\n\r\na.方法equals测试的是两个对象是否相等\r\n\r\nb.方法clone进行对象拷贝\r\n\r\nc.方法getClass返回和当前对象相关的Class对象\r\n\r\nd.方法notify,notifyall,wait都是用来对给定对象进行线程同步的\r\n\r\n4 Java的四种引用，强弱软虚，用到的场景                                               a.利用软引用和弱引用解决OOM问题：用一个HashMap来保存图片的路径和相应图片对象关联的软引用之间的映射关系，在内存不足时，JVM会自动回收这些缓存图片对象所占用的空间，从而有效地避免了OOM的问题\r\n\r\nb.通过软可及对象重获方法实现Java对象的高速缓存:比如我们创建了一Employee的类，如果每次需要查询一个雇员的信息。哪怕是几秒中之前刚刚查询过的，都要重新构建一个实例，这是需要消耗很多时间的。我们可以通过软引用和 HashMap 的结合，先是保存引用方面：以软引用的方式对一个Employee对象的实例进行引用并保存该引用到HashMap 上，key 为此雇员的 id，value为这个对象的软引用，另一方面是取出引用，缓存中是否有该Employee实例的软引用，如果有，从软引用中取得。如果没有软引用，或者从软引用中得到的实例是null，重新构建一个实例，并保存对这个新建实例的软引用\r\n\r\nc.强引用：如果一个对象具有强引用，它就不会被垃圾回收器回收。即使当前内存空间不足，JVM也不会回收它，而是抛出 OutOfMemoryError 错误，使程序异常终止。如果想中断强引用和某个对象之间的关联，可以显式地将引用赋值为null，这样一来的话，JVM在合适的时间就会回收该对象                                     d.软引用：在使用软引用时，如果内存的空间足够，软引用就能继续被使用，而不会被垃圾回收器回收，只有在内存不足时，软引用才会被垃圾回收器回收。\r\n\r\ne..弱引用：具有弱引用的对象拥有的生命周期更短暂。因为当 JVM 进行垃圾回收，一旦发现弱引用对象，无论当前内存空间是否充足，都会将弱引用回收。不过由于垃圾回收器是一个优先级较低的线程，所以并不一定能迅速发现弱引用对象\r\n\r\nf.虚引用：顾名思义，就是形同虚设，如果一个对象仅持有虚引用，那么它相当于没有引用，在任何时候都可能被垃圾回收器回收。                                 g.使用场景：\r\n\r\n5 Hashcode的作用，与 equal 有什么区别\r\n\r\na.同样用于鉴定2个对象是否相等的，java集合中有 list 和 set 两类，其中 set不允许元素重复实现，那个这个不允许重复实现的方法，如果用 equal 去比较的话，如果存在1000个元素，你 new 一个新的元素出来，需要去调用1000次 equal 去逐个和他们比较是否是同一个对象，这样会大大降低效率。hashcode实际上是返回对象的存储地址，如果这个位置上没有元素，就把元素直接存储在上面，如果这个位置上已经存在元素，这个时候才去调用equal方法与新元素进行比较，相同的话就不存了，散列到其他地址上\r\n\r\n6 String、StringBuffer与StringBuilder的区别\r\n\r\na.String 类型和 StringBuffer 类型的主要性能区别其实在于 String 是不可变的对象\r\n\r\nb.StringBuffer和StringBuilder底层是 char[]数组实现的\r\n\r\nc.StringBuffer是线程安全的，而StringBuilder是线程不安全的。', '2017-04-12', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1005', 'Leo', '如何解决常见的缓存穿透、并发和失效问题', '在之前的一篇缓存穿透、缓存并发、缓存失效之思路变迁文章中介绍了关于缓存穿透、并发的一些常用思路，但是个人感觉文章中没有明确一些思路的使用场景，本文将继续深化与大家共同探讨，同时也非常感谢这段时间给我提宝贵建议的朋友们（注：本文中提到的缓存可以理解为Redis）。缓存穿透与并发方案\r\n相信不少朋友之前看过很多类似的文章，但是归根结底就是二个问题：\r\n1、如何解决穿透\r\n2、如何解决并发\r\n\r\n当并发较高的时候，其实我是不建议使用缓存过期这个策略的，我更希望缓存一直存在，通过后台系统来更新缓存系统中的数据达到数据的一致性目的，有的朋友可能会质疑，如果缓存系统挂了怎么办，这样数据库更新了但是缓存没有更新，没有达到一致性的状态。\r\n\r\n解决问题的思路是如果缓存是因为网络问题没有更新成功数据，那么建议重试几次，如果依然没有更新成功则认为缓存系统出错不可用，这时候客户端会将数据的KEY插入到消息系统中，消息系统可以过滤相同的KEY，只需保证消息系统不存在相同的KEY，当缓存系统恢复可用的时候，依次从MQ中取出KEY值然后从数据库中读取最新的数据更新缓存。\r\n\r\n注意：更新缓存之前，缓存中依然有旧数据，所以不会造成缓存穿透。                                            看完上面的方案以后，又会有不少朋友提出疑问，如果我是第一次使用缓存或者缓存中暂时没有我需要的数据，那又该如何处理呢？\r\n\r\n在这种场景下，客户端从缓存中根据KEY读取数据，如果读到了数据则流程结束，如果没有读到数据（可能会有多个并发都没有读到数据），这时候使用缓存系统中的setNX方法设置一个值（这种方法类似加个锁），没有设置成功的请求则sleep一段时间，设置成功的请求读取数据库获取值，如果获取到则更新缓存，流程结束，之前sleep的请求这时候唤醒后直接再从缓存中读取数据，此时流程结束。\r\n\r\n在看完这个流程后，我想这里面会有一个漏洞，如果数据库中没有我们需要的数据该怎么处理，如果不处理则请求会造成死循环，不断的在缓存和数据库中查询，这时候我们会沿用我之前文章中的如果没有读到数据则往缓存中插入一个NULL字符串的思路，这样其他请求直接就可以根据“NULL”进行处理，直到后台系统在数据库成功插入数据后同步更新清理NULL数据和更新缓存。              \r\n在实际工作中，我们往往将上面二个方案组合使用才能达到最佳效果，虽然第二种方案也会造成请求阻塞，但是只是在第一次使用或者缓存暂时没有数据的情况下才会产生，在生产中经过检验在TPS没有上万的情况下是不会造成问题的。热点缓存解决方案\r\n\r\n 1. 缓存使用背景：\r\n我们拿用户中心的一个案例来说明。每个用户都会首先获取自己的用户信息，然后再进行其他相关的操作，有可能会有如下一些场景情况：\r\n会有大量相同用户重复访问该项目。\r\n\r\n会有同一用户频繁访问同一模块。\r\n\r\n 2. 思路解析\r\n因为用户本身是不固定的而且用户数量也有几百万尤其上千万，我们不可能把所有的用户信息全部缓存起来，通过第一个场景情况可以看到一些规律，那就是有大量的相同用户重复访问，但是究竟是哪些用户重复访问我们也并不知道。\r\n\r\n如果有一个用户频繁刷新读取项目，那么对数据库本身也会造成较大压力，当然我们也会有相关的保护机制来确实恶意攻击，可以从前端控制，也可以有采黑名单等机制，这里不在赘述。如果用缓存的话，我们又该如何控制同一用户繁重读取用户信息呢。                              我们会通过缓存系统做一个排序队列，比如1000个用户，系统会根据用户的访问时间更新用户信息的时间，越是最近访问的用户排名越排前，系统会定期过滤掉排名最后的200个用户，然后再从数据库中随机取出200个用户加入队列，这样请求每次到达的时候，会先从队列中获取用户信息，如果命中则根据userId，再从另一个缓存数据结构中读取用户信息，如果没有命中则说明该用户请求频率不高。', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1006', 'Coco', '面向机器学习和深度学习的英特尔优化工具和框架', '本文介绍了面向机器学习和深度学习的英特尔优化工具和框架，还展示了集成至上述优化工具和框架的英特尔库（有助于充分利用优化工具和框架，在英特尔® 架构上实现最佳性能）。这些信息对初次使用的用户、数据科学家和机器学习工作人员非常实用，能够帮助他们快速了解英特尔优化工具和框架。 \r\n简介 \r\n机器学习 (ML) 属于一般意义上的人工智能 (AI)，基于一系列用于数据分析的算法。深度学习 (DL) 是一项专门的机器学习技术，基于一系列算法，这些算法利用包含多个处理层的图，模拟高级别的数据抽象(https://en.wikipedia.org/wiki/Deep_learning)。                                                    如今，机器学习，尤其是深度学习，在应用和行业中得到了越来越广泛的应用，如图像和视频识别/分类、面部检测、自然语言处理和财务预测。\r\n\r\n英特尔机器学习和深度学习优化框架是利用深度学习的最简单的方法。使用英特尔优化工具和框架训练、部署深度学习，将确保这些工具以最高效的方式利用英特尔® 架构。以下链接显示了面向英特尔架构优化框架的实例，还提供了优化框架速度提升（相比于未经优化的框架）的表格，https://software.intel.com/zh-cn/ai/deep-learning\r\n\r\n(请访问http://itpeernetwork.intel.com/myth-busted-general-purpose-cpus-cant-tackle-deep-neural-network-training/\r\n\r\n和\r\n\r\nhttp://itpeernetwork.intel.com/myth-busted-general-purpose-cpus-cant-tackle-deep-neural-network-training-part-2/ 获取实例)。                       从图中我们可以发现，英特尔机器学习和深度学习解决方案堆栈跨越不同的层。在硬件上开发的高度优化数学库支持以最高效的方式利用若干英特尔® 处理器产品家族。这些优化的数学库为更高级别的工具和框架提供了基础，帮助解决不同领域的机器学习和深度学习问题。                   我们将在下一部分简要总结用于优化框架的英特尔库和工具。尽管这些工具和库用于优化面向英特尔框架的机器学习和深度学习框架，也可以将其应用于其他需要高度优化数值例程的应用或软件包，便于它们利用英特尔® 硬件的矢量化、多线程和分布式计算功能。\r\n\r\n面向机器学习和深度学习的英特尔® 软件工具\r\n\r\n英特尔正积极与开源社区合作，面向英特尔架构优化现有的和全新的框架，还借助库的强大功能，优化机器学习和深度学习工具，这些库通过构建模块加速任务。                                   英特尔开发了 3 个在英特尔上架构上运行的高度优化的库。 \r\n英特尔® 数学核心函数库（英特尔® MKL）(https://software.intel.com/zh-cn/intel-mkl) 提供一系列面向深度学习的高度优化性能基元 (https://software.intel.com/zh-cn/node/684759)。这个库还包括高度优化（矢量化和线程化）的功能，使每个英特尔® 处理器产品家族达到最高性能。这些功能针对单核矢量化和高速缓存内存利用率而优化，实现多核与众核处理器的自动并行性。\r\n\r\n英特尔 MKL 为常见的数学库（如 BLAS、LAPACK 和 FFTW）提供标准 C 和 Fortran API，无需更改代码。重新连接应用后，英特尔 MKL 将使每个英特尔处理器产品家族的性能达到最高。以最小的付出实现深度学习应用的强大性能。\r\n\r\n英特尔 MKL 面向最新版英特尔处理器而优化，包括英特尔® 至强处理器和英特尔® 至强融核™ 处理器。尤其是面向英特尔® 高级矢量扩展指令集 2 和英特尔® 高级矢量扩展指令集 512 ISA 进行了优化。                              ', '2017-04-11', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1007', 'Jenny', '深入理解Java的接口和抽象类', '对于面向对象编程来说，抽象是它的一大特征之一。在Java中，可以通过两种形式来体现OOP的抽象：接口和抽象类。这两者有太多相似的地方，又有太多不同的地方。很多人在初学的时候会以为它们可以随意互换使用，但是实际则不然。今天我们就一起来学习一下Java中的接口和抽象类。下面是本文的目录大纲：\r\n\r\n　　一.抽象类\r\n\r\n　　二.接口\r\n\r\n　　三.抽象类和接口的区别\r\n\r\n　　若有不正之处，请多多谅解并欢迎批评指正，不甚感激。\r\n\r\n一.抽象类\r\n\r\n　　在了解抽象类之前，先来了解一下抽象方法。抽象方法是一种特殊的方法：它只有声明，而没有具体的实现。抽象方法的声明格式为：\r\n\r\nabstract void fun();                                   抽象方法必须用abstract关键字进行修饰。如果一个类含有抽象方法，则称这个类为抽象类，抽象类必须在类前用abstract关键字修饰。因为抽象类中含有无具体实现的方法，所以不能用抽象类创建对象。\r\n\r\n　　下面要注意一个问题：在《JAVA编程思想》一书中，将抽象类定义为“包含抽象方法的类”，但是后面发现如果一个类不包含抽象方法，只是用abstract修饰的话也是抽象类。也就是说抽象类不一定必须含有抽象方法。个人觉得这个属于钻牛角尖的问题吧，因为如果一个抽象类不包含任何抽象方法，为何还要设计为抽象类？所以暂且记住这个概念吧，不必去深究为什么。\r\n\r\n[public] abstract class ClassName {\r\n    abstract void fun();\r\n}\r\n从这里可以看出，抽象类就是为了继承而存在的，如果你定义了一个抽象类，却不去继承它，那么等于白白创建了这个抽象类，因为你不能用它来做任何事情。对于一个父类，如果它的某个方法在父类中实现出来没有任何意义，必须根据子类的实际需求来进行不同的实现，那么就可以将这个方法声明为abstract方法，此时这个类也就成为abstract类了。                      包含抽象方法的类称为抽象类，但并不意味着抽象类中只能有抽象方法，它和普通类一样，同样可以拥有成员变量和普通的成员方法。注意，抽象类和普通类的主要有三点区别：\r\n\r\n　　1）抽象方法必须为public或者protected（因为如果为private，则不能被子类继承，子类便无法实现该方法），缺省情况下默认为public。\r\n\r\n　　2）抽象类不能用来创建对象；\r\n\r\n　　3）如果一个类继承于一个抽象类，则子类必须实现父类的抽象方法。如果子类没有实现父类的抽象方法，则必须将子类也定义为为abstract类。\r\n\r\n　　在其他方面，抽象类和普通的类并没有区别。\r\n\r\n二.接口\r\n\r\n　　接口，英文称作interface，在软件工程中，接口泛指供别人调用的方法或者函数。从这里，我们可以体会到Java语言设计者的初衷，它是对行为的抽象。在Java中，定一个接口的形式如下：\r\n\r\n[public] interface InterfaceName {\r\n\r\n}                        接口中可以含有 变量和方法。但是要注意，接口中的变量会被隐式地指定为public static final变量（并且只能是public static final变量，用private修饰会报编译错误），而方法会被隐式地指定为public abstract方法且只能是public abstract方法（用其他关键字，比如private、protected、static、 final等修饰会报编译错误），并且接口中所有的方法不能有具体的实现，也就是说，接口中的方法必须都是抽象方法。从这里可以隐约看出接口和抽象类的区别，接口是一种极度抽象的类型，它比抽象类更加“抽象”，并且一般情况下不在接口中定义变量。\r\n\r\n　　要让一个类遵循某组特地的接口需要使用implements关键字，具体格式如下：\r\n\r\nclass ClassName implements Interface1,Interface2,[....]{\r\n}\r\n可以看出，允许一个类遵循多个特定的接口。如果一个非抽象类遵循了某个接口，就必须实现该接口中的所有方法。对于遵循某个接口的抽象类，可以不实现该接口中的抽象方法。', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1008', 'Max', '35 个 Java 代码性能优化总结', '前言\r\n\r\n代码优化，一个很重要的课题。可能有些人觉得没用，一些细小的地方有什么好修改的，改与不改对于代码的运行效率有什么影响呢？这个问题我是这么考虑的，就像大海里面的鲸鱼一样，它吃一条小虾米有用吗？没用，但是，吃的小虾米一多之后，鲸鱼就被喂饱了。代码优化也是一样，如果项目着眼于尽快无BUG上线，那么此时可以抓大放小，代码的细节可以不精打细磨；但是如果有足够的时间开发、维护代码，这时候就必须考虑每个可以优化的细节了，一个一个细小的优化点累积起来，对于代码的运行效率绝对是有提升的。\r\n\r\n代码优化的目标是：\r\n\r\n1、减小代码的体积\r\n\r\n2、提高代码运行的效率\r\n\r\n代码优化细节\r\n\r\n1、尽量指定类、方法的final修饰符\r\n\r\n带有final修饰符的类是不可派生的。在Java核心API中，有许多应用final的例子，例如java.lang.String，整个类都是final的。为类指定final修饰符可以让类不可以被继承，为方法指定final修饰符可以让方法不可以被重写。如果指定了一个类为final，则该类所有的方法都是final的。Java编译器会寻找机会内联所有的final方法，内联对于提升Java运行效率作用重大，具体参见Java运行期优化。此举能够使性能平均提高50%。                                  2、尽量重用对象\r\n\r\n特别是String对象的使用，出现字符串连接时应该使用StringBuilder/StringBuffer代替。由于Java虚拟机不仅要花时间生成对象，以后可能还需要花时间对这些对象进行垃圾回收和处理，因此，生成过多的对象将会给程序的性能带来很大的影响。\r\n\r\n3、尽可能使用局部变量\r\n\r\n调用方法时传递的参数以及在调用中创建的临时变量都保存在栈中速度较快，其他变量，如静态变量、实例变量等，都在堆中创建，速度较慢。另外，栈中创建的变量，随着方法的运行结束，这些内容就没了，不需要额外的垃圾回收。\r\n\r\n4、及时关闭流\r\n\r\nJava编程过程中，进行数据库连接、I/O流操作时务必小心，在使用完毕后，及时关闭以释放资源。因为对这些大对象的操作会造成系统大的开销，稍有不慎，将会导致严重的后果。\r\n\r\n5、尽量减少对变量的重复计算\r\n\r\n明确一个概念，对方法的调用，即使方法中只有一句语句，也是有消耗的，包括创建栈帧、调用方法时保护现场、调用方法完毕时恢复现场等。所以例如下面的操作：\r\n\r\nfor (int i = 0; i < list.size(); i++)\r\n\r\n{...}\r\n建议替换为：\r\n\r\nfor (int i = 0, int length = list.size(); i < length; i++)\r\n\r\n{...}\r\n这样，在list.size()很大的时候，就减少了很多的消耗.                          6、尽量采用懒加载的策略，即在需要的时候才创建\r\n\r\n例如：\r\n\r\nString str = \"aaa\";if (i == 1)\r\n{\r\n\r\nlist.add(str);\r\n\r\n}\r\n建议替换为：\r\n\r\nif (i == 1)\r\n{\r\n\r\nString str = \"aaa\";\r\n\r\nlist.add(str);\r\n\r\n}\r\n7、慎用异常            异常对性能不利。抛出异常首先要创建一个新的对象，Throwable接口的构造函数调用名为fillInStackTrace()的本地同步方法，fillInStackTrace()方法检查堆栈，收集调用跟踪信息。只要有异常被抛出，Java虚拟机就必须调整调用堆栈，因为在处理过程中创建了一个新的对象。异常只能用于错误处理，不应该用来控制程序流程。\r\n\r\n8、不要在循环中使用try…catch…，应该把其放在最外层\r\n\r\n除非不得已。如果毫无理由地这么写了，只要你的领导资深一点、有强迫症一点，八成就要骂你为什么写出这种垃圾代码来了。                  ', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1009', 'Kenny', '移动周刊第 185 期：2017 年移动应用开发十大趋势', '写在前面\r\n本期移动周刊第 185 期如约而至，聚焦 Android、iOS、VR/AR/MR、直播等前沿移动开发技术，收录一周最热点，解读开发技巧，我们希望从中能够让你有一些收获，如果你有好的文章以及优化建议，请发送邮件至mobilehub@csdn.net，在技术探索的道路上我们共同进步。\r\n\r\nSwift 3.1 已经正式发布了，Swift 3.1 是一个小更新版本，包含对标准库的改进，该版本还包括许多关于 Swift 的 Linux 实现的更新。还有一些 Swift 包管理器的更新。此外，Swift 3.1 编译器现在可以自动预编译 Objective-C 桥接头，还可以加快混合源代码项目的调试配置构建。                   技术文章\r\nAndroid\r\n剖析桌面化 Android 操作系统的发展与未来\r\n\r\n操作系统是用来提供一个支持各种应用程序运行的基础软件环境。目前还没有一个操作系统在这个领域处于统治地位，各种操作系统在这个领域都有一个适合自己的范围。\r\n\r\n开源推荐：Android 图片压缩开源库\r\n\r\n推荐两个 Github 上开源的 Android 图片压缩库，两个库的代码量不多，可以直接使用或者借鉴学习。\r\n\r\n自定义九宫格控件（附源码地址）\r\n\r\n在阅读本文之前，需要你对 View 的绘制有一定的了解，本文基于源码分享一个类似朋友圈的功能，即九宫格控件。\r\n\r\nAndroid 应用”反调试”操作的几种方案解析\r\n\r\n这篇文章就来详细总结一下，现阶段比较流行的几种反调试解决方案。\r\n\r\nAndroid 优化 App 构建速度的 17 条建议\r\n\r\n本篇文章根据 Google 官方文档，加上自己的一些理解提供一些提升 App 构建速度的优化建议。                       iOS\r\n舞动的表情包——浅析 GIF 格式图片的存储和压缩\r\n\r\nGIF 格式可以存储多幅彩色图像，如果将这些图像连续播放出来，就能够组成最简单的动画。所以常被用来存储“动态图片”，通常时间短，体积小，内容简单，成像相对清晰，近年来流行的表情包文化，让老古董 GIF 图有了新的用武之地。\r\n\r\n一篇文章帮你彻底了解 Swift 3.1 的新内容\r\n\r\nXcode 8.3 和 Swift 3.1 正式版的发布包含了等待已久的 Swift 包管理器 功能，以及对语言本身的改进。\r\n\r\n由 FlexBox 算法强力驱动的 Weex 布局引擎\r\n\r\n这篇文章将会详细的分析 Weex 是如何高性能的布局原生界面的，之后还会与现有的布局方法进行对比，看看 Weex 的布局性能究竟如何。\r\n\r\niOS 开发中，怎样用好 Notifications？\r\n\r\n在 iOS 开发中，有这样一个场景：某件重要的事情必须立刻让用户知道，甚至不惜以打断用户当前操作为代价来强调这份重要性。这就是通知（Notifiations）。目前常用的框架为 UserNotifications，它主要用来在锁屏和应用界面通过弹窗来显示通知。\r\n\r\n2017 年移动应用开发十大趋势\r\n\r\n在快节奏的 App 开发领域，随时了解增强现实、即时应用（Instant Apps）和直接与云端交互等趋势，将有助于你的 App 脱颖而出。                              VR\r\nUnity 教程 | 手把手教你拼一个3D“魔方”\r\n\r\n本教程将为刚接触 Unity 的初学者讲解如何在 Unity 中实现 3D 立方体的堆叠，利用一个或多个预制件动态创建立方体进行拼接，为这些立方体赋予不同的颜色。\r\n\r\n从脚本到发布：解锁 VR 短片全流程制作要点\r\n\r\nVR 电影用来突破“第四面墙”的绝不仅仅是机位，除了体验和工具，更多的还是制作者思维和逻辑上的转换。\r\n\r\nFacebook 收购 Oculus 豪赌 VR 为什么却成了灾难？\r\n\r\n2014年，24岁的罗基（Palmer Luckey）把自己的虚拟现实公司Oculus，以20亿美元的价格（后来扎克伯格承认一共的收购成本为30亿美元）转让给了Facebook。从此之后，Oculus成了扎克伯格的一个烦恼。\r\n\r\n什么是像素密度和视网膜分辨率？为什么对 VR 很重要\r\n\r\n虽然我们大部分人都习惯于使用分辨率数字（如1920×1080显示器），但像素密度是更为有用的数字，在描述AR和VR头显时尤为如此。', '2017-04-12', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1010', 'Aaron', '阿里巴巴Java开发手册快速学习', '摘要： 善医者“未有形而除之”，提高工程健壮性最好的方式是在代码出现问题之前就排除掉，不给Bug出现的机会。一份好的开发规范就可以起到这样的作用，大大减少产品上线后的问题。《阿里巴巴Java开发手册》是阿里巴巴的内部编码规范，阿里官方的Java代码规范标准，这份开发手册不仅规范了一些开发细节，也提出了很多工程开发的哲学，值得好好阅读。\r\n\r\nJava作为一门名副其实的工业级语言，语法友好，学习简单，大规模的应用给代码质量的管控带来了困难，特别是团队开发中，开发过程中的规范会直接影响最终项目的稳定性。\r\n\r\n善医者“未有形而除之”，提高工程健壮性最好的方式是在代码出现问题之前就排除掉，不给Bug出现的机会。一份好的开发规范就可以起到这样的作用，大大减少产品上线后的问题。                                《阿里巴巴Java开发手册》是阿里巴巴的内部编码规范，阿里官方的Java代码规范标准， 手册以Java应用开发为维度，分为编程规约、异常日志规约、MYSQL规约、工程规约、安全规约五个章节，给出了强制、推荐、参考三个级别，每条规范都有推荐的约束力度，从命名到项目拆分，不仅规范了一些开发细节，也提出了很多工程开发的哲学，值得好好阅读。\r\n\r\n点击下载《阿里巴巴Java开发手册》(v1.1.0版)\r\n\r\n下面记录一些对我比较有启发的条款，提纲挈领，快速学习。\r\n\r\n \r\n\r\n一、编程规约\r\n1.如果使用到了设计模式，建议在类名中体现出具体模式\r\n\r\n将设计模式体现在名字中，有利于阅读者快速理解架构设计思想。 \r\n\r\n2.相同参数类型，相同业务含义，才可以使用 Java 的可变参数，避免使用 Object\r\n\r\n可变参数必须放置在参数列表的最后，尽量不用可变参数编程。\r\n\r\n3.对外暴露的接口签名，原则上不允许修改方法签名，避免对接口调用方产生影响\r\n\r\n接口过时必须加@Deprecated 注解，并清晰地说明采用的新接口或者新服务是什么。\r\n\r\n4.关于基本数据类型与包装数据类型的使用标准如下\r\n\r\n1) 所有的POJO类属性必须使用包装数据类型\r\n\r\n2) RPC方法的返回值和参数必须使用包装数据类型\r\n\r\n3) 所有的局部变量【推荐】使用基本数据类型\r\n\r\nPOJO 类属性没有初值是醒使用者在需要使用时，必须自己显式地进行赋值，任何 NPE 问题，或者入库检查，都由使用者来保证。数据库的查询结果可能是null，因为自动拆箱，用基本数据类型接收有NPE风险。\r\n\r\n5.注意 serialVersionUID 不一致会抛出序列化运行时异常\r\n\r\n序列化类新增属性时，请不要修改 serialVersionUID 字段，避免反序列失败;如果完全不兼容升级，避免反序列化混乱，那么请修改 serialVersionUID 值。                          6.POJO 类必须写 toString 方法\r\n\r\n使用 IDE 的中工具:source> generate toString 时，如果继承了另一个 POJO 类，注意在前面加一下 super.toString。 在方法执行抛出异常时，可以直接调用 POJO 的 toString()方法打印其属性值，便于排查问题。\r\n\r\n7.final 可提高程序响应效率，声明成 final 的情况:\r\n\r\n1) 不需要重新赋值的变量，包括类属性、局部变量\r\n\r\n2) 对象参数前加final，表示不允许修改引用的指向\r\n\r\n3) 类方法确定不允许被重写\r\n\r\n8.慎用 Object 的 clone 方法来拷贝对象\r\n\r\n对象的 clone 方法默认是浅拷贝，若想实现深拷贝需要重写 clone 方法实现属性对象 的拷贝。                   ', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1011', 'Peter', '分布式调用跟踪系统的设计和应用学习', '摘要： 随着分布式服务架构的流行，特别是微服务等设计理念在系统中的应用，业务的调用链越来越复杂，一个请求可能会涉及到几十个服务的协同处理， 牵扯到多个团队的业务系统，那么如何快速准确的定位到线上故障？缺乏一个自上而下全局的调用id，如何有效的进行相关的数据分析工作？                      一、为什么需要分布式调用跟踪系统\r\n\r\n随着分布式服务架构的流行，特别是微服务等设计理念在系统中的应用，业务的调用链越来越复杂，                 可以看到，随着服务的拆分，系统的模块变得越来越多，不同的模块可能由不同的团队维护，\r\n\r\n一个请求可能会涉及到几十个服务的协同处理， 牵扯到多个团队的业务系统，那么如何快速准确的定位到线上故障？\r\n同时，缺乏一个自上而下全局的调用id，如何有效的进行相关的数据分析工作？\r\n\r\n对于大型网站系统，如淘宝、京东等电商网站，这些问题尤其突出。\r\n\r\n一个典型的分布式系统请求调用过程：                       比较成熟的解决方案是通过调用链的方式，把一次请求调用过程完整的串联起来，这样就实现了对请求调用路径的监控。\r\n\r\n二、调用跟踪系统的业务场景\r\n一、\r\n1、故障快速定位\r\n通过调用链跟踪，一次请求的逻辑轨迹可以用完整清晰的展示出来。\r\n开发中可以在业务日志中添加调用链ID，可以通过调用链结合业务日志快速定位错误信息。\r\n\r\n2、各个调用环节的性能分析\r\n在调用链的各个环节分别添加调用时延，可以分析系统的性能瓶颈，进行针对性的优化。\r\n\r\n3、各个调用环节的可用性，持久层依赖等\r\n通过分析各个环节的平均时延，QPS等信息，可以找到系统的薄弱环节，对一些模块做调整，如数据冗余等。\r\n\r\n4、数据分析等\r\n调用链是一条完整的业务日志，可以得到用户的行为路径，汇总分析应用在很多业务场景。                   二、分布式调用跟踪系统的设计\r\n（1）分布式调用跟踪系统的设计目标\r\n低侵入性，应用透明：\r\n\r\n作为非业务组件，应当尽可能少侵入或者无侵入其他业务系统，对于使用方透明，减少开发人员的负担\r\n\r\n低损耗：\r\n\r\n服务调用埋点本身会带来性能损耗，这就需要调用跟踪的低损耗，\r\n实际中还会通过配置采样率的方式，选择一部分请求去分析请求路径\r\n\r\n大范围部署，扩展性：\r\n\r\n作为分布式系统的组件之一，一个优秀的调用跟踪系统必须支持分布式部署，具备良好的可扩展性                 （2）埋点和生成日志\r\n埋点即系统在当前节点的上下文信息，可以分为客户端埋点、服务端埋点，以及客户端和服务端双向型埋点。\r\n\r\n埋点日志通常要包含以下内容：\r\n\r\nTraceId、RPCId、调用的开始时间，调用类型，协议类型，调用方ip和端口，请求的服务名等信息；\r\n调用耗时，调用结果，异常信息，消息报文等；\r\n预留可扩展字段，为下一步扩展做准备；\r\n\r\n（3）抓取和存储日志\r\n日志的采集和存储有许多开源的工具可以选择，\r\n一般来说，会使用离线+实时的方式去存储日志，主要是分布式日志采集的方式。\r\n典型的解决方案如Flume结合Kafka等MQ。\r\n\r\n（4）分析和统计调用链数据\r\n一条调用链的日志散落在调用经过的各个服务器上，\r\n首先需要按 TraceId 汇总日志，然后按照RpcId 对调用链进行顺序整理。\r\n调用链数据不要求百分之百准确，可以允许中间的部分日志丢失。（5）计算和展示\r\n汇总得到各个应用节点的调用链日志后，可以针对性的对各个业务线进行分析。\r\n需要对具体日志进行整理，进一步储存在HBase或者关系型数据库中，可以进行可视化的查询。', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1012', 'Emma', '做好以下几点你将成为一个合格优秀的程序猿', '1.做好情绪管理 \r\n情绪，无论哪种，都是人必不可少的。比如说，恐惧，这一种我们通常认为的“负面情绪”，能够在危险来临时及时地告诉我们的身体和提醒我们的大脑，现在处在危险的情景中，需要立刻做出逃跑还是反抗的选择。但是，如果一个人的情绪如果没法被控制、自由泛滥，那在生活中就会产生很多问题。比如说，如果我们没有办法停止恐惧的情绪，那么即使离开了危险的情景，到达了安全的地方，我们的身体和大脑还是处于“逃跑还是反抗”的应激状态中。长此以往，我们就会出现一系列心理失衡的症状。这就是创伤后应激障碍症的产生。所以，情绪，没有好或者坏，只有对我们现在的情况“有用”，“没用”或者“有害”。不带有偏见地看待情绪，接纳情绪，感受情绪，是情绪管理的第一步。 \r\n管理自己的情绪，保持情绪的稳定，我给出四个建议，这四点的关系是递进的。 \r\n第一，认识情绪。 \r\n第二，识别自己的情绪。 \r\n第三，理解情绪产生的过程和机制。 \r\n第四，放弃治疗，接纳情绪。 \r\n万事皆冷静                                        2.尊敬每一个人就像尊敬代码一样 \r\n很多程序员是傲娇的，觉得产品就是自己做出来的，其他的人都是辅助的。所以很多程序员心里是看不上产品，测试的，也就造成很多沟通障碍。 首先上面这种人一定一辈子只能写代码，哪怕技术再牛。 我不太认同写代码只能写到30岁，但是程序员30岁之后，要想有更大的发展，那么做团队管理，要么做技术咨询，才能让自己的能力和积累的经验扩大化，那么这个时候，卓越的沟通能力往往成为关键。 \r\n3.关注到细节 \r\n细节决定成败， 生活中这些显而易见的小事，不为人注意的细节确能够体现一个人对待生活、对待人生的态度。成功与失败之间的距离，往往就在这些生活习惯及不经意流露的细节之中。编程更看中的是细节！ \r\n4.技术要过硬 \r\n编程语言那么多，多语言的程序员虽然抢手，但是如果是半瓶水的水平，估计也是没人愿意要的。 \r\n现在程序员非常多，是因为这个行业入门的门槛非常低，也就造成行业的水平参差不齐。做一个网站很难么，找个现成的框架，懂点数据库，建个数据表，前端再找个现成的模板，修修改改一个网站就出来了。 \r\n但是满足这样就完了？那么水平可能永远就是这样了，其实这其中每一个点都是可以研究的很深的，比如网站的大数据存储，如何提供程序并行运行的效率，，未来计算机行业的技术分工会越来越细，任何一个方面的专家都是相当有用的 \r\n5、有一个明确的职业规划 \r\n当今社会,IT行业发展速度突飞猛进,技术更新换代周期小,专业方向和领域更是林林总总、百家争鸣,若没有一个明确的目标而漫无目的的乱走一遭,岂不殆误时机,浪费年华?俗话说,欲行千里,先立其志。因此,要为自己拟定一份职业生涯规划,将自己的未来好好的设计一下。有了方向的指引,自然才会有乘风破浪之帆。', '2017-03-07', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1013', 'Lucy', 'Wi-Fi频谱的发展现状、展望', '无线电频谱的分配问题一直饱受争议。无论是美国FCC还是英国OFCOM，任何国家的管理机构都将频谱作为一种国有资源进行管理。他们在移动运营商、政府用户、科研机构和业余无线电团体等各类需求团体之间寻求平衡。当然，他们还直接或间接地代表着公众利益。\r\n\r\n以频谱使用为生的行业必须极力确保其资源的可持续性，并阻拦将任何可能造成干扰的新业务提案。作为2.4GHz和5GHz波段内的稳定用户，日益活跃的Wi-Fi行业已与监管机构联手合作。\r\n\r\n2.4GHz的主要问题事关分配给美国公司Globalstar的部分频谱。近年来，Globalstar多次尝试扩张商用业务，最近的提案便是将这些原用于移动电话卫星下行链路的频谱资源，转用于陆地LTE网络。Wi-Fi行业对此的担忧是，任何新业务都不应对相邻信道造成干扰，而Wi-Fi通讯目前就在该波段的顶端。\r\n\r\n在5GHz波段，Wi-Fi也面临着诸多风险与机遇。关于波段底端5150-5350MHz的使用问题，美国持坚定态度，而加拿大、英国等其他国家的监管机构试图仅对室内使用开放，并限制了Wi-Fi应用的传输功率。波段中部的5350-5470MHz可能将不再面向Wi-Fi开放，因为地球观测卫星、政府雷达和无人机通讯行业用户对此抱怨已久。\r\n\r\n大部分国家已允许Wi-Fi在5470-5725MHz内基于DFS和TPC技术使用，但一些早期的Wi-Fi设备产品因配置问题可在未授权的情况下使用DFS信道，从而产生干扰。根据Wi-Fi联盟的强硬态度，以及FCC和ETSI的近期举措来看，这种配置问题应该被妥善处理。然而，仍有气象雷达运营方连续提交该波段的干扰报告，将问题归咎于Wi-Fi使用，并向监管机构施压采取行动限制其使用。                        位于该波段顶端的5725-5850MHz在美国被允许用于Wi-Fi，这意味着其他国家监管机构也可能开放此波段：英国OFCOM正在逐步效仿。自5850-5925MHz开始，是Wi-Fi扩大使用的机会。该频谱在十多年前被美国和欧洲管理机构预留用于车对车通信和道路收费通信。由于这些使用涉及安全与经济问题，特作为指定波段，并基于专用短程通信（DSRC）IEEE802.11协议，作为Wi-Fi使用的一种演变。但由于汽车厂商生产活动进展缓慢，因此Wi-Fi行业又在向监管机构争取机会，试图共用该波段，并在DSRC的非活动区域使用Wi-Fi技术。虽只是个开始，但仍能看到未来或存在更多可能。\r\n\r\n目前来看，Wi-Fi频谱的使用较为稳定，虽有人试图限制其发展，但监管机构已经注意到Wi-Fi使用承载的大量数据，也不愿将已分配出的资源收回。然而，很多迹象表明2.4GHz波段已出现拥挤，且5GHz很快也会出现相似情形。5G微信公众平台（ID：angmobile）了解到，Wi-Fi联盟提出，到2020年需要额外500MHz至1GHz的频谱资源才能满足Wi-Fi通信需求，而2025年的资源缺口或将扩大至1.3-1.8GHz。', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1014', 'Sam', '工业物联网框架中边缘节点的检测和测量', '工业物联网(IoT)正在酝酿广泛的转变，这种转变不仅将使互联机器间的相互检测成为一种竞争优势，还将使其成为必不可少的基本服务。工业物联网以边缘节点为起始点，后者是检测和测量的目标切入点。这是物理世界与计算数据分析进行交互的接口所在。互联的工业机器可检测大量的信息，进而用于制定关键决策。这种边缘传感器可能远离存储历史分析的云服务器。它必须通过将边缘数据聚合到互联网的网关进行连接。理想情况下，边缘传感器节点具有很小的规格尺寸，可在空间受限的环境中轻松进行部署。\r\n\r\n检测、测量、解读、连接\r\n\r\n边缘节点的智能管理对成功实施来说十分关键。在一些情况下，超低功耗(ULP)是最重要的性能指标。在关键事件期间，当传感器从睡眠模式唤醒时，可以过滤掉绝大多数的潜在数据。\r\n\r\n传感器构成工业物联网电子生态系统的前端边缘。测量阶段将检测到的信息转换为有意义的数据，如压力、位移或旋转的可量化值。在解读阶段，边缘分析与处理会将测量数据转换为可操作的事件。只有最有价值的信息才应越过节点连接到云，以供预测或历史处理。在整个信号链中，都可以根据初始的可接受性限制来抑制或过滤数据。理想情况下，传感器节点应仅发送绝对必要的信息，并且应在获得关键数据后尽快制定关键决策。                                       边缘节点必须通过有线或无线传感器节点(WSN)连接到外部网络。在信号链的这一部分中，数据完整性仍然十分关键。如果通信不一致、丢失或损坏，则优化检测和测量数据几乎没有价值。通信期间数据丢失是不可接受的。存在电气噪声的工业环境可能十分恶劣和艰苦，尤其是在存在大量金属物体情况下进行射频通信时。因此，必须在系统架构设计期间预先设计鲁棒的通信协议。\r\n\r\nULP系统的功率管理以选择调节器元件来实现最大效率为起点。但是，由于边缘节点也可能以快速占空比唤醒和睡眠，因此还应考虑上电和掉电时间。外部触发器或唤醒命令能够帮助快速提醒边缘节点，使其开始检测和测量数据。                 数据安全性也是工业物联网系统必须考虑的一个问题。我们不仅需要确保边缘内的数据安全无虑，还必须确保其对网络网关的访问免受恶意攻击。决不允许仿冒边缘节点来获取网络访问以进行不法活动。\r\n\r\n智能始于边缘\r\n\r\n边缘处具有众多检测解决方案，这些解决方案可能不只是单个分立器件。边缘可能存在多种不同的无关数据采集。温度、声音、振动、压力、湿度、运动、污染物、音频和视频只是其中可检测的部分变量，这些数据会经过处理并通过网关发送至云，以进行进一步的历史和预测分析。\r\n\r\n毫不夸张地说，传感器就是工业物联网的支柱。但更准确的说法应该是，它们是获得洞察的中枢神经系统。边缘节点检测和测量技术是目标数据的“出生地”。如果在解决方案链的这一阶段如实地记录了不良或错误的数据，则云中再多的后期处理也无法挽回损失的价值。                任务关键型系统（如具有高风险结果的医疗保健和工厂停机监控系统）要求质量数据测量具有鲁棒的完整性。数据质量至关重要。误报或遗漏可能代价高昂，非常耗时，甚至可能威胁生命。代价巨大的错误最终会导致计划外的维护、劳动力使用效率低下，甚至不得不禁用整个物联网系统。智能始于边缘节点，而此处也适用那句老话：如果输入的是垃圾，那么输出的也一定是垃圾。                能够访问数据宝藏也就意味着需要承担重大的责任在没有边缘节点智能的传统信号链解决方案中，数据只是数据。非智能节点从不会帮助生成用于制定可行决策的智慧和知识。可能存在大量对系统目标性能没有影响的原始低质量数据。转换所有这些数据并将其发送至最终云存储目的地可能需要消耗大量的功率和带宽。\r\n\r\n相比之下，聪明的智能分区边缘节点检测和测量会将数据转换为可付诸行动的信息。智能节点可降低整体功耗，缩短延迟并减少带宽浪费。这使得具有较长延迟的反应型物联网可以转变成实时的预测型物联网模式。物联网仍然适用基本的模拟信号链电路设计理念。对于复杂的系统，通常需要拥有深厚的应用专业知识来解读已处理的数据。', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1015', 'Vivi', '存储过程与SQL语句如何选择', '摘要： 数据库擅长存储与索引，在目前的互联网系统架构中，服务器的扩展要比存储的扩展更简单， 需要考虑系统可能的瓶颈在服务器还是数据存储，存储过程有它的优点，应该在开发中合理的选用。                     应用存储过程的优点\r\n存储过程是一组预先创建并用指定的名称存储在数据库服务器上的 SQL 语句，将使用比较频繁或者比较复杂的操作，预先用 SQL 语句写好并存储起来，以后当需要数据库提供相同的服务时，只需再次执行该存储过程。\r\n\r\n1.具有更好的性能\r\n\r\n存储过程是预编译的，只在创建时进行编译，以后每次执行存储过程都不需再重新编译，而一般 SQL 语句每执行一次就编译一次，因此使用存储过程可以提高数据库执行速度。\r\n\r\n2.功能实现更加灵活\r\n\r\n存储过程中可以应用条件判断和游标等语句，有很强的灵活性，可以直接调用数据库的一些内置函数，完成复杂的判断和较复杂的运算。\r\n\r\n3.减少网络传输\r\n\r\n复杂的业务逻辑需要多条 SQL 语句，当客户机和服务器之间的操作很多时，将产生大量的网络传输。如果将这些操作放在一个存储过程中，那么客户机和服务器之间的网络传输就会减少，降低了网络负载。\r\n\r\n4.具有更好的安全性\r\n\r\n （1）数据库管理人员可以更好的进行权限控制，存储过程可以屏蔽对底层数据库对象的直接访问，使用 EXECUTE 权限调用存储过程，无需拥有访问底层数据库对象的显式权限。\r\n\r\n（2）在通过网络调用过程时，只有对执行过程的调用是可见的。无法看到表和数据库对象名称，不能嵌入SQL 语句，有助于避免 SQL 注入攻击。                   存储过程的弊端\r\n1.架构不清晰，不够面向对象\r\n\r\n 存储过程不太适合面向对象的设计，无法采用面向对象的方式将业务逻辑进行封装，业务逻辑在存储层实现，增加了业务和存储的耦合，代码的可读性也会降低，\r\n\r\n2.开发和维护要求比较高\r\n\r\n存储过程的编写直接依赖于开发人员，如果业务逻辑改动较多，需要频繁直接操作数据库，大量业务降维到数据库，很多异常不能在代码中捕获，出现问题较难排查，需要数据库管理人员的帮助。 \r\n\r\n3.可移植性差\r\n\r\n过多的使用存储过程会降低系统的移植性。在对存储进行相关扩展时，可能会增加一些额外的工作。                        存储过程与SQL语句如何抉择\r\n架构设计没有绝对，只有在当前的场景下最合适的。\r\n\r\n普通的项目开发中，不建议大量使用存储过程，对比SQL语句，存储过程适用于业务逻辑复杂，比较耗时，同时请求量较少的操作，例如后台大批量查询、定期更新等。\r\n\r\n（1）当一个事务涉及到多个SQL语句时或者涉及到对多个表的操作时可以考虑应用存储过程\r\n（2）在一个事务的完成需要很复杂的商业逻辑时可以考虑应用存储过程\r\n（3）比较复杂的统计和汇总可以考虑应用后台存储过程', '2017-04-11', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1016', 'Lily', 'HBase数据模型', '在 HBase 中，数据存储在表中，其中具有行和列。这个术语与关系型数据库（RDBMS）的重叠，但这不是有用的类比。相反，将 HBase 的表想象为多维的映射可能更有帮助。\r\n\r\nHBase 数据模型术语\r\n表\r\nHBase 表由多个行组成。\r\n\r\n行\r\nHBase 中的行由行键及一个或多个关联了值的列组成。行按照存储时的行键的字母序排序。因此，行键的设计非常重要。目标是以一种将相关的行存储在彼此相近的位置的方式存储。一种常用的行键模式是网站的域名。如果你的行键是域名，你可能应该以逆序存储它们（org.apache.www，org.apache.mail，org.apache.jira）。这种方式下，所有的 Apache 域名在表中是彼此接近的，而不是基于子域名的第一个字母而彼此分离。                                 HBase 中，一个行键只能标识一个行，还是可以标识多个行？\r\n\r\n列\r\nHBase 中的列由列族（column family）和列修饰符组成，它们由 : (冒号)\r\n字符分割。\r\n\r\n列族（column family）\r\n列族物理上共同定位一组列及其值，通常出于性能原因。每个列族具有一系列存储属性，比如它的值是否应该缓存在内存中，它的数据如何压缩或它的行键如何编码，及其它。表中的每一行具有相同的列族，尽管给定的行可能不存储任何给定的列族。\r\n\r\n表中的一行具有相同的列族，也就是说，每一行最多只能有一个列族。由此为何不直接将行键当作列族来用？在 HBase 中列族与行键之间是否有关系？\r\n\r\n列修饰符\r\n列修饰符被添加到列族以提供对给定的一片数据的索引。给定列族 content，一个列修饰符可能是 content:html，而另一个可能是 content:pdf。尽管列族在创建表时就固定了下来，而列修饰符是可变的，且在行之间可能存在这巨大的差异。                     单元（Cell）\r\n单元是行，列族和列修饰符的结合，且包含了值和时间戳，其表示值的版本。\r\n\r\n定位一个单元的过程为：行键 -> 列族 -> 列修饰符？\r\n\r\n时间戳\r\n时间戳伴随每个值写入，它是值的给定版本的标识符。默认情况下，时间戳表示 RegionServer 上数据写入时的时间，但你在将数据放入单元时，可以指定一个不同的时间戳值。\r\n\r\n概念视图\r\n你可以在 Jim R. Wilson 的博客文章 理解 HBase 和 BigTable 中读到非常易于理解的关于 HBase 数据模型的解释。另外一份很好的解释是 Amandeep Khurana 的 PDF 文档 Introduction to Basic Schema Design\r\n\r\n阅读不同的视角可能有助于对 HBase schema 设计有一个深入的理解。链接的文章涵盖与本节中的信息相同的基础。                               下面的例子是 BigTable 论文的第 2 页中的例子经过微小的改动而来。有一个称为 webtable 的表，其中包含了两行（com.cnn.www 和 com.example.www）及三个名为 contents，anchor 和 people 的列族。在这个例子里，第一行 (com.cnn.www) 中，anchor 包含两列 (anchor:cssnsi.com, anchor:my.look.ca)，contents 包含一列 (contents:html)。这个例子中，包含以 com.cnn.www 为行键的 5 个版本的行，及以 com.example.www 为行键的一个版本的行。contents:html 列修饰符包含给定网站的完整 HTML。每个 anchor 列族的修饰符包含外部站点，其链接到由行表示的网站，以及其在其链接的 anchor 中使用的文本。people 列族表示与站点关联的人。', '2017-03-10', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1017', 'Lisa', 'Support Annotations注解介绍以及自定义注解代替枚举', 'Android支持Java默认的那些注解，同时通过一些依赖库也额外提供了很多注解，了解并熟练使用这些注解能够让你的代码更加严谨，结构更加清晰、架构更易维护\r\n\r\nAndroid support library从19.1版本开始引入了一个新的注解库Support Annotations \r\nsupport appcompa-v7里面默认包含了这个库，如果你没有使用的话也可以通过添加单独依赖的方式引入。选取的25.2.0版本的，包含了如下几种类型的注解\r\n\r\n资源引用限制类：用于限制参数必须为对应的资源类型\r\n\r\nAnimRes AnyRes ArrayRes AttrRes BoolRes ColorRes DimenRes DrawableRes FractionRes IdRes IntegerRes InterpolatorRes LayoutRes MenuRes PluralsRes Px RawRes StringRes StyleableRes StyleRes TransitionRes XmlRes\r\n\r\n线程执行限制类：用于限制方法或者类必须在指定的线程执行\r\n\r\nAnyThread BinderThread MainThread UiThread WorkerThread\r\n\r\n参数为空性限制类：用于限制参数是否可以为空\r\n\r\nNonNull Nullable\r\n\r\n类型范围限制类：用于限制标注值的值范围\r\n\r\nFloatRang IntRange\r\n\r\n类型定义类：用于限制定义的注解的取值集合\r\n\r\nIntDef StringDef\r\n\r\n其他的功能性注解：\r\n\r\nCallSuper CheckResult ColorInt Dimension Keep Px RequiresApi RequiresPermission RestrictTo Size VisibleForTesting。线程执行限制类\r\n\r\n在我们编码的时候，合理的抽取代码为独立的方法是一个很好的习惯，不仅有利于代码的阅读以及相同逻辑的多处调用，也方便后期的重构，同时抽取代码的时候能够让你思考这块逻辑实现是否合理是否过于臃肿。但抽取出来的方法我们有可能放在编写的activity里也可能放在公共类或者变成静态方法，这个时候你不能保证知道调用者会在哪里使用你这段代码。除非他花时间去仔细阅读你的代码，否则他也不会知道他调用的方法里调用了多少方法，比如方法里包含了一些io操作的代码，或者方法执行特别耗时应该在子线程调用。或者方法里面操作了UI必须在主线程调用。这个时候就可以用线程执行限制类注解在你的方法上，当个调用者并没有再你期望的线程中调用这个方法时编译器就会报错。参数为空性限制类\r\n\r\n这个就比较简单了，大家在实现Android的SDK方法的时候经常可以在重写系统方法的时候遇到\r\n\r\nNonNull 标注在参数上时编译器会检查参数字段是否可能为空，标记在方法上时会检查返回的值是否为空。可能为空的情况编译器会提示你有一个潜在的崩溃危险\r\n\r\nNullable 标注在参数或有返回值的方法上，表明该参数或方法返回值可以为空。类型定义类\r\n\r\n一般用于替代枚举，当我们定义API时，有时候需要传入本地定义好的一些值。为了使这些值具有可读性我们会选择用静态常量，有时候需要限制参数的可取集合。而这些值得类型可能是基础数据类型。为了避免调用API的人传入了其他的不可处理的非预期值进来，我们往往会选择用枚举。而枚举是比较耗费性能的。这个时候我们就可以用注解来替代 \r\n比如我们有一个图片上传的API。上传类型需要选择jpg还是png，枚举的方式就是比较简单了。直接定义一个图片类型枚举。', '2017-04-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1018', 'David', 'Android应用设置多个启动图标，动态列换应用图标', '我们知道，设置一个应用的入口Activity，只需要在AndroidMainfest.xml文件中，在注册activity的节点下添加intent-filter，并设置action属性为acion.MAIN， category属性为category.LAUNCHER，应用就会将此activity作为应用程序的入口。这样该Activity就为应用程序的入口Activity，点击应用图标首次进入的界面。 \r\n在该activity标签下可以设置android:icon作为应用的图标， 设置android:label作为应用名称，如果没有设置启动Activity的icon和label属性，会默认使用application节点下icon和label属性中设置的应用图标和应用名称。\r\n\r\n如果一个应用设置多个Activity的intent-filter属性下的action为action.MAIN， category属性为category.LAUNCHER，则应用就会在launcher的生成多个应用图标，每个应用名称分别是我们在activity标签下定义的Activity的android:label的值。\r\n\r\n使用场景：我们的Android手机一般在launcher上存在联系人应用图标、拨号应用图标，其实这两个应用图标对应的是同一个应用，只是设置了两个入口，进入不同的Tab页面。我们可以事先在AndroidMainfest.xml文件中定义多个应用的入口组件（启动图标），在代码运行时控制组件的显示与隐藏，从而达到更换应用图标目的。由于在每年春节或是双11时，一些商家可能需要列换应用图标，我们可以在程序中通过时间来控制应用图标更换目的。那如何控制组件的显示与隐藏呢。 \r\n在讲解更换应用图标之前，我们先来了解下Android中如何禁用一个组件。（1)关闭组件的使用场景 \r\n在用到组件时，有时候我们可能暂时性的不使用组件，但又不想把组件kill掉，比如创建了一个broadcastReceiver广播监听器，用来监听第一次开机启动后获得系统的许多相关信息，并保存在文件中，这样以后每次开机启动就不需要再去启动该服务了，也就是说如果没有把receiver关闭掉，就算是不做数据处理，但程序却还一直在后台运行会消耗电量和内存，这时候就需要把这个receiver给关闭掉。 \r\n（2)如何关闭组件？ \r\n关闭组件其实并不难，只要创建packageManager对象和ComponentName对象，并调用packageManager对象的setComponentEnabledSetting方法。总结：给应用设置多个启动图标，并不是什么难的知识点，但咱们平时都没有关注过，有时觉得还有点不可思议，不自觉想起毛主席的那句话“一切困难都是纸老虎”，哈哈。 \r\n还有如何关闭一个组件，通过packageManager对象的setComponentEnabledSetting方法设置ComponentStatus状态即可，通过它就可以动态更换应用图标。 \r\n当然以下两种方法都需要咱们先预先在应用的AndroidMainfest.xml中设置好相应的标签，设置启动模式，设置相应的图标。如果想要应用动态换成任意图标，则还是需要升级应用。通过设置组件的状态，我们可以达到隐藏或是显示一个应用图标，从而达到更换应用图标的目的。', '2017-04-25', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1019', 'Tom', 'Java中HashMap和TreeMap的区别深入理解', '首先介绍一下什么是Map。在数组中我们是通过数组下标来对其内容索引的，而在Map中我们通过对象来对对象进行索引，用来索引的对象叫做key，其对应的对象叫做value。这就是我们平时说的键值对。\r\n\r\nHashMap通过hashcode对其内容进行快速查找，而 TreeMap中所有的元素都保持着某种固定的顺序，如果你需要得到一个有序的结果你就应该使用TreeMap（HashMap中元素的排列顺序是不固定的）。\r\n\r\nHashMap 非线程安全 TreeMap 非线程安全   线程安全  在Java里，线程安全一般体现在两个方面：\r\n\r\n1、多个thread对同一个java实例的访问（read和modify）不会相互干扰，它主要体现在关键字synchronized。如ArrayList和Vector，HashMap和Hashtable\r\n（后者每个方法前都有synchronized关键字）。如果你在interator一个List对象时，其它线程remove一个element，问题就出现了。\r\n\r\n2、每个线程都有自己的字段，而不会在多个线程之间共享。它主要体现在java.lang.ThreadLocal类，而没有Java关键字支持，如像static、transient那样。1.AbstractMap抽象类和SortedMap接口 AbstractMap抽象类：(HashMap继承AbstractMap)覆盖了equals()和hashCode()方法以确保两个相等映射返回相同的哈希码。如果两个映射大小相等、包含同样的键且每个键在这两个映射中对应的值都相同，则这两个映射相等。映射的哈希码是映射元素哈希码的总和，其中每个元素是Map.Entry接口的一个实现。因此，不论映射内部顺序如何，两个相等映射会报告相同的哈希码。\r\n\r\nSortedMap接口：（TreeMap继承自SortedMap）它用来保持键的有序顺序。SortedMap接口为映像的视图(子集)，包括两个端点提供了访问方法。除了排序是作用于映射的键以外，处理SortedMap和处理SortedSet一样。添加到SortedMap实现类的元素必须实现Comparable接口，否则您必须给它的构造函数提供一个Comparator接口的实现。TreeMap类是它的唯一一份实现。2.两种常规Map实现\r\n\r\nHashMap：基于哈希表实现。使用HashMap要求添加的键类明确定义了hashCode()和equals()[可以重写hashCode()和equals()]，为了优化HashMap空间的使用，您可以调优初始容量和负载因子。\r\n\r\n(1)HashMap(): 构建一个空的哈希映像\r\n(2)HashMap(Map m): 构建一个哈希映像，并且添加映像m的所有映射\r\n(3)HashMap(int initialCapacity): 构建一个拥有特定容量的空的哈希映像\r\n(4)HashMap(int initialCapacity, float loadFactor): 构建一个拥有特定容量和加载因子的空的哈希映像\r\n\r\nTreeMap：基于红黑树实现。TreeMap没有调优选项，因为该树总处于平衡状态。\r\n\r\n(1)TreeMap():构建一个空的映像树\r\n(2)TreeMap(Map m): 构建一个映像树，并且添加映像m中所有元素\r\n(3)TreeMap(Comparator c): 构建一个映像树，并且使用特定的比较器对关键字进行排序\r\n(4)TreeMap(SortedMap s): 构建一个映像树，添加映像树s中所有映射，并且使用与有序映像s相同的比较器排序3.两种常规Map性能\r\n\r\nHashMap：适用于在Map中插入、删除和定位元素。\r\nTreemap：适用于按自然顺序或自定义顺序遍历键(key)。\r\n\r\n4.总结\r\n\r\nHashMap通常比TreeMap快一点(树和哈希表的数据结构使然)，建议多使用HashMap，在需要排序的Map时候才用TreeMap。', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1020', 'Tonny', '云计算的那些事儿之计算虚拟化', '计算虚拟化分类\r\n\r\n计算虚拟化就是在虚拟系统和底层硬件之间抽象出CPU和内存等，以供虚拟机使用。计算虚拟化技术需要模拟出一套操作系统的运行环境，在这个环境你可以安装window也是可以按照Linux，这些操作系统被称作guestos。他们相互独立，互不影响（相对的，因为当主机资源不足会出现竞争等问题，导致运行缓慢等问题）。计算虚拟化可以将主机单个物理核虚拟出多个vcpu，这些vcpu本质上就是运行的进程，考虑到系统调度，所以并不是虚拟的核数越多越好；内存相似的，把物理机上面内存进行逻辑划分出多个段，供不同的虚拟机使用，每个虚拟机看到的都是自己独立的一个内存。除了这些还需要模拟网络设备、BIOS等。这个虚拟化软件叫做hypervisor，著名的有ESXI、xen、KVM等，通常分为两种，第一种是直接部署到物理服务器上面的。由于直接部署到裸机上面，hypervisor需要自带各种硬件驱动，虚拟机的所有操作都需要经过hypervisor。还有另一种虚拟化hypervisor，以KVM最为流行（个人电脑上面安装的virtualbox以及workstations也是），它们依赖与宿主机操作系统，这样的好处就是可以充分利用宿主机的各种资源管理以及驱动，但销量上面会打一些折扣。当然也可以从全虚拟化、半虚拟化、硬件辅助虚拟化的角度去说，现在数据中心基本都是硬件辅助虚拟化了，全虚拟化就是完全靠软件模拟、半虚拟需要修改操作让其知道自己运行在虚拟环境中、硬件辅助由硬件为每个guestos提供一套寄存器、guestos可以直接运行在特权级，这样提高效率。 \r\n虽然当前数据中心商用的虚拟化软件仍然以VMware的ESXI为主，但在OpenStack的推动下，KVM慢慢追赶并且KVM是开源的，下面简单介绍一下KVM。KVM是基于内核的，从内核2.6以后就自带了，可以运行在x86和power等主流架构上。 \r\nKVM主要是CPU和内存的虚拟化，其它设备的虚拟化和虚拟机的管理则需要依赖QEMU完成。一个虚拟机本质上就是一个进程，运行在QEMU-KVM进程地址空间，KVM（内核空间）和qemu（用户空间）相结合一起向用户提供完整的虚拟化环境。在硬件辅助虚拟化的环境中。CPU\r\n\r\nCPU具有根模式和非根模式，每种模式下又有ring0和ring3。宿主机运行在根模式下，宿主机的内核处于ring0，而用户态程序处于ring3，guestos运行在非根模式，相似的，guestos的内核运行在ring0，用户态程序运行在ring3。当处于非根模式的guestos，当外部中断或缺页异常，或者主动调用 VMCALL 指令调用 VMM 的服务的时候（与系统调用类似）的时候，硬件自动挂起 Guest OS，CPU会从非根模式切换到根模式，整个过程称为vm_exit，相反的，VMM 通过显式调用 VMLAUNCH 或 VMRESUME 指令切换到 VMX non-root operation 模式，硬件自动加载 Guest OS 的上下文，于是 Guest OS 获得运行，这种转换称为 VM entry。除了 CPU 虚拟化，另一个关键是内存虚拟化，通过内存虚拟化共享物理系统内存，动态分配给虚拟机。虚拟机的内存虚拟化很象现在的操作系统支持的虚拟内存方式，应用程序看到邻近的内存地址空间，这个地址空间无需和下面的物理机器内存直接对应，操作系统保持着虚拟页到物理页的映射。现在所有的 x86 CPU 都包括了一个称为内存管理的模块MMU（Memory Management Unit）和 TLB(Translation Lookaside Buffer)，通过MMU和TLB来优化虚拟内存的性能。KVM 实现客户机内存的方式是，利用mmap系统调用，在QEMU主线程的虚拟地址空间中申明一段连续的大小的空间用于客户机物理内存映射。', '2017-03-30', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1021', 'Jackson', ' Android图片加载框架最全解析（二），从源码的角度理解Glide的执行流程', '在开始解析Glide源码之前，我想先和大家谈一下该如何阅读源码，这个问题也是我平时被问得比较多的，因为很多人都觉得阅读源码是一件比较困难的事情。\r\n\r\n那么阅读源码到底困难吗？这个当然主要还是要视具体的源码而定。比如同样是图片加载框架，我读Volley的源码时就感觉酣畅淋漓，并且对Volley的架构设计和代码质量深感佩服。读Glide的源码时却让我相当痛苦，代码极其难懂。当然这里我并不是说Glide的代码写得不好，只是因为Glide和复杂程度和Volley完全不是在一个量级上的。\r\n\r\n那么，虽然源码的复杂程度是外在的不可变条件，但我们却可以通过一些技巧来提升自己阅读源码的能力。这里我和大家分享一下我平时阅读源码时所使用的技巧，简单概括就是八个字：抽丝剥茧、点到即止。应该认准一个功能点，然后去分析这个功能点是如何实现的。但只要去追寻主体的实现逻辑即可，千万不要试图去搞懂每一行代码都是什么意思，那样很容易会陷入到思维黑洞当中，而且越陷越深。因为这些庞大的系统都不是由一个人写出来的，每一行代码都想搞明白，就会感觉自己是在盲人摸象，永远也研究不透。如果只是去分析主体的实现逻辑，那么就有比较明确的目的性，这样阅读源码会更加轻松，也更加有成效。\r\n\r\n而今天带大家阅读的Glide源码就非常适合使用这个技巧，因为Glide的源码太复杂了，千万不要试图去搞明白它每行代码的作用，而是应该只分析它的主体实现逻辑。到底是如何实现将一张网络图片展示到ImageView上面的。先将Glide的一整套图片加载机制的基本流程梳理清楚，然后我们再通过后面的几篇文章具体去了解Glide源码方方面面的细节。既然是要阅读Glide的源码，那么我们自然需要先将Glide的源码下载下来。其实如果你是使用在build.gradle中添加依赖的方式将Glide引入到项目中的，那么源码自动就已经下载下来了，在Android Studio中就可以直接进行查看。\r\n\r\n不过，使用添加依赖的方式引入的Glide，我们只能看到它的源码，但不能做任何的修改，如果你还需要修改它的源码的话，可以到GitHub上面将它的完整源码下载下来。可以看到，with()方法的重载种类非常多，既可以传入Activity，也可以传入Fragment或者是Context。每一个with()方法重载的代码都非常简单，都是先调用RequestManagerRetriever的静态get()方法得到一个RequestManagerRetriever对象，这个静态get()方法就是一个单例实现，没什么需要解释的。然后再调用RequestManagerRetriever的实例get()方法，去获取RequestManager对象。', '2017-04-18', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1022', 'Mary', 'OpenCV玩九宫格数独：knn数字识别', '首先需要说明，这里所说的数字识别不是手写数字识别！\r\n\r\n但凡对机器学习有所了解的人，相信看到数字识别的第一反应就是MNIST。MNIST是可以进行数字识别，但是那是手写数字。我们现在要做的是要识别从九宫格图片中提取出来的印刷体的数字。手写数字集训练出来的模型用来识别印刷体数字，显然不太专业。而且手写体跟印刷体相差不小，我们最看重的正确率问题不能保证。\r\n\r\n本文从零开始做一遍数字识别，展示了数字识别的完整流程。从收集数据开始，到数据预处理，再到训练KNN，最后进行数字识别。\r\n\r\n我们一步一步来说。显然，我们第一步要做的就是上一节的内容，那就是把图片中的数字分别提取出来。\r\n\r\n训练knn，还有其他任何有监督的机器学习模型，不光要有样本数据，还要有知道每一个样本对应的标签。这也是为什么我要选择上面这样按顺序排列的数字图片。\r\n\r\n提取数字之后，我们可以对每一个数字的位置进行排序，然后根据位置信息可以知道每一个数字是几。标签也就由此生成了。\r\n\r\n这一部分的内容可以分两部分来说，第一部分就是提取数字，第二部分是提取数字之后的数据预处理。\r\n\r\n1.提取数字\r\n\r\n提取数字的处理流程与上一篇内容差不多：\r\n\r\n1.遍历文件夹下的原始数字图片；\r\n\r\n2.对每一张图片进行轮廓提取操作，只提取外围轮廓。3.求轮廓外包矩形，并根据矩形大小信息筛选出所有的数字轮廓；\r\n\r\n4.然后根据位置信息对数字框排序，显然第一排依次是12345，第二排依次是67890；', '2017-04-13', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1023', 'Amy', 'java线程详解', '线程与进程的区别\r\n\r\n（1）程序是一段静态的代码，进程是程序的一次动态执行过程，它是操作系统资源调度的基本单位。线程是比进程更小的执行单位，一个进程在其执行过程中，可以产生多个线程，所以又称线程为“轻型进程”。虽然说可以并发运行多个线程，但在任何时刻cpu只运行一个线程，只是宏观上看好像是同时运行，其实微观上它们只是快速交替执行的。这就是Java中的多线程机制。 \r\n（2）不同进程的代码、内部数据和状态都是完全独立的，而一个程序内的多线程是共享同一块内存空间和同一组系统资源的，有可能互相影响。 \r\n（3）线程切换比进程切换的负担要小。线程的创建\r\n\r\njava提供了类java.lang.Thread来支持多线程编程，创建线程主要有两种方法：\r\n\r\n（1）继承Thread类\r\n\r\nThread类中的run 方法是空的，直接通过 Thread类实例化的线程对象不能完成任何事，所以可以通过继承Thread 类，重写run 方法，实现具有各种不同功能的线程类。 \r\nrun()又称为线程体，不能直接调用run()，而是通过调用start()，让线程自动调用run()，因为start()会首先进行与多线程相关的初始化（即让start()做准备工作）。（2）实现Runnable接口\r\n\r\njava只允许单继承，如果类已经继承了其他类，就不能再继承Thread类了，所以提供了实现Runnable接口来创建线程的方式。 \r\n该接口只定义了一个run方法，在新类中实现它即可。Runnable接口并没有任何对线程的支持，还必须通过创建Thread类的实例，将Rnnable接口对象作为Thread类构造方法的参数传递进去，从而创建一个线程。注意：如果当前线程是通过继承Thread类创建的，则访问当前线程可以直接使用this，如果当前线程是通过实现Runnable接口创建的，则通过调用Thread.currentThread()方法来获取当前线程。线程的生命周期\r\n\r\n按照线程体在计算机系统内存中状态的不同，可以将线程分为以下5种状态： \r\n（1）创建状态 \r\n新建一个线程对象，仅仅作为一个实例存在，JVM没有为其分配运行资源。 \r\n（2）就绪状态 \r\n创建状态的线程调用start方法后，转换为就绪状态，此时线程已得到除CPU时间之外的其他系统资源，一旦获得CPU，就进入运行状态。注意的是，线程没有结束run()方法之前，不能再调用start()方法，否则将发生IllegalThreadStateException异常，即启动的线程不能再启动。 \r\n（3）运行状态 \r\n就绪状态的线程获取了CPU，执行程序代码。 \r\n（4）阻塞状态 \r\n阻塞状态是线程因为某种原因放弃CPU使用权，暂时停止运行。直到线程进入就绪状态，才有机会转到运行状态。阻塞的情况分三种：（一）、等待阻塞：运行的线程执行wait()方法，JVM会把该线程放入等待池中。（二）、同步阻塞：运行的线程在获取对象的同步锁时，若该同步锁被别的线程占用，则JVM会把该线程放入锁池中。（三）、其他阻塞：运行的线程执行sleep()或join()方法，或者发出了I/O请求时，JVM会把该线程置为阻塞状态。当sleep()状态超时、join()等待线程终止或者超时、或者I/O处理完毕时，线程重新转入就绪状态。 \r\n（5）死亡状态 \r\n线程死亡的原因有两个：一是执行完了线程体（run方法），二是因为异常run方法被强制性终止。如果线程进入死亡状态，JVM会收回线程占用的资源（释放分配给线程对象的内存）。 \r\n注意：调用stop()可以使线程立即进入死亡状态，不过该方法现在已经不推荐使用了，线程的退出通常采用自然终止的方法，不建议人工强制停止，容易引起“死锁”。sleep()：可以以毫秒为单位，指定休眠一段时间（作为参数），时间一过，又进入就绪状态。 \r\nwait()和notify()：wait使得线程进入阻塞状态，它有两种形式，一种是允许指定以毫秒为单位的一段时间作为参数的，另一种是无参数的。前者当对应的notify方法被调用或超出指定时间时线程重新进入就绪状态，后者则必须调用notify方法才能重新进入就绪状态。 \r\n注意：此外，还有suspend方法（对应的恢复则用resume方法）也能使线程进入阻塞状态，不过这个方法现在已经不提倡使用了，会引起“死锁”，因为调用该方法会释放占用的所有资源，由JVM调度转入临时存储空间。', '2017-04-26', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1024', 'Olivia', '【Unity3D】利用物体碰撞检测、键盘输入处理完成平衡球游戏', '物体碰撞检测是游戏编程里面非常常用的功能，一旦碰到就怎么怎么样，比如掉血等。Unity3D直接就提供了物体碰撞检测的接口，实现起来很方便。借此功能，完成了一个平衡球游戏，同时说明Unity3D的物体碰撞检测、键盘输入处理的检测的使用。一、场景布置\r\n\r\n1、UI方面布置如下所示，基本就是《【Unity3D】对话框、隐藏与显示、拖拽》（点击打开链接）的内容，不赘述了。StartModal和GameoverModal本质是Image，将他们重叠在一起，一会儿将用脚本隐藏GameoverModal。2、大致上3D的场景布置如下图所示，基本上就《【Unity3D】物体、材质的设置、物体位移与旋转》（点击打开链接）的内容，也没什么难的。注意，此处的Cube的透明材质，不是默认的Diffuse，而是带透明的Transparent/Diffuse。唯一需要注意的是，组成盒子的4个Cube，由于Plane的实际大小刚好是10x10，那么就应该分别在XOZ平面的(5,0),(-5,0),(0,5),(0,-5)的位置，且在(5,0)和(-5,0)平面的两个Cube，在X方面只延伸0.1，Z方面延伸10，高度Y方面延伸2，而在(0,5),(0,-5)的两个Cube，则刚好反之，在在X方面只延伸10，Z方面延伸0.1，高度Y方面同样延伸2个位置，刚好形成四堵墙。做好之后，将其余3堵墙拖到其中1个下面，构成一个整体，再同盒子底面的Cube共同拖到Plane之下。\r\n\r\n3、我们还需要对作为盒子边缘墙体的父Cube赋予Tag     4、同时还要创建一个空物体GameObject赋予脚本。\r\n\r\n二、脚本设置\r\n\r\n设置脚本也很简单，具体在《【Unity3D】Helloworld》（点击打开链接）将ui.cs赋予给空物体GameObject之后，和《【Unity3D】场景切换、UGUI组件事件、开始游戏与关闭游戏》（点击打开链接）提到的方法一样，设置StartModal中的Button按钮的OnClick事件为onStart()，而GameoverModal中的Button按钮的OnClick事件为onRestart()。此脚本注意在初始化的时候要重新打开时间结界，虽然Time.timeScale默认是等于1的，但因为下面一些列的操作会导致Time.timeScale=0，在ui.cs的重新载入场景不会更新这个Time.timeScale，并同时注意获取这个GameModal实例。这是必要的，不是画蛇添足，具体原因在《【Unity3D】SetActive的NullReferenceException与LoadLevel的初始化》说过了。至此，整个游戏做完，编译，发布，则得到一个平衡球的游戏。\r\n\r\n这里不设置4个cube围着plane，直接用碰撞结束OnCollsionExit判断游戏是否结束是不行的，因为小球在滚动过程中，是会跳动的，在某几个没有滑出Plane的瞬间，是会因Plane的旋转产生的跳动，而偶尔离开这个Plane的。', '2017-04-17', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1025', 'Henry', '从零开始，学习web前端之CSS3', 'CSS3是CSS2的“进化”版本，在CSS2基础上，增强或新增了许多特性， 弥补了CSS2的众多不足之处，使得Web开发变得更为高效和便捷。 \r\nW3C的CSS3规范仍在开发。但是，许多新的CSS3属性已在现代浏览器使用。目前浏览器对css3的兼容并不是太好，有些属性我们需要加上浏览器的前缀。理解伪类和伪元素 \r\n伪类用于当已有元素处于的某个状态时，为其添加对应的样式，这个状态是根据用户行为而动态变化的。比如说，当用户悬停在指定的元素时，我们可以通过:hover来描述这个元素的状态。虽然它和普通的css类相似，可以为已有的元素添加样式，但是它只有处于dom树无法描述的状态下才能为元素添加样式，所以将其称为伪类。\r\n\r\n伪元素用于创建一些不在文档树中的元素，并为其添加样式。比如说，我们可以通过::before来在一个元素前增加一些文本，并为这些文本添加样式。虽然用户可以看到这些文本，但是这些文本实际上不在文档树中。\r\n\r\n伪类是用单冒号来表示 \r\n伪元素是使用双冒号来表示\r\n\r\nE:after、E:before 在旧版本里是伪类，在新版本里是伪元素，新版本下E:after、E:before会被自动识别为E::after、E::before，按伪元素来对待，这样做的目的是用来做兼容处理。边框阴影 \r\nbox-shadow\r\n\r\nbox-shadow 与 text/shadow 用法差不多 \r\n1、水平偏移量 正值向右 负值向左； \r\n2、垂直偏移量 正值向下 负值向上； \r\n3、模糊度是不能为负值； \r\n4、inset可以设置内阴影；\r\n\r\n设置边框阴影不会改变盒子的大小，即不会影响其兄弟元素的布局。 \r\n可以设置多重边框阴影，实现更好的效果，增强立体感。过渡(transition)\r\n\r\n过渡是CSS3中具有颠覆性的特征之一，可以实现元素不同状态间的平滑过渡（补间动画），经常用来制作动画效果。 \r\n之前我们用jquery来实现动画效果，但是jquery并不能改变颜色。弹性盒子 （ Flexible Box 或 flexbox）\r\n\r\n弹性盒子是 CSS3 的一种新的布局模式。也叫伸缩盒。是一种当页面需要适应不同的屏幕大小以及设备类型时确保元素拥有恰当的行为的布局方式。类似与Android中线性布局中的权重（weight）。 \r\n引入弹性盒布局模型的目的是提供一种更加有效的方式来对一个容器中的子元素进行排列、对齐和分配空白空间。flex-shrink\r\n\r\n定义了项目的缩小比例，默认为1，即如果空间不足，该项目将缩小。 \r\n如果所有项目的flex-shrink属性都为1，当空间不足时，都将等比例缩小。如果一个项目的flex-shrink属性为0，其他项目都为1，则空间不足时，前者不缩小。理解伪类和伪元素 \r\n伪类用于当已有元素处于的某个状态时，为其添加对应的样式，这个状态是根据用户行为而动态变化的。比如说，当用户悬停在指定的元素时，我们可以通过:hover来描述这个元素的状态。虽然它和普通的css类相似，可以为已有的元素添加样式，但是它只有处于dom树无法描述的状态下才能为元素添加样式，所以将其称为伪类。\r\n\r\n伪元素用于创建一些不在文档树中的元素，并为其添加样式。比如说，我们可以通过::before来在一个元素前增加一些文本，并为这些文本添加样式。虽然用户可以看到这些文本，但是这些文本实际上不在文档树中。', '2017-03-26', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1026', 'Kim', 'Support Annotations注解介绍以及自定义注解代替枚举', 'Android支持Java默认的那些注解，同时通过一些依赖库也额外提供了很多注解，了解并熟练使用这些注解能够让你的代码更加严谨，结构更加清晰、架构更易维护\r\n\r\nAndroid support library从19.1版本开始引入了一个新的注解库Support Annotations \r\nsupport appcompa-v7里面默认包含了这个库，如果你没有使用的话也可以通过添加单独依赖的方式引入 。选取的25.2.0版本的，包含了如下几种类型的注解\r\n\r\n资源引用限制类：用于限制参数必须为对应的资源类型\r\n\r\nAnimRes AnyRes ArrayRes AttrRes BoolRes ColorRes DimenRes DrawableRes FractionRes IdRes IntegerRes InterpolatorRes LayoutRes MenuRes PluralsRes Px RawRes StringRes StyleableRes StyleRes TransitionRes XmlRes\r\n\r\n线程执行限制类：用于限制方法或者类必须在指定的线程执行\r\n\r\nAnyThread BinderThread MainThread UiThread WorkerThread\r\n\r\n参数为空性限制类：用于限制参数是否可以为空\r\n\r\nNonNull Nullable\r\n\r\n类型范围限制类：用于限制标注值的值范围\r\n\r\nFloatRang IntRange\r\n\r\n类型定义类：用于限制定义的注解的取值集合\r\n\r\nIntDef StringDef\r\n\r\n其他的功能性注解：\r\n\r\nCallSuper CheckResult ColorInt Dimension Keep Px RequiresApi RequiresPermission RestrictTo Size VisibleForTesting\r\n\r\n下面分别举例怎么使用。资源引用限制类\r\n\r\n用于当我们期望的输入为所注解对应的类型时，可以加上对应的资源类型注解。这样如果输入了非预期类型的资源ID就编译器就会报错，比如我们在写项目框架时定义了一个设置主布局的抽象方法，需要子类继承该类是实现这个方法，返回一个layout布局ID。这样这是限制了返回的数据类型必须为int。如果实现该类的人穿了一个drawable的ID或者一个int数值，也是可以正常编译的。要等到运行到该界面时才会报错。这个时候我们就可以用Support Annotations包提供的注解来标注该方法。这样当实现该类的人传入一个非layout的ID时编译器就会报except resource of type layout异常 而导致无法编译 。\r\n\r\n线程执行限制类\r\n\r\n在我们编码的时候，合理的抽取代码为独立的方法是一个很好的习惯，不仅有利于代码的阅读以及相同逻辑的多处调用，也方便后期的重构，同时抽取代码的时候能够让你思考这块逻辑实现是否合理是否过于臃肿。但抽取出来的方法我们有可能放在编写的activity里也可能放在公共类或者变成静态方法，这个时候你不能保证知道调用者会在哪里使用你这段代码。\r\n\r\n除非他花时间去仔细阅读你的代码，否则他也不会知道他调用的方法里调用了多少方法，比如方法里包含了一些io操作的代码，或者方法执行特别耗时应该在子线程调用。或者方法里面操作了UI必须在主线程调用。这个时候就可以用线程执行限制类注解在你的方法上，当个调用者并没有再你期望的线程中调用这个方法时编译器就会报错。\r\n\r\n需要注意的是这些注解的作用域是类和方法。标注与某个类时表明该类以及内部的所以方法都必须在指定线程调用执行，包括构造方法。 ', '2017-04-12', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1027', 'Amber', '云计算的那些事儿之计算虚拟化', '计算虚拟化分类\r\n\r\n计算虚拟化就是在虚拟系统和底层硬件之间抽象出CPU和内存等，以供虚拟机使用。计算虚拟化技术需要模拟出一套操作系统的运行环境，在这个环境你可以安装window也是可以按照Linux，这些操作系统被称作guestos。他们相互独立，互不影响（相对的，因为当主机资源不足会出现竞争等问题，导致运行缓慢等问题）。计算虚拟化可以将主机单个物理核虚拟出多个vcpu，这些vcpu本质上就是运行的进程，考虑到系统调度，所以并不是虚拟的核数越多越好；内存相似的，把物理机上面内存进行逻辑划分出多个段，供不同的虚拟机使用，每个虚拟机看到的都是自己独立的一个内存。除了这些还需要模拟网络设备、BIOS等。这个虚拟化软件叫做hypervisor，著名的有ESXI、xen、KVM等，通常分为两种，第一种是直接部署到物理服务器上面的。由于直接部署到裸机上面，hypervisor需要自带各种硬件驱动，虚拟机的所有操作都需要经过hypervisor。还有另一种虚拟化hypervisor，以KVM最为流行（个人电脑上面安装的virtualbox以及workstations也是），它们依赖与宿主机操作系统，这样的好处就是可以充分利用宿主机的各种资源管理以及驱动，但销量上面会打一些折扣。当然也可以从全虚拟化、半虚拟化、硬件辅助虚拟化的角度去说，现在数据中心基本都是硬件辅助虚拟化了，全虚拟化就是完全靠软件模拟、半虚拟需要修改操作让其知道自己运行在虚拟环境中、硬件辅助由硬件为每个guestos提供一套寄存器、guestos可以直接运行在特权级，这样提高效率。 \r\n虽然当前数据中心商用的虚拟化软件仍然以VMware的ESXI为主，但在OpenStack的推动下，KVM慢慢追赶并且KVM是开源的，下面简单介绍一下KVM。KVM是基于内核的，从内核2.6以后就自带了，可以运行在x86和power等主流架构上。 \r\nKVM主要是CPU和内存的虚拟化，其它设备的虚拟化和虚拟机的管理则需要依赖QEMU完成。一个虚拟机本质上就是一个进程，运行在QEMU-KVM进程地址空间，KVM（内核空间）和qemu（用户空间）相结合一起向用户提供完整的虚拟化环境。在硬件辅助虚拟化的环境中。CPU具有根模式和非根模式，每种模式下又有ring0和ring3。宿主机运行在根模式下，宿主机的内核处于ring0，而用户态程序处于ring3，guestos运行在非根模式，相似的，guestos的内核运行在ring0，用户态程序运行在ring3。当处于非根模式的guestos，当外部中断或缺页异常，或者主动调用 VMCALL 指令调用 VMM 的服务的时候（与系统调用类似）的时候，硬件自动挂起 Guest OS，CPU会从非根模式切换到根模式，整个过程称为vm_exit，相反的，VMM 通过显式调用 VMLAUNCH 或 VMRESUME 指令切换到 VMX non-root operation 模式，硬件自动加载 Guest OS 的上下文，于是 Guest OS 获得运行，这种转换称为 VM entry。除了 CPU 虚拟化，另一个关键是内存虚拟化，通过内存虚拟化共享物理系统内存，动态分配给虚拟机。虚拟机的内存虚拟化很象现在的操作系统支持的虚拟内存方式，应用程序看到邻近的内存地址空间，这个地址空间无需和下面的物理机器内存直接对应，操作系统保持着虚拟页到物理页的映射。现在所有的 x86 CPU 都包括了一个称为内存管理的模块MMU（Memory Management Unit）和 TLB(Translation Lookaside Buffer)，通过MMU和TLB来优化虚拟内存的性能。KVM 实现客户机内存的方式是，利用mmap系统调用，在QEMU主线程的虚拟地址空间中申明一段连续的大小的空间用于客户机物理内存映射。 ', '2017-04-20', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1028', 'Sunny', 'Java中堆内存和栈内存详解', 'Java把内存分成两种，一种叫做栈内存，一种叫做堆内存.\r\n\r\n在函数中定义的一些基本类型的变量和对象的引用变量都是在函数的栈内存中分配。当在一段代码块中定义一个变量时，java就在栈中为这个变量分配内存空间，当超过变量的作用域后，java会自动释放掉为该变量分配的内存空间，该内存空间可以立刻被另作他用。\r\n\r\n堆内存用于存放由new创建的对象和数组。在堆中分配的内存，由java虚拟机自动垃圾回收器来管理。在堆中产生了一个数组或者对象后，还可以在栈中定义一个特殊的变量，这个变量的取值等于数组或者对象在堆内存中的首地址，在栈中的这个特殊的变量就变成了数组或者对象的引用变量，以后就可以在程序中使用栈内存中的引用变量来访问堆中的数组或者对象，引用变量相当于为数组或者对象起的一个别名，或者代号。\r\n\r\n引用变量是普通变量，定义时在栈中分配内存，引用变量在程序运行到作用域外释放。而数组＆对象本身在堆中分配，即使程序运行到使用new产生数组和对象的语句所在地代码块之外，数组和对象本身占用的堆内存也不会被释放，数组和对象在没有引用变量指向它的时候，才变成垃圾，不能再被使用，但是仍然占着内存，在随后的一个不确定的时间被垃圾回收器释放掉。这个也是java比较占内存的主要原因，实际上，栈中的变量指向堆内存中的变量，这就是 Java 中的指针!\r\n\r\njava中内存分配策略及堆和栈的比较。1 内存分配策略\r\n\r\n按照编译原理的观点,程序运行时的内存分配有三种策略,分别是静态的,栈式的,和堆式的.\r\n\r\n静态存储分配是指在编译时就能确定每个数据目标在运行时刻的存储空间需求,因而在编译时就可以给他们分配固定的内存空间.这种分配策略要求程序代码中不允许有可变数据结构(比如可变数组)的存在,也不允许有嵌套或者递归的结构出现,因为它们都会导致编译程序无法计算准确的存储空间需求.\r\n\r\n栈式存储分配也可称为动态存储分配,是由一个类似于堆栈的运行栈来实现的.和静态存储分配相反,在栈式存储方案中,程序对数据区的需求在编译时是完全未知的,只有到运行的时候才能够知道,但是规定在运行中进入一个程序模块时,必须知道该程序模块所需的数据区大小才能够为其分配内存.和我们在数据结构所熟知的栈一样,栈式存储分配按照先进后出的原则进行分配。\r\n\r\n静态存储分配要求在编译时能知道所有变量的存储要求,栈式存储分配要求在过程的入口处必须知道所有的存储要求,而堆式存储分配则专门负责在编译时或运行时模块入口处都无法确定存储要求的数据结构的内存分配,比如可变长度串和对象实例.堆由大片的可利用块或空闲块组成,堆中的内存可以按照任意顺序分配和释放。2 堆和栈的比较\r\n\r\n上面的定义从编译原理的教材中总结而来,除静态存储分配之外,都显得很呆板和难以理解,下面撇开静态存储分配,集中比较堆和栈:\r\n\r\n从堆和栈的功能和作用来通俗的比较,堆主要用来存放对象的，栈主要是用来执行程序的.而这种不同又主要是由于堆和栈的特点决定的:\r\n\r\n在编程中，例如C/C++中，所有的方法调用都是通过栈来进行的,所有的局部变量,形式参数都是从栈中分配内存空间的。实际上也不是什么分配,只是从栈顶向上用就行,就好像工厂中的传送带(conveyor belt)一样,Stack Pointer会自动指引你到放东西的位置,你所要做的只是把东西放下来就行.退出函数的时候，修改栈指针就可以把栈中的内容销毁.这样的模式速度最快, 当然要用来运行程序了.需要注意的是,在分配的时候,比如为一个即将要调用的程序模块分配数据区时,应事先知道这个数据区的大小,也就说是虽然分配是在程序运行时进行的,但是分配的大小多少是确定的,不变的,而这个”大小多少”是在编译时确定的,不是在运行时.\r\n\r\n堆是应用程序在运行的时候请求操作系统分配给自己内存，由于从操作系统管理的内存分配,所以在分配和销毁时都要占用时间，因此用堆的效率非常低.但是堆的优点在于,编译器不必知道要从堆里分配多少存储空间，也不必知道存储的数据要在堆里停留多长的时间,因此,用堆保存数据时会得到更大的灵活性。事实上,面向对象的多态性,堆内存分配是必不可少的,因为多态变量所需的存储空间只有在运行时创建了对象之后才能确定.在C++中，要求创建一个对象时，只需用 new命令编制相关的代码即可。执行这些代码时，会在堆里自动进行数据的保存.当然，为达到这种灵活性，必然会付出一定的代价:在堆里分配存储空间时会花掉更长的时间!这也正是导致我们刚才所说的效率低的原因,看来列宁同志说的好,人的优点往往也是人的缺点,人的缺点往往也是人的优点(晕~).', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1029', 'Daniel', 'Java设计模式六大原则之场景应用分析', '定义：不要存在多于一个导致类变更的原因。通俗的说，即一个类只负责一项职责。 问题由来：类T负责两个不同的职责：职责P1，职责P2。当由于职责P1需求发生改变而需要修改类T时，有可能会导致原本运行正常的职责P2功能发生故障。\r\n\r\n  解决方案：遵循单一职责原则。分别建立两个类T1、T2，使T1完成职责P1功能，T2完成职责P2功能。这样，当修改类T1时，不会使职责P2发生故障风险；同理，当修改T2时，也不会使职责P1发生故障风险。\r\n\r\n  说到单一职责原则，很多人都会不屑一顾。因为它太简单了。稍有经验的程序员即使从来没有读过设计模式、从来没有听说过单一职责原则，在设计软件时也会自觉的遵守这一重要原则，因为这是常识。在软件编程中，谁也不希望因为修改了一个功能导致其他的功能发生故障。而避免出现这一问题的方法便是遵循单一职责原则。虽然单一职责原则如此简单，并且被认为是常识，但是即便是经验丰富的程序员写出的程序，也会有违背这一原则的代码存在。为什么会出现这种现象呢？因为有职责扩散。所谓职责扩散，就是因为某种原因，职责P被分化为粒度更细的职责P1和P2。\r\n\r\n  比如：类T只负责一个职责P，这样设计是符合单一职责原则的。后来由于某种原因，也许是需求变更了，也许是程序的设计者境界提高了，需要将职责P细分为粒度更细的职责P1，P2，这时如果要使程序遵循单一职责原则，需要将类T也分解为两个类T1和T2，分别负责P1、P2两个职责。但是在程序已经写好的情况下，这样做简直太费时间了。所以，简单的修改类T，用它来负责两个职责是一个比较不错的选择，虽然这样做有悖于单一职责原则。（这样做的风险在于职责扩散的不确定性，因为我们不会想到这个职责P，在未来可能会扩散为P1，P2，P3，P4……Pn。所以记住，在职责扩散到我们无法控制的程度之前，立刻对代码进行重构。）可以看到，这种修改方式要简单的多。但是却存在着隐患：有一天需要将鱼分为呼吸淡水的鱼和呼吸海水的鱼，则又需要修改Animal类的breathe方法，而对原有代码的修改会对调用“猪”“牛”“羊”等相关功能带来风险，也许某一天你会发现程序运行的结果变为“牛呼吸水”了。这种修改方式直接在代码级别上违背了单一职责原则，虽然修改起来最简单，但隐患却是最大的。可以看到，这种修改方式没有改动原来的方法，而是在类中新加了一个方法，这样虽然也违背了单一职责原则，但在方法级别上却是符合单一职责原则的，因为它并没有动原来方法的代码。这三种方式各有优缺点，那么在实际编程中，采用哪一中呢？其实这真的比较难说，需要根据实际情况来确定。我的原则是：只有逻辑足够简单，才可以在代码级别上违反单一职责原则；只有类中方法数量足够少，才可以在方法级别上违反单一职责原则；\r\n\r\n  例如本文所举的这个例子，它太简单了，它只有一个方法，所以，无论是在代码级别上违反单一职责原则，还是在方法级别上违反，都不会造成太大的影响。实际应用中的类都要复杂的多，一旦发生职责扩散而需要修改类时，除非这个类本身非常简单，否则还是遵循单一职责原则的好。\r\n\r\n遵循单一职责原的优点有：\r\n\r\n可以降低类的复杂度，一个类只负责一项职责，其逻辑肯定要比负责多项职责简单的多； -提高类的可读性，提高系统的可维护性；\r\n\r\n变更引起的风险降低，变更是必然的，如果单一职责原则遵守的好，当修改一个功能时，可以显著降低对其他功能的影响。 需要说明的一点是单一职责原则不只是面向对象编程思想所特有的，只要是模块化的程序设计，都适用单一职责原则。', '2017-04-20', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1030', 'James', 'Hash算法总结', '1. Hash是什么，它的作用\r\n\r\n先举个例子。我们每个活在世上的人，为了能够参与各种社会活动，都需要一个用于识别自己的标志。也许你觉得名字或是身份证就足以代表你这个人，但是这种代表性非常脆弱，因为重名的人很多，身份证也可以伪造。最可靠的办法是把一个人的所有基因序列记录下来用来代表这个人，但显然，这样做并不实际。而指纹看上去是一种不错的选择，虽然一些专业组织仍然可以模拟某个人的指纹，但这种代价实在太高了。\r\n\r\n而对于在互联网世界里传送的文件来说，如何标志一个文件的身份同样重要。比如说我们下载一个文件，文件的下载过程中会经过很多网络服务器、路由器的中转，如何保证这个文件就是我们所需要的呢？我们不可能去一一检测这个文件的每个字节，也不能简单地利用文件名、文件大小这些极容易伪装的信息，这时候，我们就需要一种指纹一样的标志来检查文件的可靠性，这种指纹就是我们现在所用的Hash算法(也叫散列算法)。\r\n\r\n散列算法（Hash Algorithm），又称哈希算法，杂凑算法，是一种从任意文件中创造小的数字「指纹」的方法。与指纹一样，散列算法就是一种以较短的信息来保证文件唯一性的标志，这种标志与文件的每一个字节都相关，而且难以找到逆向规律。因此，当原有文件发生改变时，其标志值也会发生改变，从而告诉文件使用者当前的文件已经不是你所需求的文件。\r\n\r\n这种标志有何意义呢？之前文件下载过程就是一个很好的例子，事实上，现在大部分的网络部署和版本控制工具都在使用散列算法来保证文件可靠性。而另一方面，我们在进行文件系统同步、备份等工具时，使用散列算法来标志文件唯一性能帮助我们减少系统开销，这一点在很多云存储服务器中都有应用。当然，作为一种指纹，散列算法最重要的用途在于给证书、文档、密码等高安全系数的内容添加加密保护。这一方面的用途主要是得益于散列算法的不可逆性，这种不可逆性体现在，你不仅不可能根据一段通过散列算法得到的指纹来获得原有的文件，也不可能简单地创造一个文件并让它的指纹与一段目标指纹相一致。散列算法的这种不可逆性维持着很多安全框架的运营，而这也将是本文讨论的重点。2. Hash算法有什么特点\r\n\r\n一个优秀的 hash 算法，将能实现：\r\n\r\n正向快速：给定明文和 hash 算法，在有限时间和有限资源内能计算出 hash 值。\r\n逆向困难：给定（若干） hash 值，在有限时间内很难（基本不可能）逆推出明文。\r\n输入敏感：原始输入信息修改一点信息，产生的 hash 值看起来应该都有很大不同。\r\n冲突避免：很难找到两段内容不同的明文，使得它们的 hash 值一致（发生冲突）。即对于任意两个不同的数据块，其hash值相同的可能性极小；对于一个给定的数据块，找到和它hash值相同的数据块极为困难。\r\n但在不同的使用场景中，如数据结构和安全领域里，其中对某一些特点会有所侧重。2.1 Hash在管理数据结构中的应用\r\n\r\n在用到hash进行管理的数据结构中，就对速度比较重视，对抗碰撞不太看中，只要保证hash均匀分布就可以。比如hashmap，hash值（key）存在的目的是加速键值对的查找，key的作用是为了将元素适当地放在各个桶里，对于抗碰撞的要求没有那么高。换句话说，hash出来的key，只要保证value大致均匀的放在不同的桶里就可以了。但整个算法的set性能，直接与hash值产生的速度有关，所以这时候的hash值的产生速度就尤为重要。', '2017-04-11', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1031', 'Kate', '正则表达式归纳总结', '正则表达式\r\n\r\n1. 使用正则\r\n\r\n创建正则表达式有两种方式，一种是以字面量方式创建，另一种是使用RegExp构造函数来创建。其中模式(pattern)部分可以是任何简单或复杂的正则表达式，可以包含字符类、限定符、分组、向前查找以及反向引用。 \r\n每个正则表达式都可带有以或多个标志(flags)，用以表明正则表达式的行为。注：flag为可选项，表示匹配模式，主要有一下3种标志。\r\n\r\ng : 表示全局(global)模式，即模式将被应用于所有字符串，而非在发现第一个匹配项时立即停止；\r\ni : 表示不区分大小写(case-insensitive)模式，即在确定匹配项时忽略模式与字符串的大小写;\r\nm : 表示多行(multiline)模式，即在到达一行文本末尾时还会继续查找下一行中是否存在与模式匹配的项。1.1 RegExp 实例属性\r\n\r\n每个RegExp实例对象都会存在下列属性：\r\n\r\nglobal : 布尔值，表示是否设置了g标志\r\nignoreCase : 布尔值，表示是否设置了i标志\r\nmultiline : 布尔值，表示是否设置了m标志\r\nlastIndex : 整数，表示开始搜索下一个匹配项的字符位置，从0算起\r\nsource : 正则表达式字符串表示，按照字面量形式而非传入构造函数中的字符串模式返回。1.2 RegExp 实例方法\r\n\r\npattern.exec(str)\r\nexec方法是RegExp的主要方法，主要用于提取捕获组(这个后面后讲到)，它接收一个匹配字符串作为参数，如果匹配成功，返回一个包含匹配项信息的数组；在没有匹配到的时候返回null。\r\n\r\n返回的数组包含匹配的字符串，同时另外包含两个属性：index 和 input。index表示的是匹配字符串在文本中的起始位置，input表示匹配的字符串。\r\n\r\n在非全局模式匹配下，如果字符串中含有与模式匹配的多个子字符串，那么只会返回第一个匹配项的结果。返回的数组中下标为0的位置表示匹配到的字符串，其余位置表示匹配到的捕获组信息；而在全局模式下(g)，如果依次执行exec方法，依次返回的是每一个匹配项信息的数组。pattern.test(str)\r\ntest方法主要用于检测字符串中是否存在与模式匹配的字符串，常用语条件判断。匹配成功返回true，否则返回false。1.3 RegExp 构造函数属性\r\n\r\n构造函数静态属性，分别有一个长属性名和一个短属性名(Opera是例外，不支持短属性名)。1.4 用于模式匹配的String方法\r\n\r\nstr.search(pattern)\r\n它的参数是一个正则表达式，返回第一个与之匹配的子串的起始位置，如果找不到匹配的子串，它将返回-1。注：如果search()的参数不是正则表达式，则首先会通过RegExp构造方法将它转换成正则表达式，search()方法不支持全局检索，因为它忽略正则表达式参数中的修饰符g\r\n\r\nstr.replace(subStr | pattern, replaceStr | function)\r\n第一个参数是正则表达式或者是字符串，第二个参数是要替换的字符串。如果第一个参数是正则表达式，直接进行模式匹配，若为字符串，则会检索整个字符串进行替换，而不会转化为正则表达式。', '2017-05-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1032', 'Mark', '说说 Hibernate 的映射策略', '1 基本属性映射\r\n\r\n持久化类属性的 JPA 规则是：\r\n\r\n持久化类的属性如果是基本类型或者基本类型的包装器，诸如 String, BigInteger, BigDecimal, java.util.Date, java.util.Calendar, java.sql.Date, java.sql.Time, java.sql.Timestamp, byte[], Byte[], char[], Character[]，它们会被自动持久化。\r\n如果一个类加了 @Embeddable 注解，表明这个类是属于其他某个类的一部分，它是内嵌的类，我们以后会说到。\r\n如果属性类型是java.io.Serializable，那么它的值会被存储为序列化后的格式。\r\n如果以上条件都不成立，那么 Hibernate 会在启动时抛出异常。1.1 覆盖基本属性的默认值\r\n\r\n如果某个属性不需要被持久化，可以加上 @javax.persistence.Transient 注解或者使用 Java 的 transient 关键字。\r\n\r\n默认情况下，所有的可持久化属性都是可为 null ，既是可选的。因此可以使用 @Basic 注解把某个属性改为必填。这样配置以后，hibernate 会在生成 SQL schema 时，把这个属性设置为非 null。如果在插入或者更新时，这个属性是 null，那么 Hibernate 就会抛出异常。大多数工程师们更喜欢用 @Column 注解来声明非 null。也就是说@Basic、@Column以及之前所说的 Bean Validation 的 @NotNull，它们的功能都一样，配置其中一个后，Hibernate 会对这个属性进行非 null 验证。建议使用 Bean Validation 的 @NotNull，因为这样就能够在表现层手动验证一个 Item 实例。@Column 还有一些属性设定，比如可以设定 catalog、schema 的名字，但是它们在实践中很少会被用到。\r\n\r\n1.2 自定义存取属性的方式\r\n\r\n可以选择是通过字段来直接存取，还是通过 getter/setter 方法来间接存取。 \r\nHibernate 是依据持久化类的 @Id 注解来判断到底是采取哪种方式的。比如 @Id 放在某个属性上，那么所有的属性都会是通过字段来直接存取的。\r\n\r\nJPA 规范中还提供了 @Access 注解，它有两个值，AccessType.FIELD（通过字段来直接存取） 和 AccessType.PROPERTY（通过 getter/setter 方法来间接存取）。可以把这个注解放在类上，这样就会应用于所有的属性，也可以放在某个类属性上，对它进行精细控制。Hibernate 还有一个特性可以会很少用到，这里提一提。noop 级别的存取器。假设数据库表有一个 VALIDATED 字段，表示有效时间，但是没有把它放在领域类模型中（这种情况应该很少发生吧 O(∩_∩)O~）。为了能够对这个字段进行 SQL 查询，必须把它放在 hbm.xml 的 metadata 文件中。做了这样的映射以后，就能够在查询中使用 validated 咯。注意之前说过，如果使用了 Hibernate 的 hbm.xml 的 metadata 文件进行配置，那么所有在 Item 类上的持久化注解就都失效咯。\r\n\r\n如果以上的映射还不能满足要求，那么可以直接自定义一个属性存取器！只要实现一个 org.hibernate.property.PropertyAccessor 接口，然后配置到下面这个注解中。', '2017-03-28', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1033', 'John', '无监督学习之RBM和AutoEncoder', '有标签的数据固然好，可是一方面打标签的代价太高，另一方面大部分数据是无标签的。这样就涉及到无监督、半监督、Self-taught学习的问题。本文将介绍两种适用于无标签数据的学习方法，可以找到数据中的隐含模式，包括RBM和AutoEncoder。几种学习方式\r\n\r\n以识别猫狗图像为例，区分以下几种学习方式。\r\n\r\n监督学习：有标签的猫狗数据。\r\n无监督学习：无标签的猫狗数据。\r\n半监督学习：部分有标签的猫狗数据。\r\nTransfer Learning：有标签的猫狗数据、有标签的大象老虎的数据。\r\nSelf-taught Learning：有标签的猫狗数据、无标签的大象老虎美女的数据。\r\n半监督学习\r\n\r\n有时候，考虑无标签的数据分布，我们可能可以把分类器做得更好。Transfer Learning\r\n\r\nTransfer Learning，本质上是希望通过与目标对象不那么相关的数据（例如利用大象老虎的图片去分类猫狗的图片）发现潜在的共性特征，利用潜在的共性特征去分类识别。\r\n\r\n在图像识别中，经常使用Transfer Learning的方法。其思路是：先利用CNN训练一大堆数据，CNN的隐含层相当于特征提取层。用于新的数据时，保持原来的网络结构的前面部分不变，相当于构建了隐含特征，通过调整后面部分的网络参数实现对新数据的识别。\r\n\r\n在日常生活中，也有Transfer Learning的例子。有本叫《爆漫王》的漫画，讲的是一位少年努力成为漫画家的故事。其实漫画家和研究生蛮像的，责编-导师、画分镜-跑实验、投稿jump-投稿期刊。不过，人家的漫画家比咱研究生努力多了，生病住院的时候还在画分镜，研究生很少有住院拿键盘code的吧。\r\n\r\nSelf-talk Learning\r\n\r\nSelf-talk Learning与Transfer Learning很像，都有除了猫狗以外的大象老虎的数据。不同之处是：Transfer Learning的大象老虎数据是有标签的，Self-talk Learning的大象老虎数据是无标签的。\r\n\r\nSelf-talk Learning的例子如下：\r\n\r\n识别数字0-9，有a-z的无标签的字符数据\r\n新闻文本分类，有网络上爬的各种文本\r\n汉语识别，有网络上英语、西班牙语的语料数据\r\n乍看之下，Self-talk Learning很难，从不相关的无标签数据中可以获得什么呢？仔细思考下，以图像为例，像素空间的向量分布是很稀疏的，实际空间的维度并不需要这么高。不论是0-9还是a-z都是由不同的笔触组成的，如果可以通过无监督的a-z学习到笔触的表现形式，那么对于0-9的数据，先转化成笔触再进行识别便有可能取得较高的识别精度。Restricted Boltzmann Machine\r\n\r\n受限玻尔兹曼机，在原玻尔兹曼机的集合S={s1,...sK}基础上，增加了新的隐含集合H={h1,...hK}。其本质也是factor graph，factor存在于所有的node上，同时原来玻尔兹曼机中两两相连的node对{si,sj}取消了，换成了node对{si,hj}。', '2017-04-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1034', 'Bob', '从未如此惊艳！你好，SuperTextView', '欢迎使用SuperTextView，这篇文档将会向你展示如何使用这个控件来提高你构建项目的效率。SuperTextView继承自TextView，它能够大量的减少布局的复杂程度，并且使得一些常见的效果变得十分容易实现且高效。同时，它内置了动画驱动，你只需要合理编写Adjuster，然后startAnim()就可以看到预期的动画效果。它仅仅是一个控件，所以你可以不费吹灰之力的在你的项目中集成使用。特点\r\n\r\n你从此不必再为背景图编写和管理大量文件了。\r\n重新优化的状态图功能使得你能够精确的控制状态图的大小，以及在SuperTextView中的位置。\r\n支持设置圆角，并且能够精确的控制圆角位置。\r\n能够轻松的实现控件边框效果。\r\n支持文字描边，这使得空心文字效果成为了可能。\r\n内置动画驱动，你只需配合Adjuster合理的使用即可。\r\nAdjuster的出现，使得你对控件的绘制过程具有了掌控权，良好的设计使得它能够完美的实现绝大部分你脑海中的效果。\r\n使用指南\r\n\r\n支持的属性\r\n\r\nSuperTextView十分方便的支持在xml中直接设置属性，并且你能够立即看到效果。就像你平时使用TextView一样方便。不同于原生的Drawable，SuperTextView对于Drawable提供了更多精细化的控制操作。你能够轻松的指定Drawable大小以及位置，只需一个属性就能搞定。\r\n\r\n相信你一定深有感触，想要实现上图中的效果，往往需要嵌套多层布局(一般3层吧？)。而SuperTextView只需一个控件，并且十分简单高效的就能实现。它能够大量的减少你的App中的布局复杂程度，减少视图树的绘制时间。炸裂的Adjuster\r\n\r\nAdjuster被设计用来在SuperTextView的绘制过程中插入一些操作。这具有非常重要的意义。比如，默认实现的DefaultAdjuster能够动态的调整文字的大小。当然，你可以用它来实现各种各样的效果。\r\n\r\n想要Adjuster生效，你必须调用SuperTextView.setAutoAdjust(true)来启用Adjuster功能。当然，你可以所以方便的停止，通过调用SuperTextView.setAutoAdjust(false)。并且，你需要注意调用顺序，因为一旦调用了SuperTextView.setAutoAdjust(true)，而Adjuster没有被设置的话，将会启用默认的DefaultAdjuster(它能够动态的调整文字大小)，直到你设置了你自己的Adjuster\r\n\r\n干预控件的绘制\r\n\r\n实现一个Adjuster需要继承SuperTextView.Adjuster，并且实现adjust(SuperTextView v, Canvas canvas)方法。Adjuster.adjust()会在每次绘制过程中被调用，这意味着你能够不可思议的从外部干预控件的绘制过程。注意，如果开启动画，你必须十分谨慎的编写adjuster()中的代码。因为动画会以60帧/每秒的速度进行绘制。这意味着，这个方法每秒会被调用60次！所以，千万不要在这个方法中重复的创建对象，会卡爆的！原因是短时间的大量将会引起【内存抖动】，导致GC频繁发生。相关知识你可以看看我的这两篇文章： \r\n- 【Android内存基础——内存抖动http://www.jianshu.com/p/69e6f894c698】 \r\n- 【用两张图告诉你，为什么你的App会卡顿?http://www.jianshu.com/p/df4d5ec779c8】\r\n\r\n响应触摸事件\r\n\r\n如果你重载Adjuster的onTouch(SuperTextView v, MotionEvent event)方法，你将能够获得SuperTextView的触摸事件。这是重要的一点，如果你想持续的对SuperTextView的触摸事件进行处理，你必须使onTouch()返回true。否则你只能接收到一个ACTION_DOWN事件，而不是一个事件流。', '2017-04-19', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1035', 'Leo', 'MapReduce实现两表的Join--原理及python和java代码实现', '1. 概述\r\n在传统数据库（如：MYSQL）中，JOIN操作是非常常见且非常耗时的。而在HADOOP中进行JOIN操作，同样常见且耗时，由于Hadoop的独特设计思想，当进行JOIN操作时，有一些特殊的技巧。\r\n本文首先介绍了Hadoop上通常的JOIN实现方法，然后给出了几种针对不同输入数据集的优化方法。\r\n2. 常见的join方法介绍\r\n假设要进行join的数据分别来自File1和File2.\r\n2.1 reduce side join\r\nreduce side join是一种最简单的join方式，其主要思想如下：\r\n在map阶段，map函数同时读取两个文件File1和File2，为了区分两种来源的key/value数据对，对每条数据打一个标签（tag）,比如：tag=0表示来自文件File1，tag=2表示来自文件File2。即：map阶段的主要任务是对不同文件中的数据打标签。\r\n在reduce阶段，reduce函数获取key相同的来自File1和File2文件的value list， 然后对于同一个key，对File1和File2中的数据进行join（笛卡尔乘积）。即：reduce阶段进行实际的连接操作。\r\n2.2 map side join\r\n之所以存在reduce side join，是因为在map阶段不能获取所有需要的join字段，即：同一个key对应的字段可能位于不同map中。Reduce side join是非常低效的，因为shuffle阶段要进行大量的数据传输。\r\nMap side join是针对以下场景进行的优化：两个待连接表中，有一个表非常大，而另一个表非常小，以至于小表可以直接存放到内存中。这样，我们可以将小表复制多份，让每个map task内存中存在一份（比如存放到hash table中），然后只扫描大表：对于大表中的每一条记录key/value，在hash table中查找是否有相同的key的记录，如果有，则连接后输出即可。\r\n为了支持文件的复制，Hadoop提供了一个类DistributedCache，使用该类的方法如下：\r\n（1）用户使用静态方法DistributedCache.addCacheFile()指定要复制的文件，它的参数是文件的URI（如果是HDFS上的文件，可以这样：hdfs://namenode:9000/home/XXX/file，其中9000是自己配置的NameNode端口号）。JobTracker在作业启动之前会获取这个URI列表，并将相应的文件拷贝到各个TaskTracker的本地磁盘上。（2）用户使用DistributedCache.getLocalCacheFiles()方法获取文件目录，并使用标准的文件读写API读取相应的文件。2.3 SemiJoin\r\nSemiJoin，也叫半连接，是从分布式数据库中借鉴过来的方法。它的产生动机是：对于reduce side join，跨机器的数据传输量非常大，这成了join操作的一个瓶颈，如果能够在map端过滤掉不会参加join操作的数据，则可以大大节省网络IO。\r\n实现方法很简单：选取一个小表，假设是File1，将其参与join的key抽取出来，保存到文件File3中，File3文件一般很小，可以放到内存中。在map阶段，使用DistributedCache将File3复制到各个TaskTracker上，然后将File2中不在File3中的key对应的记录过滤掉，剩下的reduce阶段的工作与reduce side join相同。\r\n更多关于半连接的介绍，可参考：半连接介绍：http://wenku.baidu.com/view/ae7442db7f1922791688e877.html。', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1036', 'Coco', '如何在Linux VPS中保护MySQL与MariaDB数据库安全', '内容介绍\r\n\r\nLinux与Unix类系统之上存在着大量SQL数据库语言实现方案。MySQL与MariaDB正是其中最为流行的两种选项。\r\n\r\n然而，与大多数软件一样，这些工具如果未经正确配置也可能面临安全风险。在本教程中，我们将了解如何利用一系列基本步骤保证其安全。\r\n\r\n为了内容的简单与直观，我们将在Ubuntu 12.04 VS实例上使用MySQL服务器。不过这些技术也适用于其它Linux发行版以及MaraDB。\r\n\r\n初始设置\r\n\r\nMySQL在安装过程中即提升第一套安全保护手段，即要求设置root密码。大家可以随后再设置root密码，不过这里我们直接设定。\r\n\r\n安装完成之后，我们需要运行几套脚本。首先，我们使用“mysql_install_db”脚本以为我们的数据库创建一套目录布局。\r\n\r\nsudo mysql_install_db\r\n接下来，运行“mysql_secure_installation”脚本。我们可以按照提示一步步移除各默认选项以消除其可能给生产环境带来的安全风险。\r\n\r\nsudo mysql_secure_installation\r\n在这里我们需要输入在安装中所设定的root密码。接下来，我们需要回答几个问题，首先是是否需要变更该root密码。\r\n\r\n在这里我们就不另行设置了。\r\n\r\n对于其它问题，大家一路按下“Y”（yes）即可。\r\n\r\n如此一来，任何人在默认情况下都无法登录至MySQL，管理员账户远程登录机制被禁用、部分不安全的测试数据库被移除，同时对当前运行的MySQL实例更新以应用上述变更。安全注意事项\r\n\r\n要保护MySQL及其它各类系统的安全，最重要的就是只在必要时提供访问权限。具体来讲，数据安全也可以归结为便利与安全间的权衡。\r\n\r\n在本教程中，我们将尽可能偏向安全方面。\r\n\r\n通过My.cnf文件实现安全保护\r\n\r\nMySQL的主配置文件为“my.cnf”，其在Ubuntu上位于“/etc/mysql/”目录当中，在其它VPS中则位于“/etc/”目录。\r\n\r\n我们变更此文件中的部分设置以锁定MySQL实例。\r\n\r\n以root权限打开该文件，如果大家所使用的系统与本教程不同，可利用以下命令变更其路径：\r\n\r\nsudo nano /etc/mysql/my.cnf\r\n这里首先检查“bind-address”设定，其位于“[mysqld]”部分内。此设定应当被设置为本地闭环网络设备，即“127.0.0.1”。\r\n\r\nbind-address = 127.0.0.1\r\n这能够确保MySQL不接收任何本地设备之外的连接。\r\n\r\n如果大家需要通过其它设备访问此数据库，可以考虑通过SSH接入以进行数据库查询、本地管理并通过SSH隧道发送结果。\r\n\r\n接下来我们要修复的问题是允许在MySQL内部访问底层文件系统。这可能引发安全问题，因此应当在非必要时加以关闭。\r\n\r\n在该文件的同一部分内，添加以下指令以禁用加载本地文件的能力:\r\n\r\nlocal-infile=0\r\n如果大家拥有充足的存储空间且数据库本身规模不大，则可以记录更多信息以检测异常活动。\r\n\r\n过于频繁的记录可能造成性能影响，因此大家需要对此做出权衡。实现应用指定用户\r\n\r\n与在Linux中利用隔离用户运行进程的作法一样，MySQL也能够利用类似的隔离机制实现保护。\r\n\r\n使用MySQL的每款应用都应当拥有自己的用户，且其只具备满足自身运行需要的必要数据库访问权限。\r\n\r\n在配置新应用以使用MySQL时，我们应当根据其需求进行数据库创建。', '2017-05-01', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1037', 'Jenny', '.NET程序在Linux容器中的演变', '现在，.NET开发人员可以无障碍地使用如Docker这样的Linux容器，那么让我们来尝试如何以正确的方式配置一个容器。\r\n\r\n可能，文章的标题改成“Linux容器开发人员的演变”会更好。由于.NET可在Linux（以及Windows和macOS）上运行，所以整个世界的Linux容器和微服务已经开放给了.NET开发人员。\r\n\r\n有着大量的开发人员，长期的运行记录和优异性能指标的.NET，现在给以Windows为中心的开发人员提供了一个使用Linux容器的机会。\r\n\r\n虽然在Linux容器中尝试运行.NET代码是诱人的，同时也会产生一些细微差别，但是这样做是不会错的。你可以很容易地将一些.NET代码推送到镜像中。\r\n\r\n毕竟，一切都发生的这么快，一定都很好。 对不对？\r\n\r\n事实并非如此。让.NET代码运行在Linux容器中并不是一件简单的事情，但请记住：“先让它工作，然后让它工作得很快。”\r\n\r\n在下面的例子中，上文说的“很快”指的是构建镜像所需的时间，启动镜像所需的时间和镜像内部代码的性能。本文将首先讨论镜像的构建时间和启动时间，接着会将一个简单的.NET程序运行在基于容器的应用上，然后观察镜像大小的变化，最终缩短镜像的构建和加载时间。此外，代码优化是本文的另一个主题。数字\r\n\r\n第一次构建镜像，一共耗时95秒。其中，下载红帽企业Linux（简称RHEL）镜像与安装.NET SDK，这些文件一共490MB。最终，镜像大小为659MB。\r\n\r\n一般而言，镜像的后续构建将更快，因为Docker化的镜像已经在主机上可用。改变源码后，我们再次运行构建。这一次构建镜像，大约耗时50秒，得到了相同大小的镜像，也是659MB。\r\n\r\n镜像的大小很重要。因为镜像使用操作系统的存储空间，虽然空间便宜，但它仍然是有限的商品。当定期使用容器时，我们很容易忽略过时的镜像，然而它仍然在占用磁盘。如果你不注意的话，磁盘空间将很快用尽。\r\n\r\n如何使镜像尽可能的小？\r\n\r\n移除镜像不需要的部分\r\n\r\n使用命令dotnet restore --no-cache可以消除任何缓存，这样镜像的大小下降到608.6MB，减少了50.6 MB，同比缩小超过7％。\r\n\r\n在构建镜像之前构建应用\r\n\r\n应用是在容器中运行镜像时构建.NET程序的。这耗时大约1.6秒——虽然时间不长，但却是在浪费时间。\r\n\r\n在恢复之前插入的dotnet build命令，并在构建镜像之前构建应用，这样的话容器将会更快地启动。这个结果可在Dockerfile.attempt3中实现。\r\n\r\n与此同时，镜像大小却增加到610.2MB，而我们还得运行dotnet build，虽然现在花这个时间，但却可在每次启动容器时受益。\r\n\r\n运行Dotnet Publish命令\r\n\r\n因为容器是一个运行时环境，那我们为什么不使用dotnet publish命令发布代码，然后把代码放入镜像呢？如果这样做的话，我们就没必要在镜像中安装.NET程序了。毕竟，我们需要的是一个可在任何地方独立运行的应用。\r\n\r\n使用dotnet发布代码，会减少镜像大小和缩短容器启动时间。更改project.json文件，注释掉下图中红框的内容，这告诉编译器此文件为一个平台构建。', '2017-04-23', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1038', 'Max', 'Dubbo入门---搭建一个最简单的Demo框架', 'Dubbo背景和简介\r\n\r\nDubbo开始于电商系统，因此在这里先从电商系统的演变讲起。\r\n\r\n单一应用框架(ORM) \r\n当网站流量很小时，只需一个应用，将所有功能如下单支付等都部署在一起，以减少部署节点和成本。 \r\n缺点：单一的系统架构，使得在开发过程中，占用的资源越来越多，而且随着流量的增加越来越难以维护。垂直应用框架(MVC) \r\n垂直应用架构解决了单一应用架构所面临的扩容问题，流量能够分散到各个子系统当中，且系统的体积可控，一定程度上降低了开发人员之间协同以及维护的成本，提升了开发效率。 \r\n缺点：但是在垂直架构中相同逻辑代码需要不断的复制，不能复用。分布式应用架构(RPC) \r\n当垂直应用越来越多，应用之间交互不可避免，将核心业务抽取出来，作为独立的服务，逐渐形成稳定的服务中心。流动计算架构(SOA) \r\n随着服务化的进一步发展，服务越来越多，服务之间的调用和依赖关系也越来越复杂，诞生了面向服务的架构体系(SOA)，也因此衍生出了一系列相应的技术，如对服务提供、服务调用、连接处理、通信协议、序列化方式、服务发现、服务路由、日志输出等行为进行封装的服务框架。单一应用架构\r\n\r\n当网站流量很小时，只需一个应用，将所有功能都部署在一起，以减少部署节点和成本。\r\n此时，用于简化增删改查工作量的 数据访问框架(ORM) 是关键。\r\n垂直应用架构\r\n\r\n当访问量逐渐增大，单一应用增加机器带来的加速度越来越小，将应用拆成互不相干的几个应用，以提升效率。\r\n此时，用于加速前端页面开发的 Web框架(MVC) 是关键。\r\n分布式服务架构 \r\n当垂直应用越来越多，应用之间交互不可避免，将核心业务抽取出来，作为独立的服务，逐渐形成稳定的服务中心，使前端应用能更快速的响应多变的市场需求。\r\n此时，用于提高业务复用及整合的 分布式服务框架(RPC) 是关键。\r\n流动计算架构 \r\n当服务越来越多，容量的评估，小服务资源的浪费等问题逐渐显现，此时需增加一个调度中心基于访问压力实时管理集群容量，提高集群利用率。\r\n此时，用于提高机器利用率的 资源调度和治理中心(SOA) 是关键。在这里插播一条关于RPC的简介： \r\nRPC(Remote Procedure Call Protocol)：远程过程调用： \r\n两台服务器A、B，分别部署不同的应用a,b。当A服务器想要调用B服务器上应用b提供的函数或方法的时候，由于不在一个内存空间，不能直接调用，需要通过网络来表达调用的语义传达调用的数据。 \r\n说白了，就是你在你的机器上写了一个程序，我这边是无法直接调用的，这个时候就出现了一个远程服务调用的概念。\r\n\r\nRPC是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。RPC协议假定某些传输协议的存在，如TCP或UDP，为通信程序之间携带信息数据。在OSI网络通信模型中，RPC跨越了传输层和应用层。RPC使得开发包括网络分布式多程序在内的应用程序更加容易。 \r\nRPC采用客户机/服务器模式。请求程序就是一个客户机，而服务提供程序就是一个服务器。首先，客户机调用进程发送一个有进程参数的调用信息到服务进程，然后等待应答信息。在服务器端，进程保持睡眠状态直到调用信息到达为止。当一个调用信息到达，服务器获得进程参数，计算结果，发送答复信息，然后等待下一个调用信息，最后，客户端调用进程接收答复信息，获得进程结果，然后调用执行继续进行。', '2017-03-28', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1039', 'Kenny', 'opencv之SURF图像匹配', '1.概述\r\n\r\n前面介绍模板匹配的时候已经提到模板匹配时一种基于灰度的匹配方法，而基于特征的匹配方法有FAST、SIFT、SURF等，上面两篇文章已经介绍过使用Surf算法进行特征点检测以及使用暴力匹配(BruteForceMatcher)和最近邻匹配(FLANN)两种匹配方法。接下来将更深一步介绍利用Surf检测到的特征点以及匹配对进行图像匹配. \r\n利用Surf算法进行图像匹配其一般流程为：检测物体特征点->计算特征点描述子->使用BurteForceMatcher或FLANN进行特征点匹配->匹配到的特征点进行透视变换findHomography()->透视矩阵变换perspectiveTransform()->绘制匹配物体轮廓。2. OpenCV API\r\n\r\n透视变换 \r\nfindHomography() \r\n这个函数的作用是在图像原平面和目标图像平面之间寻找并返回一个透视变换矩阵H。所以反向投影误差最小化。如果参数metchod被设置为默认值0，改函数使用所有的点以简单的最小二乘法计算一个初始的单应估计。可以简单理解为透视变换矩阵就是把一幅图像从一个空间变换到另一个空间所需要进行旋转平移而进行加权的矩阵。 \r\n但是并不是所有的点匹配对(srcPoints_i, dstPoints_i)都适合使用刚性的透视变换(有些异常值)，这样变换得到的透视矩阵误差较大。在这种情况下可以使用两种鲁棒的方法RANSAC和LMeDS，尝试使用很多对应匹配点的随机子集，使用该子集和最简单的最小二乘法估计单应性矩阵，然后计算得到的透视变换矩阵的质量/好坏(quality/goodness),然后使用最佳子集来计算单应性矩阵的初始估计矩阵和内在值/异常值(inliers/outliers)的掩码。 \r\n不管方法是否具有鲁棒性，使用Levenberg-Marquardt方法进一步精确计算单应性矩阵(如果方法具有鲁棒性仅使用内在值(inline))来减少再投影误差。 \r\nRANSAC几乎可以处理任意比例的异常值，但是它需要一个阈值来区分内在值还是异常值。LMeDS不需要任何阈值，但是只有在内在值比例大于50%的情况下才能准确计算。如果没有太多异常值，噪声有比较小的情况下使用默认方法即可 \r\n函数用来查找初始的内在和外在矩阵，透视变换矩阵确定了一个比例.无论何时如果不能估计H矩阵则函数将返回一个空矩阵。srcPoints:原平面对应点，可以是CV_32FC2或vector类型的矩阵。 \r\ndstPoints:目标平面对应点，可以是CV_32FC2或vector类型的矩阵 \r\nmethod:用于计算矩阵的方法，可选方法上面已经介绍过有默认值0，CV_RANSAC和CV_LMEDS \r\nransacReprojThreshold:有默认值3，区分内在值还是异常值的阈值点，只在RANSAC方法有用，当||dstPoints-convertPointsHomogeneous(H*srcPoints)||>ransacReprojThreshold，这个点就会被认为是异常值(outlier).如果srcPoints和dstPoints是以像素为单位，则参数的取值范围一般在1-10之间。 \r\nmask:可选参数，有默认值noArray()，通过鲁棒性方法(RANSAC或LMEDS)设置输出掩码。', '2017-04-25', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1040', 'Aaron', 'http协议详解', '虽然这是我们经常挂在嘴边的东西，但是很多人并不了解http协议内在的工作原理是怎样的，下面介绍一下http的结构内容与工作原理。\r\n1.Http协议简介\r\nHypertext Transfer Protocol超文本传输协议，用于客户端与服务器端的信息传输。客户端向服务器端发出请求，服务器端对客户端做出响应。目前在用的是http 1.0的第6版，http 1.1规范化工作正在进行之中，http-NG（next general of http）的建议也已经提出。\r\n2.URI与URL\r\nURI：uniform Resource Identifiers 统一资源标识符。用来唯一的标识一个资源。URI一般由三部组成：\r\n①访问资源的命名机制\r\n②存放资源的主机名\r\n③资源自身的名称，由路径表示，着重强调于资源。\r\n参考下面的URI， 协议名称://域名.根域名/目录/文件名.后缀。比如：   http://b.c/d/e.f 。这是一个可通过HTTP协议访问的资源，位于主机b.c上，通过URI中的字符串“/d”访问主机上的“d”文件夹，通过“e.f”请求访问主机上“/d/e.f”这个文件。\r\nURL：uniform Resource Locator 统一资源定位符，是一种特殊的URI。一个完整的URL包含以下几个部分:协议部分，域名部分，端口部分，虚拟目录部分，文件名部分、参数部分，锚部分。以下面这个URL为例，介绍下普通URL的各部分组成：\r\nhttp://www.aspxfans.com:8080/news/index.asp?boardID=5&ID=24618&page=1#name\r\n\r\n1.协议部分：该URL的协议部分为“http：”，这代表网页使用的是HTTP协议。在Internet中可以使用多种协议，如HTTP，FTP等等本例中使用的是HTTP协议。在\"HTTP\"后面的“//”为分隔符\r\n\r\n2.域名部分：该URL的域名部分为“www.aspxfans.com”。一个URL中，也可以使用IP地址作为域名使用\r\n\r\n3.端口部分：跟在域名后面的是端口，域名和端口之间使用“:”作为分隔符。端口不是一个URL必须的部分，如果省略端口部分，将采用默认端口\r\n\r\n4.虚拟目录部分：从域名后的第一个“/”开始到最后一个“/”为止，是虚拟目录部分。虚拟目录也不是一个URL必须的部分。本例中的虚拟目录是“/news/”\r\n\r\n5.文件名部分：从域名后的最后一个“/”开始到“？”为止，是文件名部分，如果没有“?”,则是从域名后的最后一个“/”开始到“#”为止，是文件部分，如果没有“？”和“#”，那么从域名后的最后一个“/”开始到结束，都是文件名部分。本例中的文件名是“index.asp”。文件名部分也不是一个URL必须的部分，如果省略该部分，则使用默认的文件名\r\n\r\n6.锚部分：从“#”开始到最后，都是锚部分。本例中的锚部分是“name”。锚部分也不是一个URL必须的部分\r\n\r\n7.参数部分：从“？”开始到“#”为止之间的部分为参数部分，又称搜索部分、查询部分。本例中的参数部分为“boardID=5&ID=24618&page=1”。参数可以允许有多个参数，参数与参数之间用“&”作为分隔符。3.HTTP请求——Request\r\n请求行（request line）：请求方法+空格+URL+空格+协议版本+回车符+换行符\r\n请求头部（header）：头部字段名+冒号“：”+值+回车符+换行符\r\n头部字段名+冒号“：”+值+回车符+换行符\r\n……\r\n头部字段名+冒号“：”+值+回车符+换行符\r\n空行：回车符+换行符。', '2017-05-04', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1041', 'Peter', '进程与进程描述符（task_struct）', '进程（Process） \r\n计算机中的程序关于某数据集合上的一次运行活动，是系统进行资源分配和调度的基本单位，是操作系统结构的基础。在早期面向进程设计的计算机结构中，进程是程序的基本执行实体；在当代面向线程设计的计算机结构中，进程是线程的容器。程序是指令、数据及其组织形式的描述，进程是程序的实体。释义：一段程序的执行过程\r\n特征：动态、独立、异步、并发\r\n结构特征：程序、数据和进程控制块\r\n相关概念：线程，管程          狭义定义：进程是正在运行的程序的实例（an instance of a computer program that is being executed）。\r\n\r\n广义定义： \r\n进程是一个具有一定独立功能的程序关于某个数据集合的一次运行活动。 \r\n它是是操作系统动态执行的基本单元，在传统的操作系统中，进程既是基本的分配单元，也是基本的执行单元。特征\r\n\r\n动态性：进程的实质是程序在多道程序系统中的一次执行过程，进程是动态产生，动态消亡的。\r\n\r\n并发性：任何进程都可以同其他进程一起并发执行\r\n\r\n独立性：进程是一个能独立运行的基本单位，同时也是系统分配资源和调度的独立单位；\r\n\r\n异步性：由于进程间的相互制约，使进程具有执行的间断性，即进程按各自独立的、不可预知的速度向前推进\r\n\r\n结构特征：进程由程序、数据和进程控制块三部分组成。 \r\n多个不同的进程可以包含相同的程序：一个程序在不同的数据集里就构成不同的进程，能得到不同的结果；但是执行过程中，程序不能发生改变。\r\n\r\n内容\r\n\r\n一个计算机系统进程包括（或者说“拥有”）下列数据： \r\n那个程序的可运行机器码的一个在存储器的映像。 分配到的存储器（通常包括虚拟内存的一个区域）。存储器的内容包括可运行代码、特定于进程的数据（输入、输出）、调用堆栈、堆栈（用于保存运行时运数中途产生的数据）。 分配给该进程的资源的操作系统描述符，诸如文件描述符（Unix术语）或文件句柄（Windows）、数据源和数据终端。 安全特性，诸如进程拥有者和进程的权限集（可以容许的操作）。 处理器状态（内文），诸如寄存器内容、物理存储器寻址等。当进程正在运行时，状态通常储存在寄存器，其他情况在存储器。切换\r\n\r\n进行进程切换就是从正在运行的进程中收回处理器，然后再使待运行进程来占用处理器。 \r\n这里所说的从某个进程收回处理器，实质上就是把进程存放在处理器的寄存器中的中间数据找个地方存起来，从而把处理器的寄存器腾出来让其他进程使用。那么被中止运行进程的中间数据存在何处好呢？当然这个地方应该是进程的私有堆栈。 \r\n让进程来占用处理器，实质上是把某个进程存放在私有堆栈中寄存器的数据（前一次本进程被中止时的中间数据）再恢复到处理器的寄存器中去，并把待运行进程的断点送入处理器的程序指针PC，于是待运行进程就开始被处理器运行了，也就是这个进程已经占有处理器的使用权了。 \r\n这就像多个同学要分时使用同一张课桌一样，所谓要收回正在使用课桌同学的课桌使用权，实质上就是让他把属于他的东西拿走；而赋予某个同学课桌使用权，只不过就是让他把他的东西放到课桌上罢了。 \r\n在切换时，一个进程存储在处理器各寄存器中的中间数据叫做进程的上下文，所以进程的 切换实质上就是被中止运行进程与待运行进程上下文的切换。在进程未占用处理器时，进程 的上下文是存储在进程的私有堆栈中的。', '2017-04-16', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1042', 'Emma', '天弘基金移动App客户端架构优化之路', '随着移动互联网时代的到来，移动技术也随之飞速发展。如今，APP已成为绝大多数互联网企业用来获取用户的核心渠道。与此同时，伴随着业务量的增长，愈来愈多的APP也在不断地挑战着每一个移动端研发人员的知识深度，而移动端技术人员也在这个不断接受挑战的过程中，成就了今天的移动互联网时代。\r\n\r\n天弘基金作为一家在基金，金融行业高速发展的公司，APP面临着多重挑战，如庞大的用户群体、高频的基金业务、交易安全可靠性等等。天弘基金移动端的开发小伙伴在技术和业务的多重压力下，不断推进着天弘·爱理财移动端的架构演进。\r\n\r\n首先介绍下大环境背景，天弘·爱理财在前端后端使用的阿里蚂蚁金融云MPaaS（移动即服务）平台。简单说就是通过这个平台把支付宝App多年的开发经验沉淀下来，帮助生态伙伴进行金融客户端的开发，提高其适应移动互联网生态的产品研发能力，同时也嵌入了移动端的安全、风控能力，并结合支付宝APP的众多应用场景来进行金融业务创新。天弘·爱理财iOS版App早期架构\r\n\r\n在2015年爱理财App iOS的第一个版本诞生，那时候架构很简单，基本上就是在传统的MVC的架构基础上封装了一个网络服务层构建而成的。爱理财App经历从无到有的阶段，为了快速上线抢占市场，其移动端App开发的MVC架构成了“短平快”思路的首选。\r\n\r\n在早期MVC的体系架构中 \r\n- mPaas层主要负责提供一些最低层的功能支持，如数据库，RPC网络请求，分享等等 \r\n- THApiClient层为整个APP网络请求的封装层，提供所有网络请求接口的请求和接受等功能 \r\n- Services层为整个APP业务逻辑封装层，比如 \r\n- 实现账号登陆注册业务的SAAccountService \r\n- 实现爱基金相关业务的SALoveFundService \r\n- 实现银行卡相关业务的SABankCardService \r\n- 实现买入卖出相关业务的SABusinessService \r\n- Controller层为View和Services层之间的一层，起到承上启下作用，提供各个模块的UI和业务实现的连接功能 \r\n- View层为用户展现UI和用户交互UI层\r\n\r\n这种架构随着版本迭代开发出现了越来越多的问题，在开发的后期会由于其超高耦和性，从而造就庞大Controller层，而这也是一直被人所诟病。最终的MVC都从Model-View-Controller走向了Massive-View-Controller的终点，其最严重的结果就是Control层的代码越来越多越来越臃肿难于扩展维护，同时Control层和View层之间存在一些较高的耦合。App 2.0版本架构\r\n\r\n基于上述我们遇到的问题，我们在原来的传统架构上又做了重新调整和优化，提出了iOS端架构V2.0，\r\n\r\n在爱理财V2.4.0版本项目内开始逐步重构采用MVVM+分层架构模式解耦，使越来越臃肿的Controller层逐步缩小并分解解耦，业务逻辑分模块下沉。在原有的Controller层和Service层之间插入了一个ViewModel层(紫色的), 对于此次架构调整优点如下:\r\n\r\nController层只用来做中转层不参与业务逻辑等处理\r\nController层对上(View层)只提供页面展示所需数据,对下调用(ViewModel层)暴露出的业务逻辑接口\r\n方便进行功能,业务逻辑的单元测试\r\nViewModel层实现整个业务逻辑,实现对上层只提供接口因此此层灵活,易维护。', '2017-04-21', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1043', 'Lucy', 'Visual Basic快捷教程——函数与子程序', '函数是结构化程序设计的基础。可以拿现实生活中的“社会分工”这个概念来做类比。假设做包子只需要用到两种原料：一是用来做包子皮的面粉，另外就是用来做包子馅料的猪肉。作为一名专门做包子的厨师，你当然不能自己生产面粉和猪肉，所以你通常会从磨坊直接购买面粉，从肉铺直接购买猪肉。在这两种原料都具备的时候，你的任务仅仅只是负责做包子。更进一步，你还可以假设磨坊只负责把麦子磨成面粉，而不负责种植麦子，种植麦子的工作则有农民专门负责。对于做包子的厨师来说，他把生产面粉和猪肉这两项工作承包给了磨坊和肉铺，所以厨师无需关心到底该如何使用碾磨机也无需关心该如何屠宰生猪。而磨坊又把种植麦子这个工作承包给了农民，所以磨坊工人也就无需关心给麦子施肥或浇水的事情。这就是所谓的“社会分工”。而函数的本质就是为了把程序切分成若干个相对独立的模块各司其职，而各个函数的作用也就是仅仅专门负责自己份内的那份功能。\r\n\r\n我们还可以简单的把函数比喻成一个“黑盒子”。这个黑盒子对外只有两个接口，一个用来接收数据，一个用来输出数据。我们只要把数据送进黑盒子，就能得到计算结果，至于盒子内部究竟是如何工作的，我们都可不必关心。函数就是这样，外部程序所知道的仅限于给函数传入什么数据，以及函数输出什么数据，其他都无关紧要。不同的函数可以接收不同输入，给出不同的输出，当然这跟内部的实际工序有关，即函数所执行的功能各异。这就好比现实生活中的化学反应过程：氢气和氧气可以反应生成水，水也可以分解成氧气和氢气。\r\n化学反应的过程总是伴随着一定物质的输入和新物质的产出，至于什么物质生成什么新物质除了跟输入有关以外，还跟反应进行的条件有关。例如，木炭在氧气中燃烧可以生成二氧化碳，但是在某些条件下也可能产生一氧化碳，如下图所示，这取决于实际反映的条件。函数也是这样，同样的输入，也可以得到不同的结果，这就跟函数内部的实现有关。经过上面的描述读者应该对函数有了一个初步的认识，可以明确函数就是接收输入，并在其内部处理数据，最后再输出结果的一个独立的代码单元。在Visual Basic中，函数是一组以Function开头和End Function结尾的封闭程序代码语句。当函数被调用时，便会开始执行函数体内所定义的程序代码。当执行函数内的程序代码语句时，遇到Exit Function、Return 或 End Function语句，便完成函数的执行。\r\n\r\n注意除了自己定义的（以Function开头，以End Function结尾的）函数以外，Visual Basic中还提供了很多有用的内置函数，例如在字符串中搜索子串的 IndexOf 函数。本文主要讨论自定义的函数。\r\n\r\n出于各司其职的目的，在实际编程中会考虑把那些能够独立实现某种功能的代码片段封装成一个独立的函数。此外，如果这些功能模块的使用比较频繁，那么通过函数调用的形式也可以大大精简代码冗余，从而使代码更为简明，增强其可读性。', '2017-03-29', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1044', 'Sam', 'CPP 学习笔记随笔', '何为C++对象模型？\r\n\r\nC++对象模型可以概括为以下2部分：\r\n\r\n语言中直接支持面向对象程序设计的部分\r\n\r\n对于各种支持的底层实现机制\r\n\r\n语言中直接支持面向对象程序设计的部分，如构造函数、析构函数、虚函数、继承（单继承、多继承、虚继承）、多态等等，这也是组里其他同学之前分享过的内容。第一部分这里我简单过一下，重点在底层实现机制。\r\n\r\n在C语言中，“数据”和“处理数据的操作（函数）”是分开来声明的，也就是说，语言本身并没有支持“数据和函数”之间的关联性。在c++中，通过抽象数据类型（abstract data type，ADT），在类中定义数据和函数，来实现数据和函数直接的绑定。\r\n\r\n概括来说，在C++类中有两种成员数据：static、nonstatic；三种成员函数：static、nonstatic、virtual。基本C++对象模型\r\n\r\n在介绍C++使用的对象模型之前，介绍2种对象模型：简单对象模型（a simple object model）、表格驱动对象模型（a table-driven object model）。所有的成员占用相同的空间（跟成员类型无关），对象只是维护了一个包含成员指针的一个表。表中放的是成员的地址，无论上成员变量还是函数，都是这样处理。对象并没有直接保存成员而是保存了成员的指针。这个模型在简单对象的基础上又添加了一个间接层。将成员分成函数和数据，并且用两个表格保存，然后对象只保存了两个指向表格的指针。这个模型可以保证所有的对象具有相同的大小，比如简单对象模型还与成员的个数相关。其中数据成员表中包含实际数据；函数成员表中包含的实际函数的地址（与数据成员相比，多一次寻址）。这个模型从结合上面2中模型的特点，并对内存存取和空间进行了优化。在此模型中，non static 数据成员被放置到对象内部，static数据成员， static and nonstatic 函数成员均被放到对象之外。对于虚函数的支持则分两步完成：\r\n\r\n每一个class产生一堆指向虚函数的指针，放在表格之中。这个表格称之为虚函数表（virtual table，vtbl）。\r\n\r\n每一个对象被添加了一个指针，指向相关的虚函数表vtbl。通常这个指针被称为vptr。vptr的设定（setting）和重置（resetting）都由每一个class的构造函数，析构函数和拷贝赋值运算符自动完成。\r\n\r\n另外，虚函数表地址的前面设置了一个指向type_info的指针，RTTI（Run Time Type Identification）运行时类型识别是有编译器在编译器生成的特殊类型信息，包括对象继承关系，对象本身的描述，RTTI是为多态而生成的信息，所以只有具有虚函数的对象在会生成。\r\n\r\n这个模型的优点在于它的空间和存取时间的效率；缺点如下：如果应用程序本身未改变，但当所使用的类的non static数据成员添加删除或修改时，需要重新编译。', '2017-05-02', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1045', 'Vivi', ' VR游戏交互开发的一些体验', '本文主要写Unity开发手游过程中VR交互输入控制的一些浅薄的经验\r\n交互方面，头控和视线按钮依然较为主流，可以获得传感器数据来获得输入\r\n除了实体按钮输入之外还可以探索其他交互方式，比如触摸板等，但机制有待成熟。1.头控\r\n通过捕获头部转动可以很方便的实现交互，成本最低，适合一些纯观景或轻度游戏\r\n设计时，要尽量减少头部移动范围，否则用户容易疲惫\r\n2.视线按钮\r\n使用一个醒目的准星或光标来指示视线位置，长时间注视来确认点击\r\n这些按钮一定要是立体的按钮，即在Unity中要设置为World Space渲染\r\n按钮摆放\r\n按钮要足够大，方便选中，间隔也要足够大\r\n按钮的位置也要集中，不能像以前的2D游戏一样按钮全部在屏幕四周，这样用户会非常累。比如暴风VR在播放视频时把返回和暂停按钮放到脚下并紧挨着，很不错\r\n按钮和相机的距离太近容易疲劳，但太远的话如果对焦在UI按钮上会模糊掉其他距离的GameObject，需要根据场景适当调整\r\n按钮动效\r\n注视过程中提供一些反馈，如出现一个桶或圆环，随着注视时间增长，出现一个桶被填满、圆环转一圈等效果\r\n最好提供直接点击的确认方式\r\n3.准星\r\n用户双眼会聚焦在最前面的物体上，因此准星与相机的距离要随着正前方物体到相机的距离来调整\r\n准星不应当被遮挡，但在VR游戏中，不能使用多个相机的方式实现不被遮挡，最好采用shader实现\r\n4.按键\r\n有了按钮之后，则用户点击按钮无需等待，大大提升用户体验\r\n比如GearVR触摸板+按钮辅助，Cardboard的磁铁，以及新版的触摸按钮设计\r\n5.Daydream手柄\r\n现在只能使用另外一个手机安装模拟器应用来模拟手柄，需要两个手机在同一个局域网下面\r\n支持陀螺仪、重力感应、触控输入、按钮\r\n陀螺仪不支持定位，只能检测到角速度\r\n仅提供最基础的API，对于手柄的移动要自己定义动作，可以预见会出现一个较好的动作提取Unity插件产品。总结\r\n交互逻辑与传统游戏差别很大，需要在开发过程中和实践相结合。比如头控和手势，一定要通过不断迭代参数来优化体验。\r\nVR的交互方式在慢慢成熟，根据游戏类型和交互需求选择特定的交互方式非常重要。\r\n接触VR时间不久，只有一些简陋的经验，希望且行且总结，且行且学习。', '2017-04-15', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1046', 'Lily', '微信公众平台开发 —— 微信端分享功能', '初次尝试微信公众号的开发，对于学习方法的探索都是来源于网上的博客、问答，对于参差不齐的信息，自己也是有苦说不出，抽出一点时间写点文章，既是对自己的学习总结，也希望给予同是菜鸟的学渣一点帮助。—— 前言.\r\n   \r\n    背景介绍：\r\n     今天想添加微信分享的功能，如果不进行自定义设计，那么当我们点击分享朋友圈、好友或者QQ好友、空间时，默认的标题就是<title>标签中的信息，而显示的描述信息就是链接，图片多是默认为页面中显示的第一张图片，显然这样的处理是不合理的，所以需要查询开发文档进行编码设计。\r\n   操作步骤：\r\n     一.参考微信公众号开发文档\r\n     1.登录微信公众号，打开 “开发者工具->开发者文档->微信网页开发->微信JS-SDK说明文档”，找到对应的位置，首先要了解官方的需求说明才能进行下一步的开发。2.建议详细参考文档后再考虑代码的编写，提示：下拉上图中的网页最下端，下载官方提供的参考demo。本文的最后我会提供一份稍作修改的仅针对于php的实现代码，可作参考。二.代码实现（PHP）及部分问题引导\r\n      1.我提供的代码就是下图中的几个简单文件，主要来源于微信公众号的开发文档，上面提到过一次。其中，我们操作的分享页面代码只需参考 sharePage.php就好，对于官方的实现可以去阅读其他文件，毕竟我们实现功能只需导入文件，调用所提供类及方法就好。2.在此提供 sharePage.php简单代码，以便参考讲解。其中提出几点需要注意的是：\r\n      (1).需要提供$appid,$secret\r\n     （2）.代码中需要引用微信端提供的js文件<script src=\"http://res.wx.qq.com/open/js/jweixin-1.0.0.js\"></script> ，当然也可以下载其源代码，放于本地链接获取就可以。\r\n     （3）.保证wx.config的信息配置的正确，debug如果为true可以提示操作的过程，测试没有问题后可以改为false,这样才是合理的操作，另外jsApiList中要补全自己需要的功能\r\n     （4）.之前我把分享功能的代码写在wx.config平级中无法实现，之后测试发现应该写在wx.reday(function（）)中，具体的代码模式都应该参考开发文档。对于需要填入的信息，可以从上文中打印出需要的信息，我做注释的那一部分信息，请参考。不过，普遍情况，这样的签名是没有问题的，可作为参考。\r\n    \r\n     4.新发现一种情况，原先一切正常的分享功能，突然变得无法显示分享时的链接、图片等，我将wx.config中的debug设定为true继续报错“errMsg config:invalid signature\"，并非签名证书的问题，我猜测应该是文档中一直提及的token或ticket缓存问题，个人打开之前导入的两个文件发现已经重新写入了值，但是我将其重新改为当初下载下来的文件放入服务器中覆盖，意外的发现可以重新获得正确的分享能力，不知哪一天又会出现问题，也希望好心的大牛告知一下。\r\n    【2016-7-14 补充】\r\n     经测试发现，上文提及分享功能的失败，与token ，ticket存储文件没有多大关系，因为如今无法重现Bug，无语的是，发现当初开发者中心使用的测试号是被赋予了分享权限的，然而自己申请的订阅号，通过查看“接口权限”发现“未获得”分享权限。', '2017-04-12', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1047', 'Lisa', '关于TCP Zero Window Update感知的非常棒的优化', '本文从“然而有一种丢包...”开始步入正题。此前的胡扯可以直接跳过。\r\n这个周末是搬入新家的第二个周末，感觉整个人比在罗湖时状态更加好了。也许这个房子的色调跟我上海的家更像吧...不管怎么说，这是我到深圳以后第一个感到振作的地方，以前曾经好几次都想离开了，但是这个家让我决定可以继续坚持。说实话我并不喜欢深圳，虽然我比较喜欢下雨，但是喜欢的是那种持续不断的雨，而不是亚热带雨林式的十分钟暴雨十分钟烈日那种。我喜欢的城市是那种纵深的，30公里回家路可以看完一本书的那种...本来嘛，今天想好好睡一觉，以往周末都是半夜三点多爬起来总结这一周的收获写写文章，今天五点多才起来，也算是睡足了。没想到两小时不到一气呵成了本文，也是简直了。唉，环境影响心情，环境影响效率，特别是对性情中人...\r\n        我的作文习惯中，都是在写完了一篇文章后在开头添加一段应景的文字，本文也不例外。现在时间2016/07/09 08:25，上述是我添加的。TCP重传概述\r\nTCP使用重传机制来应对丢包，这种丢包一般被认为发生在TCP的端到端之间，其原因大致可以分为线路误码，网络拥塞。\r\n        TCP采用两种机制来进行重传，分别是超时重传和快速重传，其中最根本的是超时重传，至于说快速重传，你可以把它看作是一种优化措施。超时重传是在ACK时钟丢失后的最后一道防线，它是一个外部时钟来弥补ACK时钟的暂时停摆，并试图再次启动ACK时钟。\r\nACK而非NAK小史\r\nTCP在设计之初，并没有采用NAK的机制来显式通知数据发送端哪些数据已经丢失，这是因为一方面在上世纪80年代线路资源是昂贵的，就目前的普遍情形来讲，互联网中占据30%的包都是ACK包，这种情况在那个年代本来就很夸张，再加上NAK通知，那就更不能接受了，另一方面是TCP的ACK机制完全有能力让发送端判断哪些数据包是丢失的。作为一系列的优化措施，Nagle，延迟ACK等算法被发明，这些优化措施中，很多都是相互打架的，造成这种局面的原因在于，吞吐和时延本来就是不相容的，就像时间和空间一样，你必须做出取舍或者权衡。\r\nSACK的出现\r\n随着网络技术的发展，节点的互联拓扑越来越复杂，分层设计是应对复杂的根本之道。相继出现了各种支持分层的域，组织与组织之间也划分为各种自治域或者路由域，这些对于端到端按序协议比如TCP来讲，是一种挑战！\r\n        本来在设计之初，数据的传输只是利用基于统计复用的分组交换技术来代替严格TDM/FDM等电路交换技术从而进一步提高线路利用率，至于说节点之间在动态路由协议的管理下大规模自适应互联则是后来的事，因此端到端协议在这个层面上其实工作地并不好，挑战在于“按序”到达！网络节点的大规模随机互联无法保证其中传输数据的到达时序，然而按照分层模型的原则，端到端传输层协议对网络层拓扑变更的漠然以及网络层本身的无状态无连接之间，又产生一组矛盾。解决之道依然是修改TCP而保持网络层的简洁。增加一个TCP选项，由接收端在ACK中设置，在收到乱序到达的数据时，显式告诉发送端它都收到了哪些数据，由发送端自己来判断这些被收到的乱序数据和已经被确认的按序数据之间的空洞是丢失了还是乱序了，从而做出是立即重传还是继续等待重传定时器超时的决策。超时定时器是一个必不可少的外部时钟\r\n之所以要采用定时器超时重传机制，是因为TCP发送端发出数据后，除了被接收端确认可以明确知道发送成功之外，完全不知道数据发出后发生了什么，因此发送端需要进行判断，数据肯定是丢失了(其实不一定，也可能被网络cache住了，或者说绕远路了)，如果此时能有一个机制告诉发送端数据丢失的原因，那将会帮助发送端做出更好的决策。\r\n比如，数据因为拥塞被路由器丢弃，那么路由器如果能发送一小段数据告诉发送端“线路已经拥塞，请不要再继续发送”，这就是传说中的“源抑制报文”，但是由于这是一种带外控制报文，不一定会被发送端收到或者处理。另一方面，如果数据是由于线路误码被丢弃了，那么要是可以发送一个消息，告诉发送端该情况，发送端就可以立即重传这个被丢失的数据包。只可惜，TCP无法保证中间网络会发送这样的报文，即便它们发了，也不能保证这些报文不会在回来的路上被拦截...困难重重。因此发送端采用了一种自适应的超时机制择机重传没有被确认的数据。这个超时时间基于RTT来计算，这里就不说了，哪里都有。特别要指出的是，TCP的超时重传采用一种退避的方式，也就是说，在第一次重传仍然没有被确认时，会退避一段更长的时间再来进行重传，随着重传次数的增多，数据始终没有被确认的话，这个退避的时间会越来越久，可以多达数分钟。\r\n.....', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1048', 'David', 'JavaFX - 实现管理多个Stage窗口及源码解析', 'JavaFX相比AWT就是和Android一样通过xml文件来定义界面的设计，并且可以通过fxml资源文件结合Java代码来控制界面的变化。摒弃之前写AWT那种什么都在Java代码中定义（窗口大小，颜色，控件等等....）的设计。通过fxml+Java代码控制界面达到界面程序更加人性化（猿性化）。\r\n\r\n     但是JavaFX对于窗口的管理却不是那么地人性化，我目前没有发现官方人性化的解决方案。\r\n     有人就说将所有FXML界面的Controller写到同一个类里面不就好了吗？\r\n     答曰：这样和AWT有多大区别了？我们需要的是每个fxml对应上一个Controller类，这样才能进行更好的、更方便的设计。\r\n     还有人说将所有窗口的大小设计成为统一大小不就好了么，这样就可以通过管理Scene的方式进行操作所有的界面了？\r\n\r\n     Oracle的一位大神写了一个关于多个窗口管理的解决方案（本文也是根据这位大神的博客的教程进行修改），但是这位大神是基于所有的窗口都是同等大小的情况下进行操作Scene的内容切换达到多个窗口同时管理的，一旦需要的界面窗口大小不一的时候就有问题了，大家可以去参考下她的内容。\r\nhttps://blogs.oracle.com/acaicedo/entry/managing_multiple_screens_in_javafx1\r\n\r\nhttps://blogs.oracle.com/acaicedo/entry/managing_multiple_screens_in_javafx\r\n\r\n     如果看了她的文章的人不难发现，她的Stage、Scene对象由始至终都是一个，改变的是Scene里面的容器内容。也就是说：Stage的长宽从加载到程序结束是不会改变的，如果强行将Stage注入到每个View（FXML）的Controller中，在改变Scene里面的内容的时候改变Stage的大小，那么倒不如直接一开始直接将Stage交给控制器进行管理，这也是我今天在博客这里要写的东西。相对来说，Oracle大神创建的是Scene的管理器，而且管理的是Scene里面的内容，按照她的说法呢，就是所有的窗口都是同一个大小的，因为她的Stage从头到尾都是一个，但是JavaFX的Stage一旦显示了就不能进行大小的修改，强行修改会抛出异常。\r\n     但是很多桌面程序是大小不一的，例如：登录框、菜单主界面、提示框等等...因此我将她的内容进行修改，将管理Scene的内容改成管理Stage窗口。这样就可以通过管理不同的Stage达到我们需要的大小不一的窗口的效果。', '2017-03-15', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1049', 'Tom', 'matplotlib绘图基础', 'matplotlib介绍\r\n        matplotlib 是python最著名的绘图库，它提供了一整套和matlab相似的命令API，十分适合交互式地进行制图。而且也可以方便地将它作为绘图控件，嵌入GUI应用程序中。它的文档相当完备，并且Gallery页面 中有上百幅缩略图，打开之后都有源程序。因此如果你需要绘制某种类型的图，只需要在这个页面中浏览/复制/粘贴一下，基本上都能搞定。\r\n        在Linux下比较著名的数据图工具还有gnuplot，这个是免费的，Python有一个包可以调用gnuplot，但是语法比较不习惯，而且画图质量不高。而Matplotlib则比较强：Matlab的语法、python语言、latex的画图质量（还可以使用内嵌的latex引擎绘制的数学公式）。\r\n    可以在Ipython中输入类似\"plt.plot??\"的命令查看pyplot模块的函数是如何对各种绘图对象进行包装的。面向对象方式绘图\r\nmatplotlib实际上是一套面向对象的绘图库，它所绘制的图表中的每个绘图元素，例如线条Line2D、文字Text、刻度等在内存中都有一个对象与之对应。\r\n\r\n为了方便快速绘图matplotlib通过pyplot模块提供了一套和MATLAB类似的绘图API，将众多绘图对象所构成的复杂结构隐藏在这套API内部。我们只需要调用pyplot模块所提供的函数就可以实现快速绘图以及设置图表的各种细节。pyplot模块虽然用法简单，但不适合在较大的应用程序中使用。\r\n获取当前图和轴线\r\n为了将面向对象的绘图库包装成只使用函数的调用接口，pyplot模块的内部保存了当前图表以及当前子图等信息。当前的图表和子图可以使用plt.gcf()和plt.gca()获得，分别表示\"Get Current Figure\"和\"Get Current Axes\"。在pyplot模块中，许多函数都是对当前的Figure或Axes对象进行处理，比如说：    plt.plot()实际上会通过plt.gca()获得当前的Axes对象ax，然后再调用ax.plot()方法实现真正的绘图。\r\n如，用下面的代码先获得axes对象再用ax来操作。matplotlib的pyplot子库提供了和matlab类似的绘图API，方便用户快速绘制2D图表。\r\n1.调用figure创建一个绘图对象，并且使它成为当前的绘图对象。（可选）\r\nplt.figure(figsize=(8,4))\r\n也可以不创建绘图对象直接调用接下来的plot函数直接绘图，matplotlib会为我们自动创建一个绘图对象！！\r\n如果需要同时绘制多幅图表的话，可以是给figure传递一个整数参数指定图标的序号，如果所指定序号的绘图对象已经存在的话，将不创建新的对象，而只是让它成为当前绘图对象。\r\nfigsize参数：指定绘图对象的宽度和高度，单位为英寸；dpi参数指定绘图对象的分辨率，即每英寸多少个像素，缺省值为80。因此本例中所创建的图表窗口的宽度为8*80 = 640像素。\r\n但是用show()出来的工具栏中的保存按钮保存下来的png图像的大小是800*400像素。这是因为保存图表用的函数savefig使用不同的DPI配置，savefig函数也有一个dpi参数，如果不设置的话，将使用matplotlib配置文件中的配置，此配置可以通过如下语句进行查看：>>>matplotlib.rcParams[\"savefig.dpi\"]100。', '2017-05-12', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1050', 'Tonny', '使用深度学习打造智能聊天机器人', '聊天机器人（也可以称为语音助手、聊天助手、对话机器人等）是目前非常热的一个人工智能研发与产品方向。很多大的互联网公司重金投入研发相关技术，并陆续推出了相关产品，比如苹果Siri、微软Cortana与小冰、Google Now、百度的“度秘”、亚马逊的蓝牙音箱Amazon Echo内置的语音助手Alexa、Facebook推出的语音助手M、Siri创始人推出的新型语音助手Viv…….\r\n\r\n\r\n\r\n为何老牌互联网公司和很多创业公司都密集地在聊天机器人领域进行投入？其实根本原因在于大家都将聊天机器人定位为未来各种服务的入口，尤其是移动端APP应用及可穿戴设备场景下提供各种服务的服务入口，这类似于Web端搜索引擎的入口作用。将来很可能通过语音助手绕过目前的很多APP直接提供各种服务，比如查询天气、定航班、订餐、智能家居的设备控制、车载设备的语音控制等等，目前大多采用独立APP形式来提供服务，而将来很多以APP形式存在的应用很可能会消失不见，直接隐身到语音助手背后。作为未来各种应用服务的入口，其市场影响力毫无疑问是巨大的，这是为何这个方向如此火热的根本原因，大家都在为争夺未来服务入口而提前布局与竞争，虽然很多公司并未直接声明这个原因，但其目的是显而易见的。聊天机器人的类型\r\n\r\n\r\n\r\n目前市场上有各种类型的机器人，比如有京东JIMI这种客服机器人，儿童教育机器人，小冰这种娱乐聊天机器人，Aexa这种家居控制机器人、车载控制机器人、Viv这种全方位服务类型机器人等等。这是从应用方向角度来对聊天机器人的一种划分。\r\n\r\n\r\n\r\n如果对其应用目的或者技术手段进行抽象，可以有以下两种划分方法。\r\n\r\n \r\n\r\n目标驱动（Goal –Driven）VS  无目标驱动（Non-Goal Driven）聊天机器人\r\n\r\n\r\n\r\n目标驱动的聊天机器人指的是聊天机器人有明确的服务目标或者服务对象，比如客服机器人，儿童教育机器人、类似Viv的提供天气订票订餐等各种服务的服务机器人等；这种目标驱动的聊天机器人也可以被称作特定领域的聊天机器人。\r\n\r\n\r\n\r\n无目标驱动聊天机器人指的是聊天机器人并非为了特定领域服务目的而开发的，比如纯粹聊天或者出于娱乐聊天目的以及计算机游戏中的虚拟人物的聊天机器人都属于此类。这种无明确任务目标的聊天机器人也可以被称作为开放领域的聊天机器人。检索式 VS 生成式聊天机器人\r\n\r\n检索式聊天机器人指的事先存在一个对话库，聊天系统接收到用户输入句子后，通过在对话库中以搜索匹配的方式进行应答内容提取，很明显这种方式对对话库要求很高，需要对话库足够大，能够尽量多地匹配用户问句，否则会经常出现找不到合适回答内容的情形，因为在真实场景下用户说什么都是可能的，但是它的好处是回答质量高，因为对话库中的内容都是真实的对话数据，表达比较自然。\r\n\r\n\r\n\r\n 生成式聊天机器人则采取不同的技术思路，在接收到用户输入句子后，采用一定技术手段自动生成一句话作为应答，这个路线的机器人的好处是可能覆盖任意话题的用户问句，但是缺点是生成应答句子质量很可能会存在问题，比如可能存在语句不通顺存在句法错误等看上去比较低级的错误。\r\n\r\n\r\n\r\n本文重点介绍开放领域、生成式的聊天机器人如何通过深度学习技术来构建，很明显这是最难处理的一种情况。', '2017-04-20', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1051', 'Jackson', 'NoSQL之Redis---主从复制', 'Redis的复制功能是非常简单易用的，配置为主从复制功能之后允许Redis的slave服务器复制出与master完全一致的服务器。以下是一些关于Redis复制功能的几个重要方面：\r\nRedis使用异步复制。从2.8版本开始 ，slave服务器将以1s的频率想master服务器报告复制流的处理进度。\r\n一个master服务器可以拥有多个slaves服务器。\r\nslave服务器也能链接到其他slave服务器。除了链接到master服务器之外，slave服务器也能够和多个slave一起构成图状结构。\r\nRedis的复制功能不会阻塞master服务器。话句话说，master服务器能够在向一个或者多个slave进行初始化复制时也能够持续的接受服务请求。\r\n复制功能也不会阻塞slave服务器。当slave在进行初始化复制时，slave也能够处理老版本的数据服务，前提是你在Redis.conf文件中进行了相应的配置。另外，你也可以配置slave在与master断开时，让其返回错误。然而，在异步的初始化之后，旧数据必须被删除，并且新数据必须被加载到slave中。此时，slave将会被阻塞直到复制完成。\r\n复制功能也可以被用于提升扩展性，使得，多个slave提供只读服务（如，繁重的SORT命令操作可以交给复述节点进行）。或者将复制功能单纯的用于数据冗余（datar redundancy）。\r\n使用复制功能来使得master节点避免执行持久化操作。只需要关闭主服务器的持久化功能，然后由从服务器去执行持久化操作即可。特别的：在这种配置之下，请确保master服务器不会自动重启。在master节点关闭持久化功能时，复制的安全性\r\n       当在设置中开启Redis复制功能时，强烈建议的做法是在master节点中开启持久化功能，或者绝对不可能发生的是：因为延迟问题，将Redis实例被配置为避免自动重启。\r\n       为了更好的理解为什么将关闭持久化功能的master节点配置为自动重启是非常危险的，我们看看下面在数据从master节点与其对应的所有slave节点移除时发生的失败类型：\r\n假设A节点是master节点，B，C节点是其对应的副本。\r\nA发生崩溃时，（配置为自动重启），重新启动了进程。然而因为持久化功能是关闭的，所以重启之后，该节点内的数据为空。\r\n节点B，C将会从A进行复制，这时A中的数据集是空的，因此，这时，B，C将会彻底删除他们之前备份的数据。\r\n       为了高可用性，引入了Redis的哨兵(sentinel)，关闭了master节点上的持久化，并且两者都配置为自动重启，这种做法也是非常危险的。举个例子：master节点可能非常快的就完成了重启，以至于sentienl都没有感知到失败的发生，接下来就会发生和上面例子一样的结果。\r\n       在任何时间，数据的安全都是非常重要的，因此，在使用复制功能时，master节点如果没有持久化功能，自动重启的功能是必须被禁止的。\r\n复制功能的运行原理\r\n       当你建立一个slave节点时，slave节点都会将master节点发送一个SYNC命令。无论是首次链接还是重新连接。\r\n       当maste节点接受到SYNC命令时，master节点将会开始后台保存功能，并且开始缓存所有接收到的将会修改数据集的新命令。当后台保存任务完成时，master节点将数据文件传送给slave节点，slave节点将会把数据文件保存到本地磁盘，并且加载到内存中。紧接着，master节点将会把之前还存下的所有命令也传输给slave节点。这项功能将会按照指令流来完成并且是一个与Redis协议本身相同的格式。\r\n       你可以通过telnet命令来亲自验证这个同步过程。首先，连接上一个正在处理命令请求的Redis服务器，然后发送SYNC命令，之后，你将看到大量的数据转移以及master节点上接收到的每一条命令将会被再次运行在telnet的会话中。\r\n       当master节点与slave节点断开时，slave节点能够自动的重写链接到master节点上。如果master节点接收到多个同时进行复制请求时，master节点也只需要执行一次SYNC命令，就可以处理到所有的slave服务器的同步请求。\r\n       当master节点与slave节点断线重连之后，一个完整的SYNC命令将会被执行。在2.8版本之后，slave节点将会根据主服务器的情况来选择是完整同步还是部分同步。', '2017-04-02', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1052', 'Mary', 'Qt之保持GUI响应', '执行耗时操作\r\n\r\n我们需要做的第一件事就是确定能够解决问题的范围。上述问题可能会以两种形式出现。\r\n\r\n当一个程序执行计算密集型的任务，为了获得一系列按顺序操作的最终结果。这样任务的一个例子是：计算一个快速傅立叶变换。\r\n\r\n当一个程序触发一些行为（例如：网络下载），等待它完成之后，继续算法的下一个步骤。使用Qt时，这个问题很容易避免，因为大部分框架执行的异步任务完成以后都会发出相应的信号，可以把它连接到槽函数上延续算法。\r\n\r\n在计算期间（忽略任何信号槽使用）所有事件处理会停止。其结果是：GUI未刷新、用户输入不处理、网络活动停止 - 应用程序看起来被阻塞了。实际上，不相关的部分耗时任务阻塞了，多长时间属于“耗时操作”？ - 任何一切干扰用户和程序交互的都算。一秒比较长，所有超过两秒以上的绝对太长了。\r\n\r\n这节，我们的目标是保证功能，同时防止用户界面被阻塞而惹恼用户。要做到这一点，来看看解决方案。有两种方式可以达到执行计算的最终目标：\r\n\r\n在主线程计算（单线程方式）\r\n单独的线程（多线程方式）\r\n后者广为人知，但它有时被滥用。因为有时一个线程处理完全可以。与流行观点相反，线程通常会减缓你的应用程序而不是加速。所以，除非你确信程序可以在多线程中受益（无论对效率还是简单而言），尽量避免产生新的线程，因为你可以。使用一个工作线程\r\n\r\n另一个避免阻塞主事件循环的解决方案：在一个单独的线程中处理耗时操作。如果任务由第三方库以阻塞方式执行，这就显得非常有用。这种情况下，可能不能中断它让GUI处理等待事件。\r\n\r\n在单独的线程中执行操作的一种方法是使用QThread。可以子类化QThread并实现run()函数，或调用QThread::exec()启动线程的事件循环，当然，也可以两者兼有。然后可以用信号槽的方式与主线程通信。切记：必须确保使用Qt::QueuedConnection类型连接，否则线程可能会失去稳定性，导致程序crash。\r\n\r\n在Qt参考文档和在线资料里有很多使用线程的示例，所以这里就不自己实现了，主要专注于其它有趣的方面。', '2017-03-21', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1053', 'Amy', '配置maven私服nexus', '1、Nexus简介\r\n\r\n1.1 Nexus概述\r\n\r\nNexus是一个强大的Maven仓库管理器，它极大地简化了自己内部仓库的维护和外部仓库的访问。\r\n\r\n利用Nexus你可以只在一个地方就能够完全控制访问和部署在你所维护仓库中的每个Artifact。\r\n\r\nNexus是一套“开箱即用”的系统不需要数据库，它使用文件系统加Lucene来组织数据。Nexus使 \r\n用ExtJS来开发界面，利用Restlet来提供完整的REST APIs，通过m2eclipse与Eclipse集成使用。\r\n\r\nNexus支持WebDAV与LDAP安全身份认证。\r\n\r\nNexus是一个Maven仓库管理器，用来搭建私有仓库服务器。建立公司/组织的私有仓库的的好处 \r\n是便于管理，节省公网带宽，利用内网下载依赖项速度快，还有一个非常有用的功能就是能有效管 \r\n理内部项目的SNAPSHOT版本，实现各个模块间的共享。1.2.3 远程仓库\r\n\r\n1.3.1 远程仓库概述\r\n\r\nmaven的远程仓库有多种存在形式，中央仓库，其他远程仓库，镜像，私服\r\n\r\n1.3.2 中央仓库\r\n\r\n中央仓库是默认的远程仓库，如果不做任何特殊配置那么将会从中央仓库下载依赖，这在 \r\n$M2_HOME/lib/maven-model-builder-3.0.4.jar里的org/apache/maven/model/pom-4.0.0.xml里做了指定。注意RUN AS USER一般不推荐设置为root。 \r\n如果开始是以root用户安装 且设置了RUN AS USER为root启动。再去设置RUN AS USER用户的时候 \r\n会出现一系列的错误，主要是由于权限限制可以使用 \r\nsudo chmod -R a+x /usr/local/nexus 设置权限 (这里的目录是nexus的安装位置，例如我的 \r\n：sudo chmod -R a+x /home/software/nexus-2.11.2-06-bundle/) \r\n还需要设置下 /var/run/目录的权限 否则会出现pid无法写入的错误。Proxy Repository - 代理库，很多开源官方组织都在互联网上公布了Repository，供全世界的开发者使用，nexus中设置该类型的资源库后，其它使用nexus的开发者，表面上是在请求nexus服务器上的jar包，但nexus实质是背后是在请求这些互联网资源，首次会把服务器上没有的资源，从网上download到nexus服务器（以文件形式保存到硬盘上），然后再返回给开发者，下次再有同样的pom/jar请求时，直接从服务器硬盘上返回，不再请求互联网Repository Group - 资源组，比如我们有很多资源库：资源库A、资源库B…，可以把它们再成组合一个特殊的资源C，然后其它开发人员，在maven里配置资源C地址，这样maven在向资源C请求 \r\njar包里，实质会搜索资源A、资源B。', '2017-04-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1054', 'Olivia', '使用Keras搭建深度残差网络', '残差网络简介\r\n\r\nMSRA的Kaiming He的残差网络绝对要算的上是2015年深度学习的大新闻了，深度残差网络将深度网络的层深拓展到一个不可思议的程度（152层），并在ImageNet竞赛中以绝对优势取得多个项目的冠军。后来，Kaiming He大神后来又把这一深度加到1000层的深度，能训练这么深的网络，残差网络的优势可见一斑。Kaiming He也因为这项工作获得了2016 CVPR的best paper award，这也是他获得的第二个CVPR best paper，顺便，据知乎爆料，Kaiming He还是广东省某年的高考状元哟！ 果然神的成长路径我们只能仰望……\r\n\r\n这篇文章的主要目的是提供一个Keras的深度残差网络的实现，理论上的分析大家尽可以去搜索别的文章，我们这里快速的过一下。\r\n\r\n训练深度网络是一件很头疼的事情，尽管已经有了ReLU等一系列手段加深网络，但梯度爆炸/弥散的问题并没有真正的解决。对深度学习而言，深度是比较值钱的，深度这个特性带来的性能提升也是最可观的。由于训练不到位，单纯的把layer叠起来深层网络的效果反而不如合适层数的较浅的网络效果好，这种情况称为网络退化。\r\n\r\nResNet（深度残差网络）的出现为训练更深的网络提供了方法，深度残差网络其实是Highway网络的一种特殊情况，其主要特色是跨层连接。作者的一个假设是，相比于直接拟某个函数合y=f(x)，试图去拟合g(x)=y−f(x)，也就是残差，可能会更加容易，虽然为什么这样我也说不清楚，但效果看起来是不错。网络试图将x映射为F(x)+x，那么网络的映射F(x)自然就趋向于F(x)=0。\r\n\r\nkaiming he的github是https://github.com/KaimingHe \r\n里面有残差网络的caffe实现和相应权重，使用caffe的同学可以直接下载。\r\n\r\n使用Keras的同学，就接着往下看了。\r\n\r\nKeras搭建残差网络（Res50）\r\n\r\n如果你看到这里，keras是什么想必不用我再介绍。开始之前，先打广告，欢迎访问keras中文文档学习keras，如果能动动小手在主页最下方打赏我一下，那就更加感谢了。\r\n\r\nKeras便于搭建网络的特点使得搭建网络大部分情况是一种“照猫画虎”的便捷工作，很开心kaiming he的github上提供了残差网络的可视化结构，如果你有双屏，完全可以一屏看图一屏搭结构，爽的不要不要的。我们选择kaiming he提供的最浅的50层残差网络进行搭建，它的图在这里：Res50\r\n\r\n观察一下网络图，首先跨层连接，肯定要使用泛型模型Model，整个网络有两种重复单元，一种是主path和shortcut都有卷积层。', '2017-04-18', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1055', 'Henry', 'Android 自定义View实现竖直跑马灯效果', '大家知道，横向的跑马灯Android自带的TextView就可以实现，详情请百度【Android跑马灯效果】。但是竖直的跑马灯效果原生Android是不支持的。网上也有很多网友实现了自定义的效果，但是我一贯是不喜欢看别人的代码，所以这篇博客的思路完全是我自己的想法哈。\r\n首先，我们需要给自定义的控件梳理一下格局。1、首先我们将控件分为三个区块，上面绿色部分为消失不可见的块，中间黑色部分为可见区域，下面红色部分为欲出现不可见区域。蓝色的线代表的是整个控件的上线和下线。\r\n2、首先我们只给出两个文字块在内存中，分别是黑色部分的可见块和红色部分的欲出现块。\r\n3、求出这些块的宽度、高度与中心点的坐标值。\r\n4、滚动时，动态地改变每个块的中心点y坐标，使之向上平移。\r\n5、当平移结束后，可见块位于欲消失的不可见块，欲出现的可见块位于可见区域的文字块。此时将欲消失的文字块移除List，并重新设置后一个索引的Text和重心坐标值，重新加入List中，刷新。\r\n6、用一个Handler来处理动画的间隔时间。用属性动画ValueAnimator来实现平移的动画效果。这个bean类，最重要的方法就是几个重载的reset方法，通过改变centerY的值，来动态得改变绘制文字的起点实现居中绘制。关于文字的居中绘制请参考百度【android canvas 居中绘制文本】。在这个方法中，首先进行非空判断以免出现致命逻辑错误。然后得到整个控件的宽高和重心坐标。然后实例化两个文字块TextBlock，第一个文字块通过reset设置中点y坐标为整个控件的中点y坐标，第二个文字块通过reset设置中点y坐标为centerY+height，意思就是置于下一个文字块的不可见区域内。\r\n然后是onDraw方法，这个方法非常简单，已经将业务逻辑转交给TextBlock的draw方法了。', '2017-05-04', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1056', 'Kim', 'Seckill系统高并发优化', '绝大多数秒杀系统都需要实现高并发，这样就必须在原来的项目基础上进行优化。简单的优化很有可能就会很大地提高系统的并发性能，但是这些优化往往是系统开发人员很少注意的，或者直接被人们忽略。因此要成为一个出色的开发人员，学会优化技巧与时刻具备系统优化的意识是必须的。本项目秒杀业务核心SQL操作：\r\n\r\n先是UPDATE货存（货存减1），再是INSERT购买明细。中间可能会出现重复秒杀，秒杀结束，系统内部错误等异常，只要出现异常，事务就会回滚。\r\n\r\n事务行为分析：\r\n\r\n当一个事务开启的时候拿到了数据库表中某一行的行级锁，另一个事务进来数据库时发现锁住了同一行，若之前的事务不提交或回滚，这个行级锁不会被释放，后面进来的那个事务就要等待行级锁。当第一个事务提交或回滚后，行级锁被释放，第二个事务就能获得这个行级锁进行数据操作，多个事务以此类推，这些过程是一个串行化的操作，也是一个含有大量阻塞的操作。这是MySQL数据库或是绝大多数关系型数据库事务实现的方案。\r\n\r\n秒杀系统瓶颈分析：\r\n\r\n现在的事务实现方案是通过Spring的事务对秒杀业务核心进行管理。\r\n系统目前的秒杀逻辑：java客户端发送UPDATE语句至MySQL服务端（虽然有网络延迟，但是各个事务并行），各事务开始竞争行级锁（阻塞开始），UPDATE执行后将UPDATE结果返回至java客户端（存在网络延迟与可能的GC操作），客户端判断如果执行成功，则发送INSERT购买明细的SQL语句至MySQL服务端再执行（存在网络延迟与可能的GC操作），将执行结果返回至java客户端（存在网络延迟与可能的GC操作），客户端再判断是否执行成功，如果成功，就告知MySQL提交事务（存在网络延迟）。\r\n因此，阻塞的时间即从各事务在MySQL服务端竞争行级锁开始，一直到最后的事务提交，中间有4次的网络延迟以及java客户端的各种逻辑判断。这样事务的执行周期就会比较长。当排队的事务比较多的时候，系统性能就会呈指数级下降。项目优化分析：\r\n\r\n通过分析事务的行为与秒杀系统瓶颈可以知道，要减少事务等待的时间，削弱阻塞的过程，就要想办法减少行级锁持有的时间。\r\n\r\n优化思路一：持有行级锁是在UPDATE上（INSERT不涉及行级锁），释放锁是在Commit(客户端Spring控制)，也就是锁持有时间是UPDATE和Commit之间。这个过程网络请求越少，锁持有时间就越短。\r\n优化思路二：把客户端逻辑放在MySQL服务端（使用存储过程，整个事务在MySQL端完成），避免网络延迟与GC的影响，也没有java客户端的逻辑判断。分析：\r\n\r\n参照优化思路一，持有行级锁在UPDATE上，INSERT不涉及行级锁（没INSERT之前根本不存在相应的行，更不可能会有行级锁）。因此可以先插入购买明细，这个过程虽然存在网络延迟，但是各个事务之间是可以并行的所以不需要等待，这样就可以减少各个事务一部分的等待与阻塞。实现减少MySQL row lock的持有时间。（但还是要把UPDATE库存的结果返回给客户端，客户端再决定是否提交事务，即还有2次网络延迟）。', '2017-03-28', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1057', 'Amber', 'React Native学习笔记之一', '概述：\r\n\r\nReact Native 是现在比较火的Android APP开发技术，由FaceBook推出的基于JSX开发的一个可以跨平台开发的框架。 Facebook在这个框架中提出了一个理念： Learn once, write anywhere 也是这个框架的优势所在。目前基于RN开发的APP有： \r\n天猫iPad客户端，支付宝，携程网,Facebook Group，Chinese Flashcards等等（部分业务、模块采用RN开发）。Step 1： 环境的搭建（mac）\r\n\r\n安装Homebrew;\r\n安装nvm;\r\n安装node，通过命令：nvm install node && nvm alias default node；\r\n安装watchmam，通过命令：brew install watchman；\r\n安装flow，通过命令：brew install flow；\r\n安装React Native，通过命令：npm install -g react-native-cli;\r\n创建React Native应用程序，通过命令react-native init HelloWorld;\r\n进入HelloWorld目录，并创建5.0系统以上的安卓模拟器;\r\n配置React Native环境，通过命令npm install；\r\n运行React Native程序，通过命令react-native run-android。Step 2： React Native项目的基本认识android、ios文件夹分别对应ios工程和android工程，两个js文件分别对应android、ios默认的js文件，package.json和package.json是React Native的环境配置相关文件。\r\n\r\nAndroid工程依赖于指定的js展示界面，全工程甚至可以只需要通过一个Activity和多个js文件来表现不同的页面。在js文件中，Facebook提供了UI组件，网络请求等其他APIS，类似于于Activity+XML的结合体。\r\n\r\n在这里不得不提的是，Facebook在最早的时候提出基础理念叫做React，基于此出现了ReactJS来开发网页，直到现在出现React Native来开发移动应用。在React Native官网中提到这么一句话：\r\n\r\nReact Native enables you to build world-class application experiences on native platforms using a consistent developer experience based on JavaScript and React.\r\n也就是说React Native是基于JavaScript和React的开发框架，因此支持JS语法。在render方法中返回了类似于“div”标签形式组合的ui组件,通过修改对应的文本，并双击R(Genymotion)ReLoad JS，可以查看修改后的内容。\r\n\r\n通过访问React Native官网，在左侧的导航列表的COMPONENTS列表中可以看到通用的UI控件，如ListView，Image等等。参考官网提供的学习步骤，我们可以新建一个js文件，建立自己的Movie List程序。', '2017-05-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1058', 'Sunny', '初探React Native', 'PS该报告偏向理论层面，技术层面由于本人才疏学浅属于前端小白因此暂时未作过多研究。React Native是Facebook开发的一套框架，其目的在于使用JavaScript语言开发原生APP，目前iOS版本和Android版本均已开源。React Native使你能够基于javaScript和React开发世界级的原生APP，其焦点在于开发效率，因为你能够用它来开发多个平台的应用(包括iOS和Android)。换句话说：learn once, write anywhere. Facebook目前已经使用React Native开发了多个原生应用，并将持续完善这套框架。\r\n可以看到，React Native框架本身的定位在于提升移动端应用开发效率。再看看一个“webView”打天下的Hybrid应用，React Native是否也能够一套代码实现两个平台的“一劳永逸”呢？虽然我觉得不能说完全否定，但是基本是不可行的。\r\n\r\n官方对于React Native的描述是 learn once, write anywhere ，而并非是 write once,run anywhere. 也就是说，React Native的跨平台，指的是可以用React Native编写两个平台的应用，而不是一套React Native代码可以同时在两个平台上跑。原因在于React Native开发的是原生应用，iOS端和Android端的大部分控件是无法整合到同一个JS端组件或API上的。事实上，只有少数的组件及API能够垮平台使用。因此，简单地说，一个应用，依旧两套代码，只不过可以由一套框架（并不绝对）、一个RN团队来完成。说到RN的语法，不得不提到React（即React.js）。React同样是脸书开源的一套前端框架，核心语言javaScript毋庸置疑，另外其采用组件化的方式构建界面，这在语法上则需要HTML的支持；对于界面布局，采用的则是一贯的CSS方案。可能你要一脸懵逼了，心想这不就是大名鼎鼎的前端三剑客吗？是的！然而React将HTML、CSS、javaScript黑魔法般地整合到一起，自成规则，成就了一种全新的语法：JSX。而React Native采用的，正是React的这套语法。说白了，React+RN，JS一统三端了！另外，RN已经支持了ES6语法。\r\n\r\n服务器端\r\n\r\n使用Node.js作为javaScript的运行环境，其内置了V8引擎。就作为一名RN开发者而言，对于Node的认识即便一片空白实际上也无伤大雅。', '2017-05-03', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1059', 'Daniel', 'butterknife源码详解', '作为Android开发者，大家肯定都知道大名鼎鼎的butterknife。它大大的提高了开发效率，虽然在很早之前就开始使用它了，但是只知道是通过注解的方式实现的，却一直没有仔细的学习下大牛的代码。最近在学习运行时注解，决定今天来系统的分析下butterknife的实现原理。\r\n\r\n如果你之前不了解Annotation，那强烈建议你先看注解使用。从图中可以很直观的看出它的module结构，以及使用示例代码。\r\n\r\n它的目录和我们在注解使用这篇文章中介绍的一样，大体也是分为三个部分:\r\n\r\napp : butterknife\r\napi : butterknife-annotations\r\ncompiler : butterknife-compiler\r\n通过示例代码我们大体能预料到对应的功能实现:\r\n\r\n@BindView(R2.id.hello) Button hello; \r\nBindView注解的作用就是通过value指定的值然后去调用findViewById()来找到对应的控件，然后将该控件赋值给使用该注解的变量。\r\n\r\n@OnClick(R2.id.hello) void sayHello() {...} \r\nOnClick注解也是通过指定的id来找到对应控件后，然后对其设置onClickListener并调用使用该注解的方法。\r\n\r\n最后不要忘了ButterKnife.bind(this);该方法也是后面我们要分析的突破点。\r\n\r\n当然Butterknife的功能是非常强大的，我们在这里只是用这两个简单的例子来进行分析说明。作用到方法上的编译时注解。我们发现该注解还使用了ListenerClass注解，当然从上面的声明中可以很容易看出它的作用。可以看到他内部会通过findViewByid()等来找到对应的View，然后将其赋值给target.xxxx，所以这样就相当于把所有的控件以及事件都给初始化了，以后就可以直接使用了，通过这里也可以看到我们在使用注解的时候不要把控件或者方法声明为private的。', '2017-04-24', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1060', 'James', '自定义ActionProvider ToolBar 自定义Menu小红点', '今天的几个目标： \r\n1. 自定义ActionProvider \r\n2. Toolbar ActionBar自定义Menu \r\n3. Toolbar ActionBar 右侧Menu添加角标（Toolbar ActionBar Menu添加小红点） \r\n源代码在文章末尾。需求描述与分析\r\n\r\n通常我们会自定义Titlebar，可以实现很多自定义的效果。但是后来Toolbar出来后实在太好用了，于是乎我们都使用了Toolbar但是我们要给右侧的Menu Button实现类似BadgeView的这种效果（如上图小红点）怎么办呢呢？\r\n\r\n看到这个要求后没有玩过ActionProvider的同学可能就慌了，但是请先跟我来分析下这个Menu的组成：一个ImageView显示icon，一个TextView显示数字，TextView还有个圆形的背景（可以是任何形状或者颜色）。那么就不能用系统的menu.xml这种来做了，所以要自定义Menu，有人可能想到了自定义View，but并不需要。其实这个menu的item有一个Android:actionProviderClass属性，用这个属性就可以自定义在这里显示的内容（View），这个属性的值是一个完整的类名，例如com.yanzhenjie.XXOOProvider这样的，而这个XXOOProvider需要继承ActionProvider，具体的操作也全都是在ActionProvider中完成。\r\n\r\n首先继承ActionProvider\r\n\r\n这里要坐下特殊说明，因为Toolbar是support包下的，所以我们要用support下的ActionProvider类，这个类是在support.v4下，它是兼容Toolbar和ActionBar的，所以我们自定义好这个ActionProvider类后就可以在Toolbar和ActionBar中随意使用了。\r\n\r\n因为我们要实现角标，暂且把这个类名叫BadgeActionProvider吧，继承ActionProvider需要实现onCreateActionView()方法。自定义布局：要显示的BadgeView\r\n\r\n我们看到onCreateActionView()类需要return 一个View，这个View就是我们要自定义的View，所以我们接着来定义显示的View，很简单就是文章开头分析的一个ImageView和一个TextView。上述代码中需要解释的只有android:background=\"?actionBarItemBackground\"是引用系统默认Toolbar/ActionBar的Menu的点击效果。TextView的android:background=\"@drawable/circle_red\"就是那个圆形的红色背景啦。', '2017-04-10', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1061', 'Kate', '正则表达式归纳总结', '正则表达式\r\n\r\n1. 使用正则\r\n\r\n创建正则表达式有两种方式，一种是以字面量方式创建，另一种是使用RegExp构造函数来创建。其中模式(pattern)部分可以是任何简单或复杂的正则表达式，可以包含字符类、限定符、分组、向前查找以及反向引用。 \r\n每个正则表达式都可带有以或多个标志(flags)，用以表明正则表达式的行为。注：flag为可选项，表示匹配模式，主要有一下3种标志。\r\n\r\ng : 表示全局(global)模式，即模式将被应用于所有字符串，而非在发现第一个匹配项时立即停止；\r\ni : 表示不区分大小写(case-insensitive)模式，即在确定匹配项时忽略模式与字符串的大小写;\r\nm : 表示多行(multiline)模式，即在到达一行文本末尾时还会继续查找下一行中是否存在与模式匹配的项。1.1 RegExp 实例属性\r\n\r\n每个RegExp实例对象都会存在下列属性：\r\n\r\nglobal : 布尔值，表示是否设置了g标志\r\nignoreCase : 布尔值，表示是否设置了i标志\r\nmultiline : 布尔值，表示是否设置了m标志\r\nlastIndex : 整数，表示开始搜索下一个匹配项的字符位置，从0算起\r\nsource : 正则表达式字符串表示，按照字面量形式而非传入构造函数中的字符串模式返回。1.2 RegExp 实例方法\r\n\r\npattern.exec(str)\r\nexec方法是RegExp的主要方法，主要用于提取捕获组(这个后面后讲到)，它接收一个匹配字符串作为参数，如果匹配成功，返回一个包含匹配项信息的数组；在没有匹配到的时候返回null。\r\n\r\n返回的数组包含匹配的字符串，同时另外包含两个属性：index 和 input。index表示的是匹配字符串在文本中的起始位置，input表示匹配的字符串。\r\n\r\n在非全局模式匹配下，如果字符串中含有与模式匹配的多个子字符串，那么只会返回第一个匹配项的结果。返回的数组中下标为0的位置表示匹配到的字符串，其余位置表示匹配到的捕获组信息；而在全局模式下(g)，如果依次执行exec方法，依次返回的是每一个匹配项信息的数组。pattern.test(str)\r\ntest方法主要用于检测字符串中是否存在与模式匹配的字符串，常用语条件判断。匹配成功返回true，否则返回false。1.3 RegExp 构造函数属性\r\n\r\n构造函数静态属性，分别有一个长属性名和一个短属性名(Opera是例外，不支持短属性名)。1.4 用于模式匹配的String方法\r\n\r\nstr.search(pattern)\r\n它的参数是一个正则表达式，返回第一个与之匹配的子串的起始位置，如果找不到匹配的子串，它将返回-1。注：如果search()的参数不是正则表达式，则首先会通过RegExp构造方法将它转换成正则表达式，search()方法不支持全局检索，因为它忽略正则表达式参数中的修饰符g\r\n\r\nstr.replace(subStr | pattern, replaceStr | function)\r\n第一个参数是正则表达式或者是字符串，第二个参数是要替换的字符串。如果第一个参数是正则表达式，直接进行模式匹配，若为字符串，则会检索整个字符串进行替换，而不会转化为正则表达式。', '2017-04-24', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1062', 'Mark', '说说 Hibernate 的映射策略', '1 基本属性映射\r\n\r\n持久化类属性的 JPA 规则是：\r\n\r\n持久化类的属性如果是基本类型或者基本类型的包装器，诸如 String, BigInteger, BigDecimal, java.util.Date, java.util.Calendar, java.sql.Date, java.sql.Time, java.sql.Timestamp, byte[], Byte[], char[], Character[]，它们会被自动持久化。\r\n如果一个类加了 @Embeddable 注解，表明这个类是属于其他某个类的一部分，它是内嵌的类，我们以后会说到。\r\n如果属性类型是java.io.Serializable，那么它的值会被存储为序列化后的格式。\r\n如果以上条件都不成立，那么 Hibernate 会在启动时抛出异常。1.1 覆盖基本属性的默认值\r\n\r\n如果某个属性不需要被持久化，可以加上 @javax.persistence.Transient 注解或者使用 Java 的 transient 关键字。\r\n\r\n默认情况下，所有的可持久化属性都是可为 null ，既是可选的。因此可以使用 @Basic 注解把某个属性改为必填。这样配置以后，hibernate 会在生成 SQL schema 时，把这个属性设置为非 null。如果在插入或者更新时，这个属性是 null，那么 Hibernate 就会抛出异常。大多数工程师们更喜欢用 @Column 注解来声明非 null。也就是说@Basic、@Column以及之前所说的 Bean Validation 的 @NotNull，它们的功能都一样，配置其中一个后，Hibernate 会对这个属性进行非 null 验证。建议使用 Bean Validation 的 @NotNull，因为这样就能够在表现层手动验证一个 Item 实例。@Column 还有一些属性设定，比如可以设定 catalog、schema 的名字，但是它们在实践中很少会被用到。\r\n\r\n1.2 自定义存取属性的方式\r\n\r\n可以选择是通过字段来直接存取，还是通过 getter/setter 方法来间接存取。 \r\nHibernate 是依据持久化类的 @Id 注解来判断到底是采取哪种方式的。比如 @Id 放在某个属性上，那么所有的属性都会是通过字段来直接存取的。\r\n\r\nJPA 规范中还提供了 @Access 注解，它有两个值，AccessType.FIELD（通过字段来直接存取） 和 AccessType.PROPERTY（通过 getter/setter 方法来间接存取）。可以把这个注解放在类上，这样就会应用于所有的属性，也可以放在某个类属性上，对它进行精细控制。Hibernate 还有一个特性可以会很少用到，这里提一提。noop 级别的存取器。假设数据库表有一个 VALIDATED 字段，表示有效时间，但是没有把它放在领域类模型中（这种情况应该很少发生吧 O(∩_∩)O~）。为了能够对这个字段进行 SQL 查询，必须把它放在 hbm.xml 的 metadata 文件中。做了这样的映射以后，就能够在查询中使用 validated 咯。注意之前说过，如果使用了 Hibernate 的 hbm.xml 的 metadata 文件进行配置，那么所有在 Item 类上的持久化注解就都失效咯。\r\n\r\n如果以上的映射还不能满足要求，那么可以直接自定义一个属性存取器！只要实现一个 org.hibernate.property.PropertyAccessor 接口，然后配置到下面这个注解中。', '2017-05-25', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1063', 'John', ' Android图片加载框架最全解析（二），从源码的角度理解Glide的执行流程', '在开始解析Glide源码之前，我想先和大家谈一下该如何阅读源码，这个问题也是我平时被问得比较多的，因为很多人都觉得阅读源码是一件比较困难的事情。\r\n\r\n那么阅读源码到底困难吗？这个当然主要还是要视具体的源码而定。比如同样是图片加载框架，我读Volley的源码时就感觉酣畅淋漓，并且对Volley的架构设计和代码质量深感佩服。读Glide的源码时却让我相当痛苦，代码极其难懂。当然这里我并不是说Glide的代码写得不好，只是因为Glide和复杂程度和Volley完全不是在一个量级上的。\r\n\r\n那么，虽然源码的复杂程度是外在的不可变条件，但我们却可以通过一些技巧来提升自己阅读源码的能力。这里我和大家分享一下我平时阅读源码时所使用的技巧，简单概括就是八个字：抽丝剥茧、点到即止。应该认准一个功能点，然后去分析这个功能点是如何实现的。但只要去追寻主体的实现逻辑即可，千万不要试图去搞懂每一行代码都是什么意思，那样很容易会陷入到思维黑洞当中，而且越陷越深。因为这些庞大的系统都不是由一个人写出来的，每一行代码都想搞明白，就会感觉自己是在盲人摸象，永远也研究不透。如果只是去分析主体的实现逻辑，那么就有比较明确的目的性，这样阅读源码会更加轻松，也更加有成效。\r\n\r\n而今天带大家阅读的Glide源码就非常适合使用这个技巧，因为Glide的源码太复杂了，千万不要试图去搞明白它每行代码的作用，而是应该只分析它的主体实现逻辑。到底是如何实现将一张网络图片展示到ImageView上面的。先将Glide的一整套图片加载机制的基本流程梳理清楚，然后我们再通过后面的几篇文章具体去了解Glide源码方方面面的细节。既然是要阅读Glide的源码，那么我们自然需要先将Glide的源码下载下来。其实如果你是使用在build.gradle中添加依赖的方式将Glide引入到项目中的，那么源码自动就已经下载下来了，在Android Studio中就可以直接进行查看。\r\n\r\n不过，使用添加依赖的方式引入的Glide，我们只能看到它的源码，但不能做任何的修改，如果你还需要修改它的源码的话，可以到GitHub上面将它的完整源码下载下来。可以看到，with()方法的重载种类非常多，既可以传入Activity，也可以传入Fragment或者是Context。每一个with()方法重载的代码都非常简单，都是先调用RequestManagerRetriever的静态get()方法得到一个RequestManagerRetriever对象，这个静态get()方法就是一个单例实现，没什么需要解释的。然后再调用RequestManagerRetriever的实例get()方法，去获取RequestManager对象。', '2017-03-14', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1064', 'Bob', ' VR游戏交互开发的一些体验', '本文主要写Unity开发手游过程中VR交互输入控制的一些浅薄的经验\r\n交互方面，头控和视线按钮依然较为主流，可以获得传感器数据来获得输入\r\n除了实体按钮输入之外还可以探索其他交互方式，比如触摸板等，但机制有待成熟。1.头控\r\n通过捕获头部转动可以很方便的实现交互，成本最低，适合一些纯观景或轻度游戏\r\n设计时，要尽量减少头部移动范围，否则用户容易疲惫\r\n2.视线按钮\r\n使用一个醒目的准星或光标来指示视线位置，长时间注视来确认点击\r\n这些按钮一定要是立体的按钮，即在Unity中要设置为World Space渲染\r\n按钮摆放\r\n按钮要足够大，方便选中，间隔也要足够大\r\n按钮的位置也要集中，不能像以前的2D游戏一样按钮全部在屏幕四周，这样用户会非常累。比如暴风VR在播放视频时把返回和暂停按钮放到脚下并紧挨着，很不错\r\n按钮和相机的距离太近容易疲劳，但太远的话如果对焦在UI按钮上会模糊掉其他距离的GameObject，需要根据场景适当调整\r\n按钮动效\r\n注视过程中提供一些反馈，如出现一个桶或圆环，随着注视时间增长，出现一个桶被填满、圆环转一圈等效果\r\n最好提供直接点击的确认方式\r\n3.准星\r\n用户双眼会聚焦在最前面的物体上，因此准星与相机的距离要随着正前方物体到相机的距离来调整\r\n准星不应当被遮挡，但在VR游戏中，不能使用多个相机的方式实现不被遮挡，最好采用shader实现\r\n4.按键\r\n有了按钮之后，则用户点击按钮无需等待，大大提升用户体验\r\n比如GearVR触摸板+按钮辅助，Cardboard的磁铁，以及新版的触摸按钮设计\r\n5.Daydream手柄\r\n现在只能使用另外一个手机安装模拟器应用来模拟手柄，需要两个手机在同一个局域网下面\r\n支持陀螺仪、重力感应、触控输入、按钮\r\n陀螺仪不支持定位，只能检测到角速度\r\n仅提供最基础的API，对于手柄的移动要自己定义动作，可以预见会出现一个较好的动作提取Unity插件产品。总结\r\n交互逻辑与传统游戏差别很大，需要在开发过程中和实践相结合。比如头控和手势，一定要通过不断迭代参数来优化体验。\r\nVR的交互方式在慢慢成熟，根据游戏类型和交互需求选择特定的交互方式非常重要。\r\n接触VR时间不久，只有一些简陋的经验，希望且行且总结，且行且学习。', '2017-04-19', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1065', 'Leo', '工业物联网框架中边缘节点的检测和测量', '工业物联网(IoT)正在酝酿广泛的转变，这种转变不仅将使互联机器间的相互检测成为一种竞争优势，还将使其成为必不可少的基本服务。工业物联网以边缘节点为起始点，后者是检测和测量的目标切入点。这是物理世界与计算数据分析进行交互的接口所在。互联的工业机器可检测大量的信息，进而用于制定关键决策。这种边缘传感器可能远离存储历史分析的云服务器。它必须通过将边缘数据聚合到互联网的网关进行连接。理想情况下，边缘传感器节点具有很小的规格尺寸，可在空间受限的环境中轻松进行部署。\r\n\r\n检测、测量、解读、连接\r\n\r\n边缘节点的智能管理对成功实施来说十分关键。在一些情况下，超低功耗(ULP)是最重要的性能指标。在关键事件期间，当传感器从睡眠模式唤醒时，可以过滤掉绝大多数的潜在数据。\r\n\r\n传感器构成工业物联网电子生态系统的前端边缘。测量阶段将检测到的信息转换为有意义的数据，如压力、位移或旋转的可量化值。在解读阶段，边缘分析与处理会将测量数据转换为可操作的事件。只有最有价值的信息才应越过节点连接到云，以供预测或历史处理。在整个信号链中，都可以根据初始的可接受性限制来抑制或过滤数据。理想情况下，传感器节点应仅发送绝对必要的信息，并且应在获得关键数据后尽快制定关键决策。                                       边缘节点必须通过有线或无线传感器节点(WSN)连接到外部网络。在信号链的这一部分中，数据完整性仍然十分关键。如果通信不一致、丢失或损坏，则优化检测和测量数据几乎没有价值。通信期间数据丢失是不可接受的。存在电气噪声的工业环境可能十分恶劣和艰苦，尤其是在存在大量金属物体情况下进行射频通信时。因此，必须在系统架构设计期间预先设计鲁棒的通信协议。\r\n\r\nULP系统的功率管理以选择调节器元件来实现最大效率为起点。但是，由于边缘节点也可能以快速占空比唤醒和睡眠，因此还应考虑上电和掉电时间。外部触发器或唤醒命令能够帮助快速提醒边缘节点，使其开始检测和测量数据。                 数据安全性也是工业物联网系统必须考虑的一个问题。我们不仅需要确保边缘内的数据安全无虑，还必须确保其对网络网关的访问免受恶意攻击。决不允许仿冒边缘节点来获取网络访问以进行不法活动。\r\n\r\n智能始于边缘\r\n\r\n边缘处具有众多检测解决方案，这些解决方案可能不只是单个分立器件。边缘可能存在多种不同的无关数据采集。温度、声音、振动、压力、湿度、运动、污染物、音频和视频只是其中可检测的部分变量，这些数据会经过处理并通过网关发送至云，以进行进一步的历史和预测分析。\r\n\r\n毫不夸张地说，传感器就是工业物联网的支柱。但更准确的说法应该是，它们是获得洞察的中枢神经系统。边缘节点检测和测量技术是目标数据的“出生地”。如果在解决方案链的这一阶段如实地记录了不良或错误的数据，则云中再多的后期处理也无法挽回损失的价值。                任务关键型系统（如具有高风险结果的医疗保健和工厂停机监控系统）要求质量数据测量具有鲁棒的完整性。数据质量至关重要。误报或遗漏可能代价高昂，非常耗时，甚至可能威胁生命。代价巨大的错误最终会导致计划外的维护、劳动力使用效率低下，甚至不得不禁用整个物联网系统。智能始于边缘节点，而此处也适用那句老话：如果输入的是垃圾，那么输出的也一定是垃圾。                能够访问数据宝藏也就意味着需要承担重大的责任在没有边缘节点智能的传统信号链解决方案中，数据只是数据。非智能节点从不会帮助生成用于制定可行决策的智慧和知识。可能存在大量对系统目标性能没有影响的原始低质量数据。转换所有这些数据并将其发送至最终云存储目的地可能需要消耗大量的功率和带宽。\r\n\r\n相比之下，聪明的智能分区边缘节点检测和测量会将数据转换为可付诸行动的信息。智能节点可降低整体功耗，缩短延迟并减少带宽浪费。这使得具有较长延迟的反应型物联网可以转变成实时的预测型物联网模式。物联网仍然适用基本的模拟信号链电路设计理念。对于复杂的系统，通常需要拥有深厚的应用专业知识来解读已处理的数据。', '2017-03-27', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1066', 'Coco', 'Minecraft源码分析 - 刷怪逻辑', '生物大致划分为四种：攻击型，被动型，水生型（也就是鱿鱼）和环境型（也就是蝙蝠）。攻击型生物每一个Tick（1/20秒）有一次的生成周期。被动型和水生型生物只有每400刻（20秒）一次的生成周期。因为这一点，攻击型生物可以在任何时候生成，而动物生成则非常少。另外，大部分动物在建立世界时产生的Block中生成。\r\n生物的刷新范围通常是以玩家为中心的 15 * 15的Chunk，当有多个玩家的时候，所有玩家的附近都会刷新。当敌对怪物离玩家超过128个block的时候，就会立即把它刷掉。下图表述刷新逻辑和玩家距离的关系。怪物容量（可理解为人口）与适合生成的Chunk总数直接成比例。要计算容量的话，生成区域在每一方向上均扩展一个区块，所以有17*17 BChunk的大小，然后总的ChunkCount被代入到下式中：\r\n\r\n容量 = 常量* ChunkCount / 289\r\n每一种生物均具有自己的容量计算和公式中不同的常量值：\r\n\r\n攻击型 = 70\r\n被动型 = 10\r\n环境型（蝙蝠） = 15\r\n水生型 = 5\r\n\r\n在单人游戏的时候，ChunkCount 一直是289，但是在多人游戏中，每个chunk只被计算一次，所以玩家分得越开，怪物的容量也就越大。\r\n\r\n在 Spawn开始之前，首先进行一次 mob 容量检查，如果生物的数量超过了容量，那么这个种类的生物的生成就会跳过。MinecraftServer作为服务器，主要负责服务端的更新，里面可以包含多个WorldServer，WorldClent作为服务端，当玩家加入一个服务器的时候，就会创建一个在本地。SpawnerAnimals作为刷怪的工具类，主要用来处理刷怪逻辑。\r\n首先来看WorldServer的Tick。很清晰的逻辑，这里主要看一下findChunksForSpawning的实现。\r\n在单人游戏模式下，区块计数总为17*17=289，那么各种生物的容量也就是上面列出的数值。在多人游戏中，在多个玩家范围内的区块只被计算一次，所以玩家越分散，更多地区块会被覆盖且会有更高的生物容量。\r\n\r\n在每次生成周期的开始都会检查一次容量。如果存活的生物数量超过它的容量，整个生成周期就会被跳过。\r\n\r\n\r\n在每一生成周期中，会在每一个合适的区块中进行一次生成一组生物的尝试。该区块内选择一个随机地点作为这组生物的中心点。为生成这组生物，中心方块对水生生物而言必须是水方块，对所有其它生物来说则必须是空气方块。注意在后面的情形中，它一定得是空气方块。任何其它方块，哪怕是一个透明方块都会阻止整组生物的生成。', '2017-05-03', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1067', 'Jenny', '二维码的功能、特点及使用Java生成带logo的二维码', '二维条码/二维码（2-dimensional bar code）是用某种特定的几何图形按一定规律在平面（二维方向上）分布的黑白相间的图形记录数据符号信息的；在代码编制上巧妙地利用构成计算机内部逻辑基础的“0”、“1”比特流的概念，使用若干个与二进制相对应的几何形体来表示文字数值信息，通过图象输入设备或光电扫描设备自动识读以实现信息自动处理：它具有条码技术的一些共性：每种码制有其特定的字符集；每个字符占有一定的宽度；具有一定的校验功能等。同时还具有对不同行的信息自动识别功能、及处理图形旋转变化点。二维码主要特点\r\n    二维条码是一种高密度、高信息含量的便携式数据文件，是实现证件及卡片等大容量、高可靠性信息自动存储、携带并可用机器自动识读的理想手段。二维条码具有如下特点：\r\n1、信息容量大根据不同的条空比例每平方英寸可以容纳250到1100个字符。在国际标准的证卡有效面积上（相当于信用卡面积的2/3，约500个汉字信息。这种二维条码比普通条码信息容量高几十倍，也高于磁卡。\r\n2、编码范围广二维条码可以将照片、指纹、掌纹、签字、声音、文字等凡可数字化的信息进行编码。\r\n3、保密、防伪性能好二维条码具有信息不可改写等多重防伪特性，它可以采用密码防伪、软件加密及利用所包含的信息如指纹、照片等进行防伪，因此具有较强的保密防伪性能。\r\n4、译码可靠性高普通条码的译码错误率约为百分之二左右，而二维条码的误码率不超过千万分之一，译码可靠性极高。\r\n5、修正错误能力强二维条码采用了世界上最先进的数字纠错理论，如果破损面积不超过50%，条码由于沾污、破损等所丢失的信息，可以照常被破译出。\r\n6、容易制作且成本很低利用现有的点阵、激光、喷墨、热敏/热转印、制卡机等打印技术，即可在纸张、卡片、PVC、甚至金属表面上印出二维条码。由此所增加的费用仅是油墨的成本。\r\n7、条码符号的形状可变同样的信息量，二维条码形状可以根据载体面积及美工设计等进行自我调整。QRcode\r\n    QR(Quick-Response) code是被广泛使用的一种二维码，解码速度快。它可以存储多用类型。如下图时一个qrcode的基本结构，其中：\r\nI.测图形、位置探测图形分隔符、定位图形：用于对二维码的定位，对每个QR码来说，位置都是固定存在的，只是大小规格会有所差异；\r\nII.校正图形：规格确定，校正图形的数量和位置也就确定了；\r\nIII.格式信息：表示改二维码的纠错级别，分为L、M、Q、H；\r\nIV.版本信息：即二维码的规格，QR码符号共有40种规格的矩阵（一般为黑白色），从21x21（版本1），到177x177（版本40），每一版本符号比前一版本 每边增加4个模块。\r\nV. 数据和纠错码字：实际保存的二维码信息，和纠错码字（用于修正二维码损坏带来的错误）。', '2017-04-17', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1068', 'Max', '系统限流实践 - 应用限流', '应用级限流\r\n\r\n针对容器限制总并发/连接/请求数\r\n\r\n通过对容器进行配置，限制TPS/QPS阀值，防止大量请求涌入击垮系统。\r\n\r\n如果你使用过Tomcat，其Connector 其中一种配置有如下几个参数： \r\nacceptCount：如果Tomcat的线程都忙于响应，新来的连接会进入队列排队，如果超出排队大小，则拒绝连接； \r\nmaxConnections：瞬时最大连接数，超出的会排队等待； \r\nmaxThreads：Tomcat能启动用来处理请求的最大线程数，如果请求处理量一直远远大于最大线程数则可能会僵死 \r\n详细的配置请参考官方文档。另外如MySQL（如max_connections）、Redis（如tcp-backlog）都会有类似的限制连接数的配置。程序通过requestCount把并发数量控制在10，当有50个线程并发去访问时，就会出现有得线程能竞争资源成功，有的线程竞争资源失败 \r\n这种并发控制方式比较简单粗暴，没有平滑处理，应用的时候要根据场景使用\r\n\r\n针对时间窗口进行并发控制\r\n\r\n限制住一个窗口时间内接口的请求量，例如某个基础服务调用量很大，怕被突然的大流量打挂，下面是一种实现窗口时间并发控制的方法 \r\n我们使用Guava的Cache来存储计数器，利用秒数作为Key，Value代表这一秒有多少个请求，这样就限制了一秒内的并发数。另外过期时间设置为两秒，保证一秒内的数据是存在的。平滑限流接口请求数\r\n\r\n之前的限流方式都不能很好地应对突发请求，即瞬间请求可能都被允许从而导致一些问题；因此在一些场景中需要对突发请求进行整形，整形为平均速率请求处理（比如5r/s，则每隔200毫秒处理一个请求，平滑了速率）。 \r\n这个时候有两种算法满足我们的场景：令牌桶和漏桶算法。Guava框架提供了令牌桶算法实现，可直接拿来使用。没有获取到令牌的请求将会被拒绝，这里可以添加一些额外的处理，例如增加异步操作，把处理不过来的请求加入队列，待处理完之后发消息通知用户处理结果。总结\r\n\r\n上面的是应用层的限流策略，有基于Atomic的请求数限流，有基于GuavaCache的针对时间窗口请求数限流，也有基于令牌桶的平滑限流。Atomic和GuavaCache这两种方法比较粗粒度，简单的场景下可以使用。 \r\n令牌桶的方法比较细粒度，使用上更灵活，适合复杂一点的场景。 ', '2017-04-22', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1069', 'Kenny', '数字图像处理，一维信号小波阈值去噪的C++实现', '所谓阈值去噪简而言之就是对信号进行分解，然后对分解后的系数进行阈值处理，最后重构得到去噪信号。该算法其主要理论依据是：小波变换具有很强的去数据相关性,它能够使信号的能量在小波域集中在一些大的小波系数中;而噪声的能量却分布于整个小波域内.因此,经小波分解后,信号的小波系数幅值要大于噪声的系数幅值.可以认为,幅值比较大的小波系数一般以信号为主，而幅值比较小的系数在很大程度上是噪声.于是,采用阈值的办法可以把信号系数保留,而使大部分噪声系数减小至零.小波阈值收缩法去噪的具体处理过程为:将含噪信号在各尺度上进行小波分解,设定一个阈值，幅值低于该阈值的小波系数置为0,高于该阈值的小波系数或者完全保留,或者做相应的“收缩(shrinkage)”处理.最后将处理后获得的小波系数用逆小波变换进行重构,得到去噪后的信号。值得注意的是：\r\n1) 硬阈值函数在阈值点是不连续的，在下图中已经用黑线标出。不连续会带来振铃，伪吉布斯效应等。\r\n2) 软阈值函数，原系数和分解得到的小波系数总存在着恒定的偏差,这将影响重构的精度\r\n同时这两种函数不能表达出分解后系数的能量分布，半阈值函数是一种简单而经典的改进方案。3，阈值的确定\r\n选取的阈值最好刚好大于噪声的最大水平，可以证明的是噪声的最大限度以非常高的概率低于（此阈值是Donoho提出的），其中根号右边的这个参数（叫做sigma）就是估计出来的噪声标准偏差（根据第一级分解出的小波细节系数，即整个det1绝对值系数中间位置的值），本文将用此阈值去处理各尺度上的细节系数，注意所谓全局阈值就是近似系数不做任何阈值处理外，其他均阈值处理。\r\n\r\n最后吐槽一下这个“绝对值系数中间位置的值”\r\n1）如果det1的长度为偶数那么，这个“中值”便是中间位置的两个数之和的平均值，比如【2,2,3,5】，中值即是2.5而不是3\r\n2）如果det1的长度为奇数那么，这个中值就是中间位置的那个数，比如【2,3,5】，中值即3。', '2017-04-30', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1070', 'Aaron', 'Hadoop2.5.0线上mapreduce任务执行map任务划分的一次问题解决', '近日在线上发现有些mapreduce作业的执行时间很长，我们需要解决这个问题。输入文件的大小是5G，采用了lzo压缩，整个集群的默认block大小是128M。本文将详细描述这次线上问题的排查过程。根据以上现象分析，我们知道耗时主要发生在map任务执行的阶段。我们首先查看下这个map任务的输入内容，看到它的大小为5GB且使用lzo压缩：如此大的输入仅仅在一个map任务中处理显然是进度缓慢的主要原因，我们需要对mapreduce的任务划分进行干预。我们查看下mapreduce任务的InputFormat，以便确定干预的手段，我们看到甚至在脚本中还配置了mapreduce.job.maps，根据《Hadoop2.6.0的FileInputFormat的任务切分原理分析（即如何控制FileInputFormat的map任务数量）》一文的分析，我们知道此参数实际不会对map任务划分产生任何影响。查看到mapreduce作业的input format是TextInputFormat，TextInputFormat的实现见代码清单1。我们看到TextInputFormat继承了FileInputFormat，因而根据《Hadoop2.6.0的FileInputFormat的任务切分原理分析（即如何控制FileInputFormat的map任务数量）》一文的内容，真正影响使用FileInputFormat的map任务划分的参数有：\r\n\r\ndfs.blockSize\r\nmapreduce.input.fileinputformat.split.minsize\r\nmapreduce.input.fileinputformat.split.maxsize\r\n我们首先来看看dfs.blockSize的大小，由于参数使用了Hadoop集群的默认配置，可以看到blockSize的大小是128M，我们不太可能为了一个mapreduce任务去更改整个Hadoop集群的配置，所以我们的重点讲放在后两个参数上。按照《Hadoop2.6.0的FileInputFormat的任务切分原理分析（即如何控制FileInputFormat的map任务数量）》一文的分析，我对mapreduce.input.fileinputformat.split.minsize和mapreduce.input.fileinputformat.split.maxsize的大小进行了各种尝试，但在运行的过程中发现map任务数量依然只有一个。难道我之前文章的内容分析的有问题？我一度陷入困境。\r\n	我休息了一会，重新查看代码清单1，发现TextInputFormat的isSplitable方法。isSplitable方法用于判断TextInputFormat是否可以进行map任务划分。由于输入文件是经过sqoop从关系型数据库抽取的，采用了lzo进行压缩，而Hadoop默认不支持压缩算法lzo，需要单独安装hadoop-lzo，查看Hadoop集群配置，发现我们之前已经做好了这方面的工作。这说明TextInputFormat的isSplitable方法在从压缩算法工厂类CompressionCodecFactory中获取到的CompressionCodec不为null，那么TextInputFormat是否支持map任务划分就取决于com.hadoop.compression.lzo.LzoCodec是否实现了SplittableCompressionCodec接口。', '2017-04-26', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1071', 'Peter', ' HTML5使用 JavaScript File API 实现文件上传', '简介： File API 是 Mozilla 向 W3C 提出的一个草案，旨在用标准 JavaScript API 实现本地文件的读取。File API 将极大地方便 Web 端的文件上传等操作，并有望成为未来的 HTML 5 规范的一部分。本文将介绍 File API 的概况，并用两个实例展示 File API 的应用。概述\r\n以往对于基于浏览器的应用而言，访问本地文件都是一件头疼的事情。虽然伴随着 Web 2.0 应用技术的不断发展，JavaScript 正在扮演越来越重要的角色，但是出于安全性的考虑，JavaScript 一直是无法访问本地文件的。于是，为了在浏览器中能够实现诸如拖拽并上传本地文件这样的功能，我们就不得不求助于特定浏览器所提供的各种技术了。比如对于 IE，我们需要通过 ActiveX 控件来获取对本地文件的访问能力，而对于 Firefox，同样也要借助插件开发。由于不同浏览器的技术实现不尽相同，为了让程序能够支持多浏览器，我们的程序就会变得十分复杂而难于维护。不过现在，这一切都因为 File API 的出现而得到了彻底的改变。\r\nFile API 是 Mozilla 向 W3C 提交的一个草案，旨在推出一套标准的 JavaScript API，其基本功能是实现用 JavaScript 对本地文件进行操作。出于安全性的考虑，该 API 只对本地文件提供有限的访问。有了它，我们就可以很轻松的用纯 JavaScript 来实现本地文件的读取和上传了。目前，FireFox 3.6 是最先支持这一功能的浏览器。除此以外，最新版本的 Google Chrome 浏览器和 Safari 浏览器也有相应的支持。File API 有望成为 W3C 目前正在制定的未来 HTML 5 规范当中的一部分。\r\n本文后续章节将对 File API 做一个基本的介绍。并为读者演示：如何利用 File API 实现基于 file input 控件的本地文件读取与上传；以及利用拖拽实现从用户系统批量上传文件的功能。通过本文，读者可以了解最新的 File API 的概况以及使用，从而为构建具有更好用户体验的 Web 2.0 应用提供参考。File API 概览\r\nFile API 由一组 JavaScript 对象以及事件构成。赋予开发人员操作在 <input type=”file” … /> 文件选择控件中选定文件的能力。图 1 展示了 File API 所有的 JavaScript 的组合关系。类型 FileList 包含一组 File 对象。通常 FileList 对象可以从表单中的文件域（<input type=”file” .../>）中拿取。Blob 对象代表浏览器所能读取的一组原始二进制流。Blob 对象中，属性 size 表示流的大小。函数 slice() 可以将一个长的 Blob 对象分割成小块。File 对象继承自 Blob 对象，在 Blob 对象基础上增加了和 File 相关的属性。其中，属性 name 表示文件的名字，这个名字去掉了文件的路径信息，而只保留了文件名。属性 type 表示文件的 MIME 类型。属性 urn 则代表这个文件的 URN 信息。为完成文件读取的操作，一个 FileReader 对象实例会关联 File 或 Blob 对象，并提供三种不同的文件读取函数以及 6 种事件。', '2017-03-06', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1072', 'Amma', 'PHP进程及进程间通信', '进程是一个具有独立功能的程序关于某个数据集合的一次运行活动。换句话说就是，在系统调度多个cpu的时候，一个程序的基本单元。进程对于大多数的语言都不是一个陌生的概念，作为”世界上最好的语言PHP”当然也例外。进程间通信（IPC）\r\n\r\n通常linux中的进程通信方式有：消息队列、信号量、共享内存、信号、管道、socket。\r\n\r\n1.消息队列\r\n\r\n消息队列是存放在内存中的一个队列。如下代码将创建3个生产者子进程，2个消费者子进程。这5个进程将通过消息队列通信。由于消息队列去数据是，只有一个进程能去到，所以不需要额外的锁或信号量。\r\n\r\n2. 信号量与共享内存\r\n\r\n信号量：是系统提供的一种原子操作，一个信号量，同时只有你个进程能操作。一个进程获得了某个信号量，就必须被该进程释放掉。\r\n\r\n共享内存：是系统在内存中开辟的一块公共的内存区域，任何一个进程都可以访问，在同一时刻，可以有多个进程访问该区域，为了保证数据的一致性，需要对该内存区域加锁或信号量。', '2017-05-15', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1073', 'Lucy', 'Android微信自动回复功能', 'AccessibilityService是Android系统框架提供给安装在设备上应用的一个可选的导航反馈特性。AccessibilityService 可以替代应用与用户交流反馈，比如将文本转化为语音提示，或是用户的手指悬停在屏幕上一个较重要的区域时的触摸反馈等。打开你手机的设置–辅助功能中，有很多APP提供的服务，他们都是基于AccessibilityService编写的，AccessibilityService可以侦听你的点击，长按，手势，通知栏的变化等。并且你可以通过很多种方式找到窗体中的EditText，Button等组件，去填充他们，去点击他们来帮你实现自动化的功能。\r\n\r\n像360助手的自动安装功能，它就是侦听着系统安装的APP，然后找到“安装”按钮，实现了自动点击。微信自动抢红包功能，实现方式都是如此。\r\n\r\n配置AccessibilityService\r\n\r\n首先我们在res文件夹下创建xml文件夹，然后创建一个名为auto_reply_service_config的文件，一会我们会在清单文件中引用它。这个文件表示我们对AccessibilityService服务未来侦听的行为做了一些配置，比如 typeNotificationStateChanged 和 typeWindowStateChanged 表示我们需要侦听通知栏的状态变化和窗体状态改变。 \r\nandroid:packageNames=”com.tencent.mm” 这是微信的包名，表示我们只关心微信这一个应用。\r\n\r\n代码不打算带着大家一行一行看了，如果有不明白的，去看看文档，或者下面回复我，我给大家解答~\r\n\r\n创建AccessibilityService                  代码没有给大家详细讲解，不过看注释应该可以看懂个大概。当微信程序切换到后台，或者锁屏（无锁屏密码）时，只要有通知出现，都可以实现自动回复。\r\n\r\n关于AccessibilityService可以监控的行为非常多，所以我觉得可以实现各种各样炫酷的功能，不过我并不建议你打开某些流氓软件的AccessibilityService服务，因为很有可能造成一些安全问题，所以，自己动手写就安全多了嘛。', '2017-04-24', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1074', 'Sam', 'Android R.java类的手动生成', '在Android项目中的res目录中包含了项目使用的各种资源，这些资源全部都分布在res目录下的各个子目录中。每个资源都有两个属性，一个是资源的名字，一个是资源的类型。此外，res目录下的资源在编译后都会有一个对应的id。\r\n\r\nR.Java类（以下简称R类）是Android中一个非常重要的类，其中定义了res目录中全部资源的id。在代码中通过R类获取到资源的id后，即可调用Android API来获取和使用对应的资源。R类的生成\r\n\r\nR类并不包含在项目代码中，而是由Android SDK在编译阶段通过aapt工具生成的。一般情况下，开发者不需要关注R类的生成，直接在代码中使用即可。然而在某些情况下需要由开发者手动生成R类，并放到项目代码中。\r\n\r\n为什么需要手动生成R.java类\r\n\r\nAndroid library\r\n\r\nAndroid 项目根据用途的不同分为app项目和library项目。app项目用来生成可以在Android系统上运行的apk程序，提交到应用市场给用户使用。而library项目并不会生成apk，而是生成一个sdk，提供给其他开发者使用。\r\n\r\n对library项目来说，如果library工程中包含了资源，如layout，drawable，string，dimen等，那么需要将这些资源文件和编译后的代码一起放到sdk中。对Eclipse library工程，是将整个res目录原样放到sdk中。对Android Studio的library工程，会将整个res目录打包到aar文件中。\r\n\r\nAndroid library工程中的R类\r\n\r\n对包含资源的library工程来说，和app工程一样，需要在代码中通过资源id来获取对应的资源。同样可以在library工程代码中通过library工程包名下的R类来获取对应资源的id。但是library工程中的R类并不会包含在library工程编译后的jar包或arr包中，也就是说，library工程开发完成后，提供给其他开发者的sdk中并没有包含这个R类。这个R类同样是在app工程编译时生成的。那么app工程在编译时是如何知道需要生成library工程包名下的R类呢？\r\n\r\n一个app工程可以包含多个library工程（在Android Studio中称为module）。当一个app工程在编译时，会遍历其所引用的所有library工程，生成各个library工程对应的R.java类。这里会用到每个library sdk中提供的另外一个文件AndroidManifest.xml。在library工程的AndroidManifest.xml文件中包含了各个library工程的包名称，通过这个文件就可以知道各个library工程的包名，从而生成各个library工程包名下的R类。\r\n\r\n例如，一个被引用的library工程中的AndroidManifest.xml文件中配置的package=”com.cclink.mylib”，则app工程在编译时会为该library工程生成一个com.cclink.mylib.R的类。\r\n\r\n最后app工程中全部java代码，app工程的R类，所有library工程的R.java类，都会被编译，并和所有library工程的jar包合并到一起，然后再转换成dex文件。', '2017-04-20', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1075', 'Vivi', '由浅入深 细细体会Android的视图滚动', '其实对于接触过Android开发的人来说，视图的滑动并不陌生，因为这一功能特性可以说是随处可见。 \r\n常用的就例如ScrollView、HorizontalScrollView、ListView，还有熟悉的ViewPager等控件，就都支持这一特性。\r\n\r\n之所以这一类的控件在Android系统中如此受欢迎，其实也不难想象，最显而易见的： \r\n手机的屏幕（可视区域）是十分有限的，那么如何在有限的区域内提供给用户“无限”的内容，也就是促使滑动视图诞生的根本原因。\r\n\r\n今天就来总结一些对于接触到Android的视图滑动相关的知识的一些理解，以便加深印象。其实在Android中让视图滑动的实现方式有很多种，例如在《Android群英传》一书中，就总结了足足7种方式：\r\n\r\n通过View的layout()方法让View滑动。\r\n通过调用View类的offsetLeftAndRight、offsetTopAndBottom让View滑动。\r\n通过设置LayoutParams让View滑动。\r\n通过scrollTo与scrollBy让View滑动。\r\n通过Scroller类来让View滑动。\r\n通过属性动画来让View进行滑动。\r\n终极神器ViewDragHelper。\r\n我们这里不对每种方式都依次进行尝试，因为万变不离其宗。所以我们的重点放在理解让视图进行滑动的原理上。\r\n\r\n最初接触到Android开发的时候，自己对ViewPager这个控件十分感兴趣，因为很多主流的APP的主界面上都采用了这种效果。 \r\n那么，我们何不就通过模仿一个十分简单的类似ViewPager的效果的自定义控件，来了解视图滑动的原理呢？scrollTo和scrollBy\r\n\r\n如果不去查阅任何的相关资料，自己去研究如何实现让视图滑动。那么肯定看着最亲切的就是它们两兄弟了。 \r\n毕竟名字里就已经带着扎眼的“scroll”，而它们确实能够让View实现移动的效果。\r\n\r\n其实初初接触之下，肯定都觉得这两个方法的使用还是十分简单明了的。 \r\n这样说也没错，但其实关于它们也还是有不少值得我们了解的细节的。\r\n\r\n我们说scrollTo和scrollBy方法实际上都是实现让View的位置发生改变，这两个方法都接受两个int型的变量（x和y）。 \r\n而且就和它们的方法名的定义一样，它们的区别也很明显，就在于：\r\n\r\nscrollTo是代表View将会移动到坐标点(x,y)的位置。\r\nscrollBy是代表此次View在x轴，和y轴上移动的增量为x和y。其实我们通过该方法的源码以及代码注释发现，我们之前理解的没有错，该方法的目的就是： \r\n设置位移目的地的坐标，然后则会调用onScrollChanged方法，从而通知View重绘。 \r\n虽然该方法的功能性很明确，但注意一下，我们发现出现了两个成员变量”mScrollX”与 “mScrollX”，事实上也正是这两个变量控制着View的位移。', '2017-04-08', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1076', 'Susan', 'Volley使用', 'Volley使用:Volley是Android平台上的网络通信库，能使网络通信更快、更简单、更健壮\r\nVolley使用了典型的模板回调机制\r\n\r\n实现Get，Post请求,上传json字符串,Volley的图片下载\r\n RequestQueue :管理全局请求的单例，最好全局只有一个\r\n StringRequest :文本的请求，下载字符串的时候需要创建的对象\r\n Response.Lisenter:正确的结果回调\r\n Response.ErrorLisenter:错误的结果回调\r\n\r\n Get请求：3步骤\r\n * 1.创建RequestQueue\r\n * 2.创建相应的文本请求对象\r\n * 3.将请求的文本对象加入到队列中，然后结果在参数中一接口回调到方式返回回来。此处的错误:1.未加网络权限\r\n                     2.new Error的方法写错\r\nPost请求：3步骤\r\n * 1.创建RequestQueue\r\n * 2.创建相应的文本请求对象，设置post请求方式，复写getParams()(唯一的不同点)\r\n * 3.将请求的文本对象加入到队列中，然后结果在参数中一接口回调到方式返回回来。上传json字符串\r\n* JSONObjectRequest-----JOSNObject\r\n * 1.创建RequestQueue\r\n * 2.创建相应的JSONObjectRequest\r\n * 3.将请求的JSONObjectRequest加入到队列中，然后结果在参数中一接口回调到方式返回回来\r\n * JSONArrayObjectRequest。Volley的图片下载\r\n * ImageRequest:图片下载的请求\r\n * ImageLoader:图片下载请求,可以让你扩张内存缓存\r\n * NetworkImageView:view里面的自定义控件,将工具内置到空间里面,直接使用方法进行图片的下载\r\n\r\n *InageRequest的使用步骤:\r\n * 1.创建请求队列\r\n * 2.创建图片的下载请求ImageRequest对象;\r\n * 3.将创建的对象添加的队列中\r\n\r\n    //2.图片请求的六个参数：\r\n        //1.图片请求网址2.图片下载成功的回调3.图片下载最大宽度4，图片下载最大高度（当下载当图片超过\r\n        // 你所设定的值的时候，会去压缩到你指定到值）\r\n        //5.图片到格式或者参数：RGB_8888每个像素点占4个字节 RGB_565每个像素点占2个字节\r\n        //6.错误图片下载的回调。ImageLoader使用步骤：3步(\r\n   为啥要有他:实现vollay提供的接口,借助LruCache做内存缓存\r\n              vollay本身只提供磁盘缓存)\r\n * 1.创建一个ImageLoader对象（queue,new ImageCache）\r\n * 2.创建一个（ImageLoader得到的）listener监听图片下载的过程，设置一些下载过程中的参数（下载预设图片，下在失败或者错误的图片）\r\n * 3.将创建的loader对象调用下载图片的方法，同时将lisenter参数传进去。', '2017-03-16', null, null, null, null, '0', null);
INSERT INTO `xz_news` VALUES ('1077', '王大明白', '王大明白', '王大明白王大明白王大明白王大明白王大明白王大明白王大明白王大明白王大明白王大明白王大明白山东科技孵化我空间', '1994-05-27', null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for xz_order_record
-- ----------------------------
DROP TABLE IF EXISTS `xz_order_record`;
CREATE TABLE `xz_order_record` (
  `order_id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `appid` varchar(50) DEFAULT NULL COMMENT '平台ID',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户号',
  `nonce_str` varchar(50) DEFAULT NULL COMMENT '随机字符串',
  `sign` varchar(50) DEFAULT NULL COMMENT '签名',
  `result_code` varchar(50) DEFAULT NULL COMMENT '业务结果',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `trade_state` varchar(50) DEFAULT NULL COMMENT '交易状态',
  `cash_fee` varchar(50) DEFAULT NULL COMMENT '支付金额',
  `record_time` datetime DEFAULT NULL COMMENT '记录时间',
  `delete_order_date` date DEFAULT NULL COMMENT '删除日期',
  `delete_falt` int(2) DEFAULT '0' COMMENT '删除类型',
  `filed1` varchar(50) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(50) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(50) DEFAULT NULL COMMENT '备用列3',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_order_record
-- ----------------------------
INSERT INTO `xz_order_record` VALUES ('1', 'wx3fde7f58c03d3ab4', '1469476002', '6XuAavifelQ4G4JZ', '5EB7EBD566C91F147B005C6B0D9ECFA4', 'SUCCESS', '21496394418997259908716', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('2', 'wx3fde7f58c03d3ab4', '1469476002', 'w7Rw1bP5qkK1pKYB', '5CA06C3480258E5DEB95E443822129DD', 'SUCCESS', '21496394964417196978791', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('3', 'wx3fde7f58c03d3ab4', '1469476002', 'kzSW7JkJdKUK3f7T', '5ABE25D3E1298DACECC2D6D5D8E4C249', 'SUCCESS', '21496395842030473284520', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('4', 'wx3fde7f58c03d3ab4', '1469476002', '1zvw8Jn3P8aQykL3', 'F31B89650E694F261CFDDE7FD39A0FFE', 'SUCCESS', '214963969441061344037419', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('5', 'wx3fde7f58c03d3ab4', '1469476002', 'WjkNu8ysTvqK1rDW', '9CF80D354AB71B9273C308B362426E6F', 'SUCCESS', '21496397531487203660032', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('6', 'wx3fde7f58c03d3ab4', '1469476002', 'IQgXFkiYcfUPdfFR', '58D59E12BAC240FE28D0C63E4BBC2C9A', 'SUCCESS', '21496398268904434917468', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('7', 'wx3fde7f58c03d3ab4', '1469476002', 'GUQdHgBd9uxiUdiQ', 'FD702D148272A21F83C124A2BF1FB86C', 'SUCCESS', '21496398440049449483082', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('8', 'wx3fde7f58c03d3ab4', '1469476002', '7y7qv58l6PXjkUmN', '40D8054DCF464BCCA571E6C080F0C90F', 'SUCCESS', '21496399069898838339188', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('9', 'wx3fde7f58c03d3ab4', '1469476002', '1Hlkkpi1uwxBJGKW', 'C6F62DE7872D4AD15C9C4655CBD79363', 'SUCCESS', '214963994096661165053913', 'SUCCESS', '1', '2017-06-02 18:30:30', null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('10', 'wx3fde7f58c03d3ab4', '1469476002', 'P1drI5rEV6SoKDYl', 'E3E7802D389AE6AD77A5EE1D5DF8268A', 'SUCCESS', '214963994729171273990234', 'SUCCESS', '1', '2017-06-02 18:31:35', null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('11', 'wx3fde7f58c03d3ab4', '1469476002', 'Cz37SrSOwlfVONXC', '2D8B0437D8C29F7DD34E0AEAA2CDE809', 'SUCCESS', '21496653107792186628547', 'SUCCESS', '1', '2017-06-05 16:59:01', null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('12', 'wx3fde7f58c03d3ab4', '1469476002', 'mbdumXxtrrFhmEAk', '99050F2E2349BAC8BA0433548C3CC181', 'SUCCESS', '21496653491336867923833', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('13', 'wx3fde7f58c03d3ab4', '1469476002', 'PWFPCw51MLvF47jB', '26B81202DCF020002DF8680FFA0EA0AA', 'SUCCESS', '21496653776329573237669', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('14', 'wx3fde7f58c03d3ab4', '1469476002', 'ALOXTQs92ngIdoDd', '7573C756F8EE67CD3FCBC3F022A00CAB', 'SUCCESS', '21496654520866879290437', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('15', 'wx3fde7f58c03d3ab4', '1469476002', 'roA3nmHib8v3nL4Z', 'FE7C5229C738964E3048DE9C9CC4FC2C', 'SUCCESS', '214966545230141169853922', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('16', 'wx3fde7f58c03d3ab4', '1469476002', 'XAulVTvPnsqqgbIC', '03E3F8E283CE342BCB51C087C3CE2995', 'SUCCESS', '214966547215491111356967', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('17', 'wx3fde7f58c03d3ab4', '1469476002', 'lCig3qAlHZHu0ZV5', 'FF012A46B8986156739810037CA379FA', 'SUCCESS', '21496713538774488025778', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('18', 'wx3fde7f58c03d3ab4', '1469476002', 'fVPxLzvJ4X9B5CVS', '8C58B3A7BAC50C891767872ED047F37E', 'SUCCESS', '21496731788685451469700', 'SUCCESS', '1', '2017-06-06 14:50:21', null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('19', 'wx3fde7f58c03d3ab4', '1469476002', '1mPywueGnpEzS7E3', 'D6A97B67402C82BAB48638E6D7A4CCA7', 'SUCCESS', '214967323291301343006760', 'SUCCESS', '1', '2017-06-06 14:59:18', null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('20', 'wx3fde7f58c03d3ab4', '1469476002', 'L45SFr8SluexT1iJ', '998D724BBA84BAEA0537349075C7DDAE', 'SUCCESS', '21496734596152385659916', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('21', 'wx3fde7f58c03d3ab4', '1469476002', 'YNL4UaIXzroZUIw8', 'FA4F9B4B954B169A74EF8B3A94F6FB2A', 'SUCCESS', '21496734906434157557205', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('22', 'wx3fde7f58c03d3ab4', '1469476002', 'wTNEo9uyFhoIvsJE', '82B07291594A9A8AF1724052DA779836', 'SUCCESS', '214967379495461195123943', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('23', 'wx3fde7f58c03d3ab4', '1469476002', 'ci30AdHbKzpCcYGN', '08AD864B5A8730719D4775E02C2C9567', 'SUCCESS', '21496740883276514458857', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('24', 'wx3fde7f58c03d3ab4', '1469476002', 'Ihj5MF5l7lonD0wu', 'EBD0D767F29F4BCD6041A14F5423CFEE', 'SUCCESS', '21496741250019232512344', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('25', 'wx3fde7f58c03d3ab4', '1469476002', 'HRYwwm1b3APDXmLl', 'D72F20A8010F921132D225BD34FC69FD', 'SUCCESS', '21496741419054647115590', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('26', 'wx3fde7f58c03d3ab4', '1469476002', 'ac9lY4f7FBjanqdr', '5F9A99F5B31AB4236FACF78403BBD766', 'SUCCESS', '214967985955471026423587', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('27', 'wx3fde7f58c03d3ab4', '1469476002', '3xdaSu8KbGBTdfhU', '7520FBDD7FB3A121ADBA872638D56595', 'SUCCESS', '214967986805931049358990', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('28', 'wx3fde7f58c03d3ab4', '1469476002', 'miuOhZcTo7sSN7XP', '0C85FAAD72B507E629F2968EEF2F29FF', 'SUCCESS', '21497420644254519679747', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('29', 'wx3fde7f58c03d3ab4', '1469476002', 'Bvhw8o8w9ZwdFypj', '16D237AF5A7654876BEA458837DF4E79', 'SUCCESS', '21497420663055240057002', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('30', 'wx3fde7f58c03d3ab4', '1469476002', 'NlnCbEwI4FUgOREC', '1C39C6AD198C68ABF6BA088CD9F0037B', 'SUCCESS', '214974206658301332185132', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('31', 'wx3fde7f58c03d3ab4', '1469476002', 'JqWB8VOVt4tOtRSW', '11073FA33C09B414556433951059AFDD', 'SUCCESS', '21497423002144760956605', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('32', 'wx3fde7f58c03d3ab4', '1469476002', 'q0la0eGiQVoatPbq', '85DCFC92CA7F47222F524AADCBD703E7', 'SUCCESS', '21497423007839295068221', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('33', 'wx3fde7f58c03d3ab4', '1469476002', 'FH9EhhsXlXZSmOjp', 'E0851A805C58EBA28DD78F404454DD05', 'SUCCESS', '21497423177710151416262', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('34', 'wx3fde7f58c03d3ab4', '1469476002', 'yNtE65u21Luwafqz', 'B8710E5C5EF115F57596AEBFA4C44F0A', 'SUCCESS', '21497423224072481313268', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('35', 'wx3fde7f58c03d3ab4', '1469476002', 'aiW97Cw8OqfvCefm', '2047E37AB08F53916848B9C227D791A5', 'SUCCESS', '21497423228627836235797', 'NOTPAY', null, null, null, '0', null, null, null);
INSERT INTO `xz_order_record` VALUES ('36', 'wx3fde7f58c03d3ab4', '1469476002', 'SSRPPi7hkGiazrfJ', 'DCC5B545758AEF09C0E2725F4694B7DB', 'SUCCESS', '214975797448461032614417', 'NOTPAY', null, null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for xz_project_experience
-- ----------------------------
DROP TABLE IF EXISTS `xz_project_experience`;
CREATE TABLE `xz_project_experience` (
  `project_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '项目经验表ID',
  `login_id` bigint(200) NOT NULL COMMENT '工作经验表ID',
  `project_name` varchar(20) DEFAULT NULL COMMENT '项目名称',
  `project_describe` varchar(200) DEFAULT NULL COMMENT '项目描述',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `job_duties` varchar(2000) DEFAULT NULL COMMENT '工作内容',
  `delete_project_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xz_project_experience
-- ----------------------------
INSERT INTO `xz_project_experience` VALUES ('1', '2', '先知平台', '哈哈哈', '2017-05-02', '2017-05-30', '哈哈哈', '2017-05-31', null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('2', '2', '哈哈哈', '呵呵呵', '2017-05-03', '2017-05-04', '嘿嘿嘿', null, null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('3', '8', '水电费收费[]-=+', '盛大富翁发的', '2017-05-31', '2017-06-14', '士大夫未取得', '2017-06-05', null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('4', '0', 'asd', 'asd', '2017-06-05', '2017-06-06', 'asd', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_project_experience` VALUES ('5', '12', '儿童', '他热热', '2017-06-07', '2017-06-30', '认为', null, null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('6', '16', '扫地', '扫地扫地我扫地', '2017-06-09', '2017-06-15', '扫地', null, null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('7', '11', 'a', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n啊啊啊', '2017-06-06', '2017-06-07', 'aaaaaaaaaaaaa', null, null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('8', '14', '全国天气啊', '啊啊不是', '2017-06-05', '2017-06-06', '啊嘎嘎', null, null, null, null, '0');
INSERT INTO `xz_project_experience` VALUES ('9', '19', '先知平台', '先知', '2017-05-31', '2017-06-28', '撒旦撒', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_recruit
-- ----------------------------
DROP TABLE IF EXISTS `xz_recruit`;
CREATE TABLE `xz_recruit` (
  `recruit_id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '招聘信息表ID',
  `company_id` bigint(225) DEFAULT NULL COMMENT '公司ID',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `job_name` varchar(50) DEFAULT NULL COMMENT '职业名称',
  `monthly_min` double(200,0) DEFAULT NULL COMMENT '最低月薪',
  `monthly_max` double(200,0) DEFAULT NULL COMMENT '最高月薪',
  `workplace` varchar(200) DEFAULT NULL COMMENT '工作地点',
  `work_experience` varchar(10) DEFAULT '0' COMMENT '工作经验 年份',
  `rec_number` varchar(10) DEFAULT NULL COMMENT '招聘人数',
  `job_nature` int(10) DEFAULT '1' COMMENT '工作性质 1全职 2兼职',
  `education` int(10) DEFAULT '4' COMMENT '学历要求 1专科 2本科 3研究生 4无学历要求',
  `treatment` varchar(200) DEFAULT NULL COMMENT '福利待遇',
  `obligation` varchar(200) DEFAULT NULL COMMENT '工作职责',
  `job_address` varchar(200) DEFAULT NULL COMMENT '工作地址',
  `release_date` date DEFAULT NULL COMMENT '发布日期',
  `profession` varchar(10) DEFAULT NULL COMMENT '职业类别(1开发2实施3测试4运维5其他)',
  `delete_recruit_date` date DEFAULT NULL COMMENT '删除日期',
  `field1` varchar(50) DEFAULT NULL COMMENT '备用列1',
  `field2` varchar(50) DEFAULT NULL COMMENT '备用列2',
  `field3` varchar(50) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型 0未删除 1删除',
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_recruit
-- ----------------------------
INSERT INTO `xz_recruit` VALUES ('1', '2', '先知蓝创', 'JAVAweb开发', '2000', '3000', '沈阳', '1-3年', '5-10人', '1', '2', '什么也没写', '什么也没写', '什么也没写', '2017-05-31', '开发', null, null, null, null, '0');
INSERT INTO `xz_recruit` VALUES ('2', '2', '先知蓝创', 'JAVA开发', '2000', '3000', '沈阳', '1-3年', '1-5人', '1', '2', '哈哈', '哈哈', '哈哈哈', '2017-05-31', '开发', null, null, null, null, '0');
INSERT INTO `xz_recruit` VALUES ('3', '2', '先知蓝创', '挖掘机', '500', '5000', '沈阳', '无限制', '1-5人', '1', '1', '啊啊', '啊啊', '啊啊', '2017-05-31', '挖掘机', null, null, null, null, '0');
INSERT INTO `xz_recruit` VALUES ('4', '5', '琅琊阁', 'java', '5000', '9000', '沈阳', '5年以上', '1-5人', '1', '4', '999', '999', '999', '2017-06-06', 'it', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_resume
-- ----------------------------
DROP TABLE IF EXISTS `xz_resume`;
CREATE TABLE `xz_resume` (
  `resume_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_member` bigint(200) NOT NULL COMMENT '用户编号',
  `resume_job` varchar(200) DEFAULT NULL COMMENT '期望职位',
  `resume_salary` bigint(11) DEFAULT NULL COMMENT '期望薪资',
  `resume_place` varchar(200) DEFAULT NULL COMMENT '期望工作地',
  `resume_year` varchar(11) DEFAULT NULL COMMENT '工作年限',
  `resume_state` varchar(200) DEFAULT NULL COMMENT '目前状态(准备跳槽/正在找工作)',
  `resume_introduce` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  `resume_type` varchar(20) DEFAULT '全职' COMMENT '职位类型(全职/兼职/实习/...)',
  `work_email` varchar(200) DEFAULT NULL COMMENT '工作邮箱',
  `live_address` varchar(200) DEFAULT NULL COMMENT '现居住地',
  `resume_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记(0未删除 1删除)',
  PRIMARY KEY (`resume_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_resume
-- ----------------------------
INSERT INTO `xz_resume` VALUES ('1', '1', 'JAVA开发', '2000', '沈阳', '小于1年', '找工作', '啥也没写 ', '兼职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('2', '4', 'JAVA开发', '5000', '沈阳市于洪区', '小于1年', '找工作', '四大皆空哈数据库和', '全职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('3', '7', '大数据', '10000', '啊啊', '无工作经验', '找工作', '恩恩', '全职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('4', '10', 'Oracle维护', '6000', '刷卡机', '1-2年', '找工作', '第三方', '全职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('5', '8', 'JAVA开发', '234', '成果汇报', '无工作经验', '找工作', '热', '全职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('6', '20', 'JAVA开发', '3000', '沈阳', '1-2年', '跳槽', '什么也没写', '全职', null, null, null, null, null, null, '0');
INSERT INTO `xz_resume` VALUES ('7', '2', 'JAVA开发', '3000', '沈阳', '无工作经验', '找工作', '什么都没写', '全职', null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_resume_send
-- ----------------------------
DROP TABLE IF EXISTS `xz_resume_send`;
CREATE TABLE `xz_resume_send` (
  `send_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` bigint(200) NOT NULL COMMENT '简历编号',
  `company_id` bigint(200) NOT NULL COMMENT '公司编号',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名',
  `recruit_id` bigint(200) DEFAULT NULL COMMENT '招聘信息表ID',
  `job_name` varchar(50) DEFAULT NULL COMMENT '职位名称',
  `send_date` date DEFAULT NULL COMMENT '投递日期',
  `state` int(10) DEFAULT '2' COMMENT '查看状态(1已查看 2未查看)',
  `delete_send_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_resume_send
-- ----------------------------
INSERT INTO `xz_resume_send` VALUES ('1', '1', '2', '先知蓝创', '1', 'JAVAweb开发', '2017-05-31', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('2', '2', '2', '先知蓝创', '1', 'JAVAweb开发', '2017-06-01', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('3', '2', '2', '先知蓝创', '2', 'JAVA开发', '2017-06-01', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('4', '3', '5', '琅琊阁', '4', 'java', '2017-06-06', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('5', '3', '2', '先知蓝创', '3', '挖掘机', '2017-06-06', '2', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('6', '3', '2', '先知蓝创', '1', 'JAVAweb开发', '2017-06-06', '2', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('7', '4', '5', '琅琊阁', '4', 'java', '2017-06-06', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('8', '4', '2', '先知蓝创', '3', '挖掘机', '2017-06-06', '2', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('9', '3', '2', '先知蓝创', '2', 'JAVA开发', '2017-06-06', '2', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('10', '2', '5', '琅琊阁', '4', 'java', '2017-06-06', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('11', '5', '5', '琅琊阁', '4', 'java', '2017-06-06', '1', null, null, null, null, '0');
INSERT INTO `xz_resume_send` VALUES ('12', '6', '2', '先知蓝创', '1', 'JAVAweb开发', '2017-06-06', '2', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_senior
-- ----------------------------
DROP TABLE IF EXISTS `xz_senior`;
CREATE TABLE `xz_senior` (
  `senior_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '资深用户ID',
  `member_id` bigint(200) DEFAULT NULL COMMENT '用户ID',
  `delete_senior_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '1' COMMENT '删除类型_0:删除_1:未删除',
  PRIMARY KEY (`senior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_senior
-- ----------------------------

-- ----------------------------
-- Table structure for xz_skill
-- ----------------------------
DROP TABLE IF EXISTS `xz_skill`;
CREATE TABLE `xz_skill` (
  `skill_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '技能表ID',
  `login_id` bigint(200) DEFAULT NULL COMMENT '登录表 ID',
  `skill_name` varchar(20) DEFAULT NULL COMMENT '技能名称',
  `skill_value` int(10) DEFAULT '0' COMMENT '技能值',
  `delete_skill_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(255) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(255) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(255) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(11) DEFAULT '0' COMMENT '删除类型',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_skill
-- ----------------------------
INSERT INTO `xz_skill` VALUES ('1', '2', 'Java', '58', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('2', '2', 'DBA', '55', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('3', '2', 'ORACLE', '90', '2017-06-08', null, null, null, '1');
INSERT INTO `xz_skill` VALUES ('4', '8', '水电费', '35', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('5', '12', '额无法提供', '39', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('6', '16', '扫地', '48', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('7', '11', '走砍', '100', '2017-06-06', null, null, null, '1');
INSERT INTO `xz_skill` VALUES ('8', '14', 'againn', '100', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('9', '11', 'a', '1', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('10', '19', '大声地说', '0', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('11', '2', 'ORACLE', '57', null, null, null, null, '0');
INSERT INTO `xz_skill` VALUES ('12', '2', 'asdasd', '31', '2017-06-09', null, null, null, '1');

-- ----------------------------
-- Table structure for xz_teacher
-- ----------------------------
DROP TABLE IF EXISTS `xz_teacher`;
CREATE TABLE `xz_teacher` (
  `teacher_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_name` varchar(200) DEFAULT NULL COMMENT '讲师姓名',
  `subject_id` varchar(200) DEFAULT NULL COMMENT '所授课程',
  `teacher_level` varchar(200) DEFAULT NULL COMMENT '讲师级别 总监级,金牌级,普通级等',
  `teacher_introduce` varchar(2000) DEFAULT NULL COMMENT '讲师简介',
  `teacher_image` bigint(11) DEFAULT NULL COMMENT '图片id',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记 0未删除 1删除',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_teacher
-- ----------------------------
INSERT INTO `xz_teacher` VALUES ('1001', 'Tom', 'JAVA', '讲师', '嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；10年以上嵌入式项目开发工程经验；嵌入式系统骨灰级专家人物;', '1', null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1002', 'Mary', '大前端', '教授', '熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；', '2', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1003', 'Jackson', '大数据', '讲师', '精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；10年以上项目开发工程经验；', '3', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1004', 'Kenny', '移动端', '副教授', '精通ASP.NET语言编程和数据库编程;有独立开发webApp能力与经验；嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；', '4', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1005', 'Mark', '大数据', '讲师', '精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；', '5', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1006', 'Kim', '大前端', '副教授', '嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；10年以上嵌入式项目开发工程经验；精通嵌入式PHP语言编程；', '6', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1007', 'Peter', 'JAVA', '副教授', '熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；掌握网页构建能力；', '7', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1008', 'Lisa', '大前端', '教授', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；', '8', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1009', 'Sam', '大数据', '讲师', '熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力；熟练掌握HTML5/CSS3网页构建能力;', '9', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1010', 'Willam', 'JAVA', '助教', '精通ASP.NET语言编程和数据库编程;有独立开发webApp能力与经验；精通嵌入式PHP语言编程；', '1', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1011', 'Coco', '大前端', '讲师', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；精通嵌入式PHP语言编程；', '2', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1012', 'Lucy', '移动端', '副教授', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；精通嵌入式PHP语言编程；', '3', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1013', 'Ama', '移动端', '讲师', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；', '4', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1014', 'Olivia', '移动端', '讲师', '精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；', '5', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1015', 'Amber', '大前端', '讲师', '精通C#、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；精通嵌入式PHP语言编程；', '6', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1016', 'Tom', 'JAVA', '讲师', '嵌入式系统骨灰级专家人物;长期从事国内、外嵌入式项目开发工作；10年以上嵌入式项目开发工程经验；精通c、c++、汇编、单片机；', '7', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1017', 'Tony', '大前端', '讲师', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；', '8', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1018', 'John', '大数据', '讲师', '精通ASP.NET语言编程和数据库编程;有独立开发webApp能力与经验；精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；', '9', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1019', 'Kate', 'JAVA', '讲师', '精通c、c++、汇编、单片机；熟悉Linux、java、Android、php；精通嵌入式PHP语言编程；熟悉服务器原理及网络通信原理；', '1', null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1020', 'dfsf', 'JAVA', '教授', '1324124额4', null, null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1021', 'dsfsdf', 'JAVA', '讲师', 'dsfsfsdf', null, null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1022', 'anchshn', 'JAVA', '讲师', '啥抠脚大汉科维奇', null, null, null, null, null, '0');
INSERT INTO `xz_teacher` VALUES ('1023', 'sadas', 'JAVA', '讲师', 'sadsa', null, null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1024', '', 'JAVA', '讲师', '', null, null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1025', '', 'JAVA', '讲师', '', null, null, null, null, null, '1');
INSERT INTO `xz_teacher` VALUES ('1026', '张三', 'JAVA', '讲师', '什么也没写', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_test
-- ----------------------------
DROP TABLE IF EXISTS `xz_test`;
CREATE TABLE `xz_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_a` varchar(20) DEFAULT NULL,
  `test_b` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_test
-- ----------------------------
INSERT INTO `xz_test` VALUES ('10', 'aaa', 'ggg');
INSERT INTO `xz_test` VALUES ('11', '123', '333');
INSERT INTO `xz_test` VALUES ('12', '', '123');
INSERT INTO `xz_test` VALUES ('13', '', '啊实打实的');
INSERT INTO `xz_test` VALUES ('24', 'aaa', '阿斯顿');
INSERT INTO `xz_test` VALUES ('25', 'aaa', '阿斯顿a');
INSERT INTO `xz_test` VALUES ('26', '122', 'bbbb');
INSERT INTO `xz_test` VALUES ('28', '', 'aaaa');
INSERT INTO `xz_test` VALUES ('29', 'asdfg', 'a');
INSERT INTO `xz_test` VALUES ('30', 'asdasd', 'qweqwe');
INSERT INTO `xz_test` VALUES ('33', '', '1111');
INSERT INTO `xz_test` VALUES ('34', 'ASDASD', 'ASDASD');

-- ----------------------------
-- Table structure for xz_vdiscuss
-- ----------------------------
DROP TABLE IF EXISTS `xz_vdiscuss`;
CREATE TABLE `xz_vdiscuss` (
  `vds_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '视频评论对应表ID',
  `video_id` bigint(200) NOT NULL COMMENT '视频ID',
  `discuss_id` bigint(200) NOT NULL COMMENT '评论ID',
  `delete_vds_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(225) DEFAULT NULL COMMENT '备用列1',
  `filed2` varchar(225) DEFAULT NULL COMMENT '备用列2',
  `filed3` varchar(225) DEFAULT NULL COMMENT '备用列3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型',
  PRIMARY KEY (`vds_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_vdiscuss
-- ----------------------------
INSERT INTO `xz_vdiscuss` VALUES ('1', '2', '1013', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('2', '2', '1014', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('3', '2', '1021', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('4', '3', '1022', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('5', '3', '1023', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('6', '3', '1024', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('7', '4', '1025', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('8', '4', '1026', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('9', '2', '1027', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('10', '2', '1028', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('11', '3', '1029', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('12', '4', '1032', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('13', '2', '1038', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('14', '3', '1070', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('15', '3', '1071', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('16', '3', '1072', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('17', '20', '1090', null, null, null, null, '0');
INSERT INTO `xz_vdiscuss` VALUES ('18', '20', '1093', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_video
-- ----------------------------
DROP TABLE IF EXISTS `xz_video`;
CREATE TABLE `xz_video` (
  `video_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `login_id` bigint(200) DEFAULT NULL COMMENT '登录表ID',
  `member_name` varchar(200) DEFAULT NULL COMMENT '用户名',
  `video_picture` varchar(200) DEFAULT NULL COMMENT '视频预览图',
  `video_name` varchar(20) DEFAULT NULL COMMENT '视频名称',
  `video_introduce` varchar(2000) DEFAULT NULL COMMENT '视频介绍',
  `video_address` varchar(200) DEFAULT NULL COMMENT '视频地址',
  `vclass` int(10) DEFAULT NULL COMMENT '视频分类',
  `video_type` int(10) DEFAULT '3' COMMENT '审核状态 3未审核 1通过 2未通过',
  `video_price` double(20,2) DEFAULT '0.00' COMMENT '视频价格',
  `video_dis` int(10) DEFAULT '1' COMMENT '视频评论类型 1 无评论 2 有评论',
  `delete_video_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_video
-- ----------------------------
INSERT INTO `xz_video` VALUES ('20', '2', '哈哈哈', 'iVBORw0KGg1496754546553.png', 'Java基础', 'Java基础', '1496754529877b.webm', '1', '1', '0.01', '2', null, null, null, null, '0', null);
INSERT INTO `xz_video` VALUES ('21', '2', '哈哈哈', 'iVBORw0KGg1496754585006.png', 'Oracle', '数据库 ', '1496754565312b.webm', '3', '1', '0.00', '1', null, null, null, null, '0', null);
INSERT INTO `xz_video` VALUES ('22', '2', '哈哈哈', 'iVBORw0KGg1496754613556.png', 'Java', '哈哈哈哈', '1496754598103b.webm', '1', '1', '0.00', '1', null, null, null, null, '0', null);
INSERT INTO `xz_video` VALUES ('23', '2', '哈哈哈', 'iVBORw0KGg1496758474465.png', '1', '1', '1496758432817b.webm', '1', '3', '0.00', '1', null, null, null, null, '0', null);
INSERT INTO `xz_video` VALUES ('24', '2', '哈哈哈', null, null, null, '1496758507730b.webm', null, '3', '0.00', '1', null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for xz_video_class
-- ----------------------------
DROP TABLE IF EXISTS `xz_video_class`;
CREATE TABLE `xz_video_class` (
  `vclass_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '视频类别ID',
  `class_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `class_introduce` varchar(200) DEFAULT NULL COMMENT '类别介绍',
  `delete_vclass_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  PRIMARY KEY (`vclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_video_class
-- ----------------------------
INSERT INTO `xz_video_class` VALUES ('1', 'JAVA', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征', null, null, null, null, '0');
INSERT INTO `xz_video_class` VALUES ('2', '大前端', '大前端时代是WEB统一的时代，利用html5或者6甚至7，不但可以开发传统的网站，更可以采用BS架构应用程序、开发手机端web应用、             移动端Native应用程序、智能设备等。', null, null, null, null, '0');
INSERT INTO `xz_video_class` VALUES ('3', '大数据', '大数据指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，是有更强的决策洞察发现力和流程优化能力的海量、             高增长率和多样化的信息资产。', null, null, null, null, '0');
INSERT INTO `xz_video_class` VALUES ('4', '移动端', 'APP作为一种萌生与iphone的盈利模式开始被更多的互联网商业大亨看重，如淘宝开放平台,腾讯的微博开发平台，百度的百度应用平台都是 APP思想的具体表现，一方面可以积聚各种不同类型的网络受众，另一方面借助APP平台获取流量，其中包括大众流量和定向流量。', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_video_record
-- ----------------------------
DROP TABLE IF EXISTS `xz_video_record`;
CREATE TABLE `xz_video_record` (
  `record_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `login_id` bigint(200) DEFAULT NULL COMMENT '用户ID',
  `video_id` bigint(200) DEFAULT NULL COMMENT '视频ID',
  `record_type` int(10) DEFAULT NULL COMMENT '记录类型 1上传 2下载',
  `record_date` date DEFAULT NULL COMMENT '记录日期',
  `delete_record_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_video_record
-- ----------------------------
INSERT INTO `xz_video_record` VALUES ('12', '20', '3', '2', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('13', '2', '20', '1', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('14', '2', '21', '1', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('15', '2', '22', '1', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('16', '20', '20', '2', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('17', '20', '22', '2', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('18', '2', '23', '1', '2017-06-06', null, null, null, null, '0');
INSERT INTO `xz_video_record` VALUES ('19', '14', '20', '2', '2017-06-07', null, null, null, null, '0');

-- ----------------------------
-- Table structure for xz_vip
-- ----------------------------
DROP TABLE IF EXISTS `xz_vip`;
CREATE TABLE `xz_vip` (
  `vip_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '会员编号(主键)',
  `login_id` bigint(200) DEFAULT '0' COMMENT '登录表ID',
  `vip_level` varchar(200) DEFAULT '0' COMMENT '会员等级',
  `vip_time` date DEFAULT NULL COMMENT '入会日期',
  `last_time` date DEFAULT NULL COMMENT '上次充值日期',
  `expire_time` date DEFAULT NULL COMMENT '会员到期日期',
  `vip_score` bigint(11) DEFAULT '0' COMMENT '积分数',
  `vip_rest` double(11,2) DEFAULT '0.00' COMMENT '账户余额',
  `filed1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `delete_flag` int(2) DEFAULT '0' COMMENT '删除标记(0 未删除 1删除)',
  PRIMARY KEY (`vip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xz_vip
-- ----------------------------
INSERT INTO `xz_vip` VALUES ('1', '2', '2', null, null, null, '50', '500.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('2', '4', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('3', '5', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('4', '6', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('5', '7', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('6', '8', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('7', '9', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('8', '12', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('9', '11', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('10', '14', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('11', '16', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('12', '18', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('13', '19', '0', null, null, null, '0', '0.00', null, null, null, '0');
INSERT INTO `xz_vip` VALUES ('14', '20', '0', null, null, null, '0', '0.00', null, null, null, '0');

-- ----------------------------
-- Table structure for xz_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `xz_work_experience`;
CREATE TABLE `xz_work_experience` (
  `work_experience_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '工作经验表ID',
  `login_id` bigint(200) NOT NULL COMMENT '会员ID',
  `company` varchar(20) DEFAULT NULL COMMENT '公司',
  `duty` varchar(20) DEFAULT NULL COMMENT '职务',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `dimission_date` date DEFAULT NULL COMMENT '离职日期',
  `dimission_cause` varchar(2000) DEFAULT NULL COMMENT '离职原因',
  `work_description` varchar(2000) DEFAULT NULL COMMENT '工作描述',
  `delete_work_date` date DEFAULT NULL COMMENT '删除日期',
  `filed1` varchar(200) DEFAULT NULL COMMENT '备用字段1',
  `filed2` varchar(200) DEFAULT NULL COMMENT '备用字段2',
  `filed3` varchar(200) DEFAULT NULL COMMENT '备用字段3',
  `delete_falt` int(10) DEFAULT '0' COMMENT '删除类型_0:未删除_1:删除',
  PRIMARY KEY (`work_experience_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xz_work_experience
-- ----------------------------
INSERT INTO `xz_work_experience` VALUES ('1', '2', '德视鼎信', '3D设计师', '2017-05-02', '2017-05-30', '哈哈哈', '哈哈哈', null, null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('2', '2', '哈哈哈', '呵呵呵', '2017-05-02', '2017-05-31', '嘿嘿嘿', '啊啊啊', '2017-06-05', null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('3', '8', 'dfsfwe', 'dsfwedf', '2017-06-06', '2017-06-16', 'dsfd', 'fdsf', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_work_experience` VALUES ('4', '2', 'ggg', 'ggg', '2017-06-05', '2017-06-06', 'ggg', 'ggg', '2017-06-05', null, null, null, '1');
INSERT INTO `xz_work_experience` VALUES ('5', '8', '先知蓝创', 'java程序员', '2017-06-06', '2017-06-22', '健康撒活动空间', '安定区无多撒', null, null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('6', '12', '热通过', '二', '2017-06-15', '2017-06-16', '热托管人', '热通过', null, null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('7', '16', '少林寺', '扫地', '2017-06-07', '2017-06-08', '不扫了', '扫叶子', null, null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('8', '11', '谱尼测试集团', '现场', '2016-12-01', '2017-05-05', '啊啊啊', '啊啊啊', null, null, null, null, '0');
INSERT INTO `xz_work_experience` VALUES ('9', '19', '的撒旦', '撒旦撒', '2016-06-13', '2017-06-21', '爱仕达', '爱仕达', null, null, null, null, '0');
