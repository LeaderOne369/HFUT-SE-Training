/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : ksp2

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 15/01/2025 12:21:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for citation
-- ----------------------------
DROP TABLE IF EXISTS `citation`;
CREATE TABLE `citation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '引用ID，唯一标识一条引用记录，主键，自增',
  `post_id` bigint NULL DEFAULT NULL COMMENT '帖子ID，使用引用的帖子ID，外键，关联帖子实体（假设为post）的id字段',
  `citation_type_id` bigint NULL DEFAULT NULL COMMENT '引用类型ID，外键，关联引用类型实体（假设为citation_type）的id字段',
  `citation_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引用的具体内容或文本，通常是从其他文献、资料或帖子中提取的',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引用内容的来源信息，例如书籍、文章、网页等的标题或链接',
  `citation_time` datetime NULL DEFAULT NULL COMMENT '引用时间，用户添加引用的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '是否删除，0表示未删除，1表示已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_citation_post_id`(`post_id` ASC) USING BTREE,
  INDEX `fk_citation_citation_type_id`(`citation_type_id` ASC) USING BTREE,
  CONSTRAINT `fk_citation_citation_type_id` FOREIGN KEY (`citation_type_id`) REFERENCES `citation_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_citation_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of citation
-- ----------------------------
INSERT INTO `citation` VALUES (1, 23, 1, '去微软', '', '2025-01-10 16:47:34', 0);

-- ----------------------------
-- Table structure for citation_type
-- ----------------------------
DROP TABLE IF EXISTS `citation_type`;
CREATE TABLE `citation_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '引用类型ID，唯一标识一个引用类型，主键，自增',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引用类型的名称，如书籍、期刊文章、网站、报告等',
  `type_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '对引用类型进行详细描述，可包括该类型引用的标准格式、常见引用场景等',
  `is_active` int NULL DEFAULT NULL COMMENT '是否启用，0表示未启用，1表示启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of citation_type
-- ----------------------------
INSERT INTO `citation_type` VALUES (1, '1', '11', 1);
INSERT INTO `citation_type` VALUES (2, '期刊文章', '学术期刊上发表的研究论文，通常包含作者、标题、期刊名称、卷号、期号、页码和出版年份等信息。引用格式示例：作者. (年份). 标题. 期刊名, 卷(期), 页码.', 1);
INSERT INTO `citation_type` VALUES (3, '图书', '出版的书籍，包括专著、教材等。引用格式包含作者、出版年份、书名、出版社和出版地等信息。引用格式示例：作者. (年份). 书名. 出版地: 出版社.', 1);
INSERT INTO `citation_type` VALUES (4, '会议论文', '在学术会议上发表的论文。包含作者、年份、论文标题、会议名称、会议地点等信息。引用格式示例：作者. (年份). 论文标题. 会议名称, 地点, 页码.', 1);
INSERT INTO `citation_type` VALUES (5, '学位论文', '硕士或博士学位论文。包含作者、年份、论文标题、学位类型、学校等信息。引用格式示例：作者. (年份). 论文标题 [学位论文类型]. 学校名称.', 1);
INSERT INTO `citation_type` VALUES (6, '网络资源', '来自互联网的各类资源，包括网页、在线文档等。需包含URL和访问日期。引用格式示例：作者. (年份). 标题. 网站名称. URL', 1);
INSERT INTO `citation_type` VALUES (7, '报纸文章', '报纸上发表的新闻文章或评论。包含作者、日期、标题、报纸名称等信息。引用格式示例：作者. (年月日). 文章标题. 报纸名称, 版次.', 1);
INSERT INTO `citation_type` VALUES (8, '政府报告', '政府部门发布的官方报告、文件等。包含发布机构、年份、标题等信息。引用格式示例：发布机构. (年份). 报告标题. 出版地: 出版单位.', 1);
INSERT INTO `citation_type` VALUES (9, '专利', '已授权的专利文件。包含专利权人、专利号、专利名称等信息。引用格式示例：专利权人. (年份). 专利名称. 专利号.', 0);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个合集，自增',
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合集的名称，用于用户识别和展示',
  `collection_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合集的详细描述，可以包含合集的主题、目的和包含内容的概述',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '关联用户表的id，创建该合集的用户ID',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '合集创建的时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '合集信息最后一次更新的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '表示合集是否被删除，1表示是，0表示否',
  `like_count` int NULL DEFAULT NULL COMMENT '合集获得的点赞数量',
  `comment_count` int NULL DEFAULT NULL COMMENT '合集下的评论数量',
  `subscribe_count` int NULL DEFAULT NULL COMMENT '合集被订阅的次数',
  `share_count` int NULL DEFAULT NULL COMMENT '合集被分享的次数',
  `visibility` int NULL DEFAULT NULL COMMENT '分区的可见性，0表示自己可见，1表示公开',
  `review_status` int NULL DEFAULT NULL COMMENT '审核状态，0-待审核，1-已通过，2-已拒绝',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_collection_creator_id`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `fk_collection_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 'Python学习系列', 'Python从入门到进阶的完整学习路线，包含基础语法、数据结构、算法和实战项目', 3, '2024-03-01 10:00:00', '2024-03-15 15:30:00', 0, 150, 45, 200, 80, 1, 1);
INSERT INTO `collection` VALUES (2, '学术写作指南', '学术论文写作的完整指南，包括选题、研究方法、写作技巧和投稿经验', 3, '2024-03-05 14:00:00', '2024-03-15 16:00:00', 0, 120, 35, 180, 60, 1, 1);
INSERT INTO `collection` VALUES (3, '机器学习实战', '机器学习算法的实际应用案例分析，包含代码实现和性能优化', 5, '2024-03-15 09:00:00', '2024-03-15 09:00:00', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (4, '个人学习笔记', '日常学习和工作中的技术积累与心得体会', 5, '2024-03-10 11:00:00', '2024-03-15 14:00:00', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `collection` VALUES (5, '技术资源分享', '各类技术学习资源的整理和分享', 4, '2024-03-13 16:00:00', '2024-03-14 10:00:00', 0, 0, 0, 0, 0, 1, 2);
INSERT INTO `collection` VALUES (6, '前沿技术探讨', '最新技术趋势分析和实践经验分享', 2, '2024-02-01 09:00:00', '2024-03-15 17:00:00', 0, 500, 150, 800, 300, 1, 1);
INSERT INTO `collection` VALUES (7, '测试合集', '用于测试的合集', 3, '2024-02-01 10:00:00', '2024-02-01 10:00:00', 1, 0, 0, 0, 0, 1, 1);
INSERT INTO `collection` VALUES (8, '本国英', '院观用济养论量验。量或究该省场况。', 9, '2025-01-08 16:12:53', '2025-01-13 02:24:20', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (9, '1123123', '1', 1, '2025-01-13 02:27:53', '2025-01-13 02:27:53', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (10, '我的合集', '合计合计\n', 18, '2025-01-14 01:30:52', '2025-01-14 01:30:52', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (11, '我的合集', '合计合计\n', 18, '2025-01-14 01:30:59', '2025-01-14 01:30:59', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (12, '我的合集1', '', 18, '2025-01-14 01:33:28', '2025-01-14 01:33:28', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (13, '阿斯顿发', '', 18, '2025-01-14 01:34:37', '2025-01-14 01:34:37', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (14, '去微软123123', '去微软', 18, '2025-01-14 01:36:15', '2025-01-14 02:06:42', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collection` VALUES (15, '请问人情味', '请问', 18, '2025-01-14 01:36:39', '2025-01-14 01:36:39', 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `collection` VALUES (16, '亲切温柔', '去微软', 18, '2025-01-14 01:36:58', '2025-01-14 02:06:24', 0, 0, 0, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for collection_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `collection_subscriptions`;
CREATE TABLE `collection_subscriptions`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，自增且唯一标识一条订阅记录',
  `users_id` bigint NULL DEFAULT NULL COMMENT '订阅合集的用户ID，外键，关联用户实体（users）的id',
  `collections_id` bigint NULL DEFAULT NULL COMMENT '被订阅的合集ID，外键，关联合集实体（collections）的id',
  `is_deleted` int NULL DEFAULT NULL COMMENT '区分位，例如1表示有效，0表示无效',
  `subscription_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户订阅的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cs_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_cs_collections_id`(`collections_id` ASC) USING BTREE,
  CONSTRAINT `fk_cs_collections_id` FOREIGN KEY (`collections_id`) REFERENCES `collection` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cs_users_id` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_subscriptions
-- ----------------------------
INSERT INTO `collection_subscriptions` VALUES (1, 9, 6, 0, '2024-03-10 09:30:00');
INSERT INTO `collection_subscriptions` VALUES (2, 3, 2, 0, '2024-03-12 14:20:00');
INSERT INTO `collection_subscriptions` VALUES (3, 5, 1, 0, '2024-03-11 10:15:00');
INSERT INTO `collection_subscriptions` VALUES (4, 5, 6, 0, '2024-03-13 16:40:00');
INSERT INTO `collection_subscriptions` VALUES (5, 2, 1, 0, '2024-03-14 11:25:00');
INSERT INTO `collection_subscriptions` VALUES (6, 2, 2, 0, '2024-03-15 09:50:00');
INSERT INTO `collection_subscriptions` VALUES (7, 3, 3, 1, '2024-03-01 10:00:00');
INSERT INTO `collection_subscriptions` VALUES (8, 5, 5, 1, '2024-03-02 15:30:00');
INSERT INTO `collection_subscriptions` VALUES (9, 2, 4, 0, '2024-03-15 14:30:00');
INSERT INTO `collection_subscriptions` VALUES (10, 12, 2, 0, '2025-01-07 15:46:36');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条评论记录，自增',
  `commenter_id` bigint NULL DEFAULT NULL COMMENT '发表评论的用户ID，外键，关联用户表（假设为user）的id字段',
  `commentable_id` bigint NULL DEFAULT NULL COMMENT '被评论的对象ID，可能是帖子、合集或其他评论的ID',
  `commentable_type` int NULL DEFAULT NULL COMMENT '被评论对象的类型，1表示帖子，2表示合集，3表示其他评论',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论的具体文本内容',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '评论创建的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '是否删除，0表示未删除，1表示已删除',
  `parent_comment_id` bigint NULL DEFAULT NULL COMMENT '如果评论是回复另一条评论的，此字段指向被回复的评论ID，外键，自关联到评论实体（即本表comment）的id字段',
  `like_count` int NULL DEFAULT NULL COMMENT '评论获得的点赞数量',
  `reply_count` int NULL DEFAULT NULL COMMENT '评论收到的回复数量',
  `is_public` int NULL DEFAULT NULL COMMENT '是否是公开的，0表示否，1表示是',
  `review_status` int NULL DEFAULT NULL COMMENT '审核状态，0表示待审核，1表示已通过，2表示已拒绝',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cm_commenter_id`(`commenter_id` ASC) USING BTREE,
  INDEX `fk_cm_parent_comment_id`(`parent_comment_id` ASC) USING BTREE,
  CONSTRAINT `fk_cm_commenter_id` FOREIGN KEY (`commenter_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cm_parent_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 3, 2, 1, '这篇教程写得非常详细，对初学者很有帮助！', '2024-03-15 10:30:00', 0, NULL, 26, 2, 1, 1);
INSERT INTO `comment` VALUES (2, 5, 2, 1, '请问第三部分的代码示例能详细解释一下吗？', '2024-03-15 11:00:00', 0, NULL, 5, 0, 1, 1);
INSERT INTO `comment` VALUES (3, 5, 1, 2, '这个系列的内容编排很合理，循序渐进', '2024-03-14 14:20:00', 0, NULL, 10, 1, 1, 1);
INSERT INTO `comment` VALUES (4, 3, 1, 2, '期待后续的更新！', '2024-03-14 15:00:00', 0, NULL, 6, 0, 1, 1);
INSERT INTO `comment` VALUES (5, 5, 3, 1, '这篇文章对我的论文写作很有帮助', '2024-03-15 16:00:00', 0, NULL, 0, 0, 1, 0);
INSERT INTO `comment` VALUES (6, 3, 3, 1, '这是一条私密评论', '2024-03-15 16:30:00', 0, NULL, 0, 0, 0, 1);
INSERT INTO `comment` VALUES (7, 3, 6, 1, '测试评论', '2024-02-01 10:00:00', 1, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (8, 3, 2, 3, '好的，我来详细解释一下那段代码的实现思路...', '2024-03-15 11:30:00', 0, 2, 8, 0, 1, 1);
INSERT INTO `comment` VALUES (9, 12, 1, 2, 'eu nisi consectetur', '2025-01-07 15:56:24', 1, 2, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (10, 9, 1, 3, '测试', '2025-01-07 16:18:54', 0, NULL, 0, 0, 0, 1);
INSERT INTO `comment` VALUES (11, 9, 1, 3, '测试', '2025-01-07 16:42:26', 1, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (12, 18, 31, 1, 'wdfas', '2025-01-10 22:08:30', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (13, 18, 32, 1, '撒打发', '2025-01-10 22:37:57', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (14, 18, 32, 1, '阿斯顿发生', '2025-01-10 22:38:01', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (15, 18, 32, 1, '试试评论', '2025-01-10 22:44:32', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (16, 18, 32, 1, '你好，我觉得绝了', '2025-01-10 22:50:33', 0, NULL, 17, 0, 1, 1);
INSERT INTO `comment` VALUES (17, 18, 16, 3, 'qwer', '2025-01-10 23:39:12', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (18, 18, 16, 3, '??', '2025-01-10 23:45:51', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (19, 18, 16, 3, 'asdfdasf', '2025-01-10 23:46:06', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (20, 18, 15, 3, 'asdf', '2025-01-10 23:56:43', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (21, 18, 14, 3, 'asdfa sd', '2025-01-10 23:58:47', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (22, 18, 16, 3, 'asdfsdafasdf', '2025-01-10 23:59:02', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (23, 18, 16, 3, '你好', '2025-01-11 00:38:03', 0, 16, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (24, 18, 32, 1, '最新测试评论', '2025-01-11 00:38:18', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (25, 18, 24, 3, '你在干嘛', '2025-01-11 00:38:27', 0, 24, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (26, 18, 24, 3, '最新测试子评论', '2025-01-11 00:39:28', 0, 24, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (27, 18, 32, 1, '新的一条评论', '2025-01-11 00:40:21', 0, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (28, 18, 24, 3, '测试新的子评论', '2025-01-11 00:42:46', 0, 24, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (29, 18, 32, 1, '在测试一条', '2025-01-11 00:46:14', 0, NULL, 0, 2, 1, 1);
INSERT INTO `comment` VALUES (30, 18, 29, 3, '测试子评论', '2025-01-11 00:46:59', 0, 29, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (31, 12, 29, 3, '我喜欢小熊维尼', '2025-01-11 01:10:09', 0, 29, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (39, 9, 29, 3, '我来测测你的', '2025-01-11 18:04:49', 0, 29, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (40, 18, 36, 1, '讲的真不错', '2025-01-11 20:52:18', 0, NULL, 1, 2, 1, 1);
INSERT INTO `comment` VALUES (41, 18, 40, 3, '你好', '2025-01-11 20:52:47', 0, 40, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (42, 18, 36, 1, '测试一下', '2025-01-11 20:53:28', 1, NULL, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (43, 18, 40, 3, '我也好', '2025-01-11 20:53:40', 0, 40, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个收藏记录，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '进行收藏的用户ID，外键，关联用户实体（User）',
  `post_id` bigint NULL DEFAULT NULL COMMENT '被收藏的帖子ID，外键，关联帖子实体（Post）',
  `folder_id` bigint NULL DEFAULT NULL COMMENT '收藏所属的收藏夹ID，外键，关联收藏夹实体（CollectionFolder）',
  `favorite_time` datetime NULL DEFAULT NULL COMMENT '用户收藏帖子的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '逻辑删除标识，0表示未删除，1表示已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_favorite_user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_favorite_post_id`(`post_id` ASC) USING BTREE,
  INDEX `fk_favorite_folder_id`(`folder_id` ASC) USING BTREE,
  CONSTRAINT `fk_favorite_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `favorite_folder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, 3, 2, 1, '2024-03-10 09:30:00', 0);
INSERT INTO `favorite` VALUES (2, 3, 3, 2, '2024-03-11 14:20:00', 0);
INSERT INTO `favorite` VALUES (3, 3, 4, 2, '2024-03-12 16:45:00', 0);
INSERT INTO `favorite` VALUES (4, 5, 2, 3, '2024-03-13 10:15:00', 0);
INSERT INTO `favorite` VALUES (5, 5, 1, 3, '2024-03-14 11:30:00', 0);
INSERT INTO `favorite` VALUES (6, 2, 2, 5, '2024-03-14 15:20:00', 0);
INSERT INTO `favorite` VALUES (7, 2, 3, 5, '2024-03-15 09:40:00', 0);
INSERT INTO `favorite` VALUES (8, 3, 6, 1, '2024-02-01 10:00:00', 1);
INSERT INTO `favorite` VALUES (9, 5, 6, 3, '2024-02-02 11:00:00', 1);
INSERT INTO `favorite` VALUES (10, 3, 2, 1, '2024-03-10 09:30:00', 0);
INSERT INTO `favorite` VALUES (11, 3, 3, 1, '2024-03-11 14:20:00', 0);
INSERT INTO `favorite` VALUES (12, 3, 4, 2, '2024-03-12 16:45:00', 0);
INSERT INTO `favorite` VALUES (13, 5, 2, 3, '2024-03-13 10:15:00', 0);
INSERT INTO `favorite` VALUES (14, 5, 1, 3, '2024-03-14 11:30:00', 0);
INSERT INTO `favorite` VALUES (15, 2, 2, 5, '2024-03-14 15:20:00', 0);
INSERT INTO `favorite` VALUES (16, 2, 3, 5, '2024-03-15 09:40:00', 0);
INSERT INTO `favorite` VALUES (17, 3, 6, 1, '2024-02-01 10:00:00', 1);
INSERT INTO `favorite` VALUES (18, 5, 6, 3, '2024-02-02 11:00:00', 1);
INSERT INTO `favorite` VALUES (19, 9, 1, 11, '2025-01-07 17:00:05', 1);
INSERT INTO `favorite` VALUES (20, 18, 36, 23, '2025-01-11 14:26:37', 1);
INSERT INTO `favorite` VALUES (21, 18, 36, 23, '2025-01-11 14:51:51', 1);
INSERT INTO `favorite` VALUES (22, 18, 36, 24, '2025-01-11 15:22:29', 1);
INSERT INTO `favorite` VALUES (23, 18, 36, 24, '2025-01-11 15:34:24', 1);
INSERT INTO `favorite` VALUES (24, 18, 36, 24, '2025-01-11 15:52:35', 1);
INSERT INTO `favorite` VALUES (25, 18, 36, 24, '2025-01-11 16:03:21', 1);
INSERT INTO `favorite` VALUES (26, 18, 36, 24, '2025-01-11 18:42:36', 1);
INSERT INTO `favorite` VALUES (27, 18, 36, 24, '2025-01-11 20:51:35', 1);
INSERT INTO `favorite` VALUES (295, 18, 36, 24, '2025-01-12 04:14:34', 1);
INSERT INTO `favorite` VALUES (296, 18, 36, 24, '2025-01-12 04:22:11', 0);
INSERT INTO `favorite` VALUES (297, 18, 32, 23, '2025-01-12 04:45:03', 0);
INSERT INTO `favorite` VALUES (298, 9, 8, 11, '2025-01-14 08:53:03', 0);

-- ----------------------------
-- Table structure for favorite_folder
-- ----------------------------
DROP TABLE IF EXISTS `favorite_folder`;
CREATE TABLE `favorite_folder`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个收藏夹，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '创建收藏夹的用户ID，关联用户表user的id',
  `folder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收藏夹的名称，用于用户识别和展示',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '收藏夹创建的时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '收藏夹信息最后一次更新的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '逻辑删除标识，0表示未删除，1表示已删除',
  `review_status` int NULL DEFAULT NULL COMMENT '审核状态，0表示待审核，1表示已通过，2表示已拒绝',
  `visibility` int NULL DEFAULT NULL COMMENT '可见性，0表示自己可见，1表示可见',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_f_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_favorite_folder_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite_folder
-- ----------------------------
INSERT INTO `favorite_folder` VALUES (1, 3, '技术学习资料', '2024-03-01 10:00:00', '2024-03-15 15:30:00', 0, 1, 1);
INSERT INTO `favorite_folder` VALUES (2, 3, '个人笔记', '2024-03-02 14:00:00', '2024-03-15 16:00:00', 0, 1, 0);
INSERT INTO `favorite_folder` VALUES (3, 5, 'Python学习资源', '2024-03-10 09:00:00', '2024-03-15 10:00:00', 0, 1, 1);
INSERT INTO `favorite_folder` VALUES (4, 5, '待读文章', '2024-03-12 16:00:00', '2024-03-15 14:00:00', 0, 1, 0);
INSERT INTO `favorite_folder` VALUES (5, 2, '精选技术文章', '2024-02-01 09:00:00', '2024-03-15 17:00:00', 0, 1, 1);
INSERT INTO `favorite_folder` VALUES (6, 2, '管理参考资料', '2024-02-15 10:00:00', '2024-03-15 11:00:00', 0, 1, 0);
INSERT INTO `favorite_folder` VALUES (7, 5, '资源分享', '2024-03-15 09:00:00', '2024-03-15 09:00:00', 0, 0, 1);
INSERT INTO `favorite_folder` VALUES (8, 4, '资源收藏', '2024-03-13 16:00:00', '2024-03-14 10:00:00', 0, 2, 1);
INSERT INTO `favorite_folder` VALUES (9, 3, '测试收藏夹', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 1, 1, 1);
INSERT INTO `favorite_folder` VALUES (10, 9, '这是一个测试收藏夹', '2025-01-07 16:57:56', '2025-01-07 16:57:56', 1, 0, 1);
INSERT INTO `favorite_folder` VALUES (11, 9, '这是一个测试收藏夹', '2025-01-07 16:58:07', '2025-01-07 16:58:07', 0, 0, 1);
INSERT INTO `favorite_folder` VALUES (12, 15, '默认收藏夹', '2025-01-09 09:57:05', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (13, 16, '默认收藏夹', '2025-01-09 10:19:56', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (14, 17, '默认收藏夹', '2025-01-09 10:23:09', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (15, 18, '默认收藏夹', '2025-01-09 10:24:18', NULL, 1, NULL, 1);
INSERT INTO `favorite_folder` VALUES (16, 18, NULL, '2025-01-10 13:54:10', '2025-01-10 13:54:10', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (17, 18, NULL, '2025-01-10 13:54:10', '2025-01-10 13:54:10', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (18, 18, NULL, '2025-01-10 14:00:16', '2025-01-10 14:00:16', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (19, 18, NULL, '2025-01-10 14:00:35', '2025-01-10 14:00:35', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (20, 18, '阿斯顿发', '2025-01-10 14:03:04', '2025-01-10 14:03:04', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (21, 18, '阿斯顿发', '2025-01-10 14:08:33', '2025-01-10 14:08:33', 1, 0, NULL);
INSERT INTO `favorite_folder` VALUES (22, 18, '阿斯顿发', '2025-01-10 14:11:02', '2025-01-10 14:11:02', 0, 0, NULL);
INSERT INTO `favorite_folder` VALUES (23, 18, '测试一个文件夹', '2025-01-10 14:11:28', '2025-01-10 14:11:28', 0, 0, NULL);
INSERT INTO `favorite_folder` VALUES (24, 18, '教程', '2025-01-11 14:57:23', '2025-01-11 14:57:23', 0, 0, NULL);
INSERT INTO `favorite_folder` VALUES (25, 19, '默认收藏夹', '2025-01-11 22:42:27', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (27, 18, '收藏夹1', '2025-01-13 11:52:29', '2025-01-13 11:52:29', 0, 0, NULL);
INSERT INTO `favorite_folder` VALUES (30, 28, '默认收藏夹', '2025-01-13 16:36:46', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (31, 29, '默认收藏夹', '2025-01-13 16:52:24', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (32, 30, '默认收藏夹', '2025-01-13 17:10:05', NULL, 0, NULL, 1);
INSERT INTO `favorite_folder` VALUES (33, 31, '默认收藏夹', '2025-01-13 17:23:35', NULL, 0, NULL, 1);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条反馈记录，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '提供反馈的用户ID，外键，关联用户实体（User）',
  `feedback_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户提交的反馈的具体内容，可以是文本形式',
  `feedback_time` datetime NULL DEFAULT NULL COMMENT '用户提交反馈的时间',
  `status` int NULL DEFAULT NULL COMMENT '反馈的处理状态，0表示未处理，1表示已处理，2表示已回复',
  `is_deleted` int NULL DEFAULT NULL COMMENT '是否删除，0表示未删除，1表示已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_feedback_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_feedback_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 3, '建议在文章编辑器中添加数学公式编辑功能，方便数学公式的输入和展示。', '2024-03-10 14:30:00', 1, 1);
INSERT INTO `feedback` VALUES (2, 3, '希望能增加夜间模式，保护眼睛。', '2024-03-12 20:15:00', 2, 0);
INSERT INTO `feedback` VALUES (3, 5, '移动端页面在iPhone 13上显示有偏移，按钮无法点击。', '2024-03-14 09:20:00', 0, 0);
INSERT INTO `feedback` VALUES (4, 3, '上传图片时偶尔会出现上传失败的情况，但没有具体错误提示。', '2024-03-13 16:45:00', 1, 0);
INSERT INTO `feedback` VALUES (5, 5, '发现有用户在评论区发布垃圾广告信息，建议加强管理。', '2024-03-15 11:30:00', 2, 0);
INSERT INTO `feedback` VALUES (6, 3, '测试反馈内容', '2024-02-01 10:00:00', 0, 1);
INSERT INTO `feedback` VALUES (7, 5, '网站加载速度较慢，特别是在查看图片较多的帖子时。', '2024-03-14 15:20:00', 0, 0);
INSERT INTO `feedback` VALUES (8, 3, '搜索功能太基础了，希望能支持高级搜索，比如按时间范围、作者等筛选。', '2024-03-13 09:10:00', 1, 0);
INSERT INTO `feedback` VALUES (9, 5, '私信功能使用不方便，建议优化私信的用户界面。', '2024-03-12 14:25:00', 2, 0);
INSERT INTO `feedback` VALUES (10, 3, '能否增加用户之间的协作功能，比如共同编辑文档？', '2024-03-11 16:40:00', 0, 0);
INSERT INTO `feedback` VALUES (11, 9, '测试', '2025-01-07 16:32:09', 0, 1);
INSERT INTO `feedback` VALUES (12, 9, '测试', '2025-01-07 16:35:03', 0, 0);
INSERT INTO `feedback` VALUES (13, 18, '类型：bug\n标题：测试反馈\n内容：反馈一下\n联系方式：121231231', '2025-01-15 10:13:14', 0, 0);
INSERT INTO `feedback` VALUES (14, 18, '类型：feature\n标题：岁的法国士大夫\n内容：是豆腐干大师傅\n联系方式：1111111111111111', '2025-01-15 10:13:30', 0, 1);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条关注记录，即关注ID（follow_id）',
  `follower_id` bigint NULL DEFAULT NULL COMMENT '关注者ID，外键，关联用户实体（User）的id',
  `followee_id` bigint NULL DEFAULT NULL COMMENT '被关注者ID，外键，关联用户实体（User）的id',
  `follow_time` timestamp NULL DEFAULT NULL COMMENT '用户关注的时间',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区分位，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_f_follower_id`(`follower_id` ASC) USING BTREE,
  INDEX `fk_f_followee_id`(`followee_id` ASC) USING BTREE,
  INDEX `idx_f_follow_time`(`follow_time` ASC) USING BTREE,
  CONSTRAINT `fk_f_followee_id` FOREIGN KEY (`followee_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_f_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (1, 3, 2, '2024-01-15 10:30:00', '0');
INSERT INTO `follow` VALUES (2, 5, 2, '2024-03-14 16:30:00', '0');
INSERT INTO `follow` VALUES (3, 3, 2, '2024-01-15 10:30:00', '0');
INSERT INTO `follow` VALUES (4, 3, 5, '2024-03-14 17:00:00', '0');
INSERT INTO `follow` VALUES (5, 5, 3, '2024-03-14 16:45:00', '0');
INSERT INTO `follow` VALUES (6, 5, 2, '2024-03-14 16:30:00', '0');
INSERT INTO `follow` VALUES (7, 3, 4, '2024-01-20 09:15:00', '1');
INSERT INTO `follow` VALUES (8, 5, 4, '2024-03-14 18:00:00', '1');
INSERT INTO `follow` VALUES (9, 4, 2, '2023-12-25 14:20:00', '0');
INSERT INTO `follow` VALUES (10, 4, 3, '2023-12-26 11:30:00', '0');

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个点赞记录，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '进行点赞的用户ID，外键，关联用户实体（User）',
  `like_object_id` bigint NULL DEFAULT NULL COMMENT '被点赞的对象ID，外键，关联对应的对象实体（如帖子、合集、评论）',
  `like_object_type` int NULL DEFAULT NULL COMMENT '喜欢对象类型，1表示帖子，2表示合集，3表示评论',
  `like_time` datetime NULL DEFAULT NULL COMMENT '用户点赞的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '逻辑删除标识，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_like_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like
-- ----------------------------
INSERT INTO `like` VALUES (1, 3, 2, 1, '2024-03-15 10:30:00', 0);
INSERT INTO `like` VALUES (2, 5, 3, 1, '2024-03-15 11:20:00', 0);
INSERT INTO `like` VALUES (3, 3, 1, 2, '2024-03-14 16:45:00', 0);
INSERT INTO `like` VALUES (4, 5, 2, 2, '2024-03-14 17:30:00', 0);
INSERT INTO `like` VALUES (5, 3, 1, 3, '2024-03-15 09:15:00', 0);
INSERT INTO `like` VALUES (6, 5, 2, 3, '2024-03-15 09:45:00', 0);
INSERT INTO `like` VALUES (7, 3, 6, 1, '2024-02-01 10:00:00', 1);
INSERT INTO `like` VALUES (8, 9, 1, 1, '2025-01-07 15:42:18', 1);
INSERT INTO `like` VALUES (9, 9, 1, 3, '2025-01-07 15:43:42', 1);
INSERT INTO `like` VALUES (10, 9, 1, 1, '2025-01-07 15:46:59', 1);
INSERT INTO `like` VALUES (11, 12, -1, 1, '2025-01-07 15:52:02', 0);
INSERT INTO `like` VALUES (12, 18, 32, 1, '2025-01-10 23:04:52', 1);
INSERT INTO `like` VALUES (13, 18, 32, 1, '2025-01-10 23:04:57', 1);
INSERT INTO `like` VALUES (14, 18, 32, 1, '2025-01-10 23:04:59', 1);
INSERT INTO `like` VALUES (15, 18, 32, 1, '2025-01-10 23:05:04', 1);
INSERT INTO `like` VALUES (16, 18, 32, 1, '2025-01-10 23:07:37', 1);
INSERT INTO `like` VALUES (17, 18, 32, 1, '2025-01-10 23:07:39', 1);
INSERT INTO `like` VALUES (18, 18, 32, 1, '2025-01-10 23:08:07', 1);
INSERT INTO `like` VALUES (19, 18, 32, 1, '2025-01-10 23:08:33', 1);
INSERT INTO `like` VALUES (20, 18, 32, 1, '2025-01-10 23:08:54', 1);
INSERT INTO `like` VALUES (21, 18, 32, 1, '2025-01-10 23:09:40', 1);
INSERT INTO `like` VALUES (22, 18, 16, 3, '2025-01-10 23:21:59', 0);
INSERT INTO `like` VALUES (23, 9, 1, 1, '2025-01-10 23:32:54', 0);
INSERT INTO `like` VALUES (24, 18, 32, 1, '2025-01-10 23:36:00', 1);
INSERT INTO `like` VALUES (25, 18, 32, 1, '2025-01-10 23:36:00', 1);
INSERT INTO `like` VALUES (26, 18, 32, 1, '2025-01-10 23:36:01', 1);
INSERT INTO `like` VALUES (27, 18, 32, 1, '2025-01-10 23:36:04', 0);
INSERT INTO `like` VALUES (28, 9, 1, 3, '2025-01-11 00:26:26', 0);
INSERT INTO `like` VALUES (29, 12, 2, 1, '2025-01-11 01:11:14', 1);
INSERT INTO `like` VALUES (30, 18, 36, 1, '2025-01-11 16:05:40', 1);
INSERT INTO `like` VALUES (31, 18, 36, 1, '2025-01-11 16:05:42', 1);
INSERT INTO `like` VALUES (32, 18, 36, 1, '2025-01-11 18:22:16', 1);
INSERT INTO `like` VALUES (33, 18, 36, 1, '2025-01-11 18:22:58', 1);
INSERT INTO `like` VALUES (34, 18, 36, 1, '2025-01-11 18:42:30', 1);
INSERT INTO `like` VALUES (35, 18, 40, 3, '2025-01-11 20:52:24', 1);
INSERT INTO `like` VALUES (36, 18, 40, 3, '2025-01-11 20:52:27', 1);
INSERT INTO `like` VALUES (37, 18, 36, 1, '2025-01-12 01:51:31', 0);
INSERT INTO `like` VALUES (38, 18, 40, 3, '2025-01-13 09:14:06', 0);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条消息通知记录',
  `user_sender_id` bigint NULL DEFAULT NULL COMMENT '发送通知的用户或系统ID，关联用户表的id，若为系统通知可空或为系统账户',
  `user_receiver_id` bigint NULL DEFAULT NULL COMMENT '接收通知的用户ID，关联用户表的id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知的标题或主题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知的具体内容或消息',
  `type` int NULL DEFAULT NULL COMMENT '通知类型，1代表评论回复，2代表点赞，3代表系统通知',
  `status` int NULL DEFAULT NULL COMMENT '通知状态，0代表未读，1代表已读',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '通知创建的时间',
  `read_time` datetime NULL DEFAULT NULL COMMENT '通知被阅读的时间，未读则为空',
  `is_deleted` int NULL DEFAULT NULL COMMENT '区分位，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_notification_user_sender_id`(`user_sender_id` ASC) USING BTREE,
  INDEX `fk_notification_user_receiver_id`(`user_receiver_id` ASC) USING BTREE,
  CONSTRAINT `fk_notification_user_receiver_id` FOREIGN KEY (`user_receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_notification_user_sender_id` FOREIGN KEY (`user_sender_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (1, 3, 5, '收到新的评论回复', 'zhang_san 回复了您的评论：「感谢分享，这个观点很有启发性」', 1, 1, '2024-03-15 10:30:00', '2024-03-15 10:35:00', 1);
INSERT INTO `notification` VALUES (2, 5, 3, '收到新的评论回复', 'new_user 回复了您的评论：「请问这个问题该如何解决呢？」', 1, 1, '2024-03-15 14:20:00', '2025-01-07 16:34:32', 0);
INSERT INTO `notification` VALUES (3, 5, 3, '获得新的点赞', 'new_user 赞了您的帖子《Python机器学习入门教程》', 2, 1, '2024-03-15 11:00:00', '2024-03-15 11:05:00', 0);
INSERT INTO `notification` VALUES (4, 3, 5, '获得新的点赞', 'zhang_san 赞了您的评论', 2, 1, '2024-03-15 15:30:00', '2025-01-07 16:35:00', 0);
INSERT INTO `notification` VALUES (5, 2, 3, '帖子审核通过通知', '您发布的帖子《Python机器学习入门教程》已通过审核，现已公开显示', 3, 1, '2024-03-10 09:00:00', '2024-03-10 09:30:00', 0);
INSERT INTO `notification` VALUES (6, 2, 5, '账号审核通知', '您的账号已通过审核，现在可以正常发帖和评论了', 3, 1, '2024-03-14 16:30:00', '2024-03-14 16:35:00', 0);
INSERT INTO `notification` VALUES (7, 2, NULL, '系统维护通知', '系统将于2024年3月20日凌晨2:00-4:00进行例行维护，期间可能无法访问', 3, 0, '2024-03-15 16:00:00', NULL, 0);
INSERT INTO `notification` VALUES (8, 3, 5, '测试通知', '这是一条测试通知', 1, 1, '2024-02-01 10:00:00', '2024-02-01 10:01:00', 1);
INSERT INTO `notification` VALUES (9, NULL, 15, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-09 09:57:05', NULL, 0);
INSERT INTO `notification` VALUES (10, NULL, 16, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-09 10:19:56', NULL, 0);
INSERT INTO `notification` VALUES (11, NULL, 17, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-09 10:23:09', NULL, 0);
INSERT INTO `notification` VALUES (12, NULL, 18, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 1, '2025-01-09 10:24:18', '2025-01-15 02:28:50', 0);
INSERT INTO `notification` VALUES (13, NULL, 19, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-11 22:42:27', NULL, 0);
INSERT INTO `notification` VALUES (17, NULL, 28, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-13 16:36:46', NULL, 0);
INSERT INTO `notification` VALUES (18, NULL, 29, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-13 16:52:24', NULL, 0);
INSERT INTO `notification` VALUES (19, NULL, 30, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-13 17:10:05', NULL, 0);
INSERT INTO `notification` VALUES (20, NULL, 31, '欢迎加入', '欢迎加入我们的平台！我们已为您创建了默认收藏夹，开始您的收藏之旅吧。', 3, 0, '2025-01-13 17:23:35', NULL, 0);
INSERT INTO `notification` VALUES (29, 2, 18, '按众五表在', '你有一条新的通知', 63, 1, '2025-01-14 19:56:06', '2025-01-15 02:41:32', 0);
INSERT INTO `notification` VALUES (76, 2, 18, '版本更新通知', '我们将于2015年1月15日对系统进行升级，届时将有短暂的延迟，造成不便，敬请谅解。', 85, 1, '2025-01-15 03:09:27', '2025-01-15 03:10:00', 0);
INSERT INTO `notification` VALUES (99, 19, 18, '好消息', '1、好消息，好消息，顾客朋友你们好，欢迎光临本店，现将所有服装一次性亏本大降价，大甩卖。2、降，降，降，降到最低价，减，减，减，减到最低点。3、只求清仓，不计成本，卖完为止，一件不留。', 0, 1, '2025-01-15 03:16:26', '2025-01-15 03:16:54', 0);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个帖子，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '关联用户表的id，发布帖子的用户ID',
  `section_id` bigint NULL DEFAULT NULL COMMENT '关联分区表的id，帖子所属的分区ID',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子的标签，用于分类和搜索，可以是多个标签的字符串，例如 \"标签1, 标签2\"',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子封面图片的路径或URL',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子内容的简短描述，用于快速预览',
  `citation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子中引用的其他内容或来源的详细信息',
  `collection_id` bigint NULL DEFAULT NULL COMMENT '关联合集表的id，帖子所属的合集ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子的标题',
  `content_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'minio的文件id，用于标识富文本内容的文件',
  `content_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'minio文件的路径，指向富文本内容的文件',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '帖子发布的时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '帖子最后一次更新的时间',
  `view_count` int NULL DEFAULT NULL COMMENT '帖子被浏览的次数',
  `comment_count` int NULL DEFAULT NULL COMMENT '帖子下的评论数量',
  `like_count` int NULL DEFAULT NULL COMMENT '帖子获得的点赞数量',
  `share_count` int NULL DEFAULT NULL COMMENT '帖子被分享的次数',
  `status` int NULL DEFAULT NULL COMMENT '帖子的状态，1表示已发布，0表示草稿',
  `is_pinned` int NULL DEFAULT NULL COMMENT '区分位，表示帖子是否被置顶显示，1表示是，0表示否',
  `is_essence` int NULL DEFAULT NULL COMMENT '区分位，表示帖子是否被标记为精华，1表示是，0表示否',
  `visibility` int NULL DEFAULT NULL COMMENT '定义谁可以查看帖子，0：自己；1：公开',
  `review_status` int NULL DEFAULT NULL COMMENT '审核状态，0-待审核，1-已通过，2-已拒绝',
  `is_deleted` int NULL DEFAULT NULL COMMENT '逻辑删除字段，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_p_publish_time`(`publish_time` ASC) USING BTREE,
  INDEX `idx_p_update_time`(`update_time` ASC) USING BTREE,
  INDEX `fk_post_user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_post_section_id`(`section_id` ASC) USING BTREE,
  INDEX `fk_post_collection_id`(`collection_id` ASC) USING BTREE,
  CONSTRAINT `fk_post_collection_id` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 2, NULL, '公告,重要', '/covers/notice.jpg', '关于社区规范和发帖指南的重要通知', NULL, NULL, '【置顶】社区规范与发帖指南', 'notice-001', 'post/content/notice-001.json', '2024-03-01 10:00:00', '2024-03-01 10:00:00', 1011, 50, 201, 102, 1, 1, 1, 1, 1, 0);
INSERT INTO `post` VALUES (2, 3, 1, 'Python编程,机器学习,教程,前沿科技', '/covers/python-ml.jpg', 'Python机器学习入门指南，从零开始学习机器学习基础知识', NULL, NULL, 'Python机器学习入门教程', 'python-ml-001', 'post/content/python-ml-001.json', '2024-03-10 14:30:00', '2024-03-10 14:30:00', 516, 30, 150, 80, 1, 0, 1, 1, 1, 0);
INSERT INTO `post` VALUES (3, 3, NULL, '论文写作,科研方法', '/covers/paper-writing.jpg', '分享学术论文写作技巧和经验', NULL, NULL, '如何写好一篇学术论文', 'paper-writing-001', 'post/content/paper-writing-001.json', '2024-03-12 16:45:00', '2024-03-12 16:45:00', 306, 20, 80, 40, 1, 0, 0, 1, 1, 0);
INSERT INTO `post` VALUES (4, 5, NULL, '提问,帮助', NULL, '新手提问：关于平台使用的一些疑问', NULL, NULL, '【新手提问】平台使用问题', 'question-001', 'post/content/question-001.json', '2024-03-15 09:00:00', '2024-03-15 09:00:00', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `post` VALUES (5, 3, 9, '数据分析,可视化', '/covers/data-viz-draft.jpg', '数据可视化最佳实践与案例分析', NULL, NULL, '【草稿】数据可视化实践指南', 'data-viz-001', 'post/content/data-viz-001.json', NULL, '2024-03-14 20:30:00', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `post` VALUES (6, 3, NULL, '讨论', NULL, '已删除的测试帖子', NULL, NULL, '测试帖子', 'test-001', 'post/content/test-001.json', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 10, 0, 0, 0, 1, 0, 0, 1, 1, 1);
INSERT INTO `post` VALUES (7, 2, 1, '公告,规范,指南', '/images/covers/guide-cover.jpg', '社区规范与发帖指南，所有用户必读', NULL, NULL, '【置顶】社区规范与发帖指南', 'guide-content-001', '/posts/guide/content.html', '2024-03-01 09:00:00', '2024-03-15 10:00:00', 1011, 50, 200, 100, 1, 1, 1, 1, 1, 0);
INSERT INTO `post` VALUES (8, 3, 2, 'Python,机器学习,教程', '/images/covers/python-ml.jpg', '从零开始学习Python机器学习，包含详细代码示例', 'https://python.org', 1, 'Python机器学习入门教程', 'python-ml-001', '/posts/python/machine-learning.html', '2024-03-10 14:00:00', '2024-03-15 16:00:00', 502, 30, 150, 82, 1, 0, 1, 1, 1, 0);
INSERT INTO `post` VALUES (9, 5, 3, '学术,论文,写作', '/images/covers/academic-writing.jpg', '详细讲解学术论文的写作方法和技巧', 'DOI: 10.1234/example', NULL, '如何写好一篇学术论文', 'academic-001', '/posts/academic/paper-writing.html', '2024-03-12 11:00:00', '2024-03-15 15:00:00', 305, 20, 80, 40, 1, 0, 1, 1, 1, 0);
INSERT INTO `post` VALUES (10, 5, 2, 'Python,数据分析', '/images/covers/data-analysis.jpg', 'Python数据分析实战案例', NULL, NULL, 'Python数据分析实战', 'python-data-001', '/posts/python/data-analysis.html', '2024-03-15 09:00:00', '2024-03-15 09:00:00', 1, 0, 0, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `post` VALUES (11, 3, 2, '学习笔记', '/images/covers/notes.jpg', '个人学习笔记和心得', NULL, NULL, '个人学习笔记', 'notes-001', '/posts/notes/personal.html', '2024-03-14 16:00:00', '2024-03-14 16:00:00', 11, 0, 0, 0, 1, 0, 0, 0, 1, 0);
INSERT INTO `post` VALUES (12, 9, 2, '测试', '/images/covers/test.jpg', '测试帖子', NULL, NULL, '测试帖子', 'test-001', '/posts/test/content.html', '2025-01-07 10:00:00', '2025-01-07 16:45:38', 0, 0, 0, 0, 1, 0, 0, 1, 1, 1);
INSERT INTO `post` VALUES (13, 2, 1, '公告,规范,指南', '/images/covers/guide-cover.jpg', '社区规范与发帖指南，所有用户必读', NULL, NULL, '【置顶】社区规范与发帖指南', 'guide-content-001', '/posts/guide/content.html', '2024-03-01 09:00:00', '2024-03-15 10:00:00', 1001, 50, 200, 100, 1, 1, 1, 1, 1, 0);
INSERT INTO `post` VALUES (14, 3, 2, 'Python,机器学习,教程', '/images/covers/python-ml.jpg', '从零开始学习Python机器学习，包含详细代码示例', 'https://python.org', 1, 'Python机器学习入门教程', 'python-ml-001', '/posts/python/machine-learning.html', '2024-03-10 14:00:00', '2024-03-15 16:00:00', 502, 30, 150, 80, 1, 0, 1, 1, 1, 0);
INSERT INTO `post` VALUES (15, 5, 3, '学术,论文,写作', '/images/covers/academic-writing.jpg', '详细讲解学术论文的写作方法和技巧', 'DOI: 10.1234/example', NULL, '如何写好一篇学术论文', 'academic-001', '/posts/academic/paper-writing.html', '2024-03-12 11:00:00', '2024-03-15 15:00:00', 309, 20, 80, 40, 1, 0, 1, 1, 1, 0);
INSERT INTO `post` VALUES (16, 5, 2, 'Python,数据分析', '/images/covers/data-analysis.jpg', 'Python数据分析实战案例', NULL, NULL, 'Python数据分析实战', 'python-data-001', '/posts/python/data-analysis.html', '2024-03-15 09:00:00', '2024-03-15 09:00:00', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `post` VALUES (17, 3, 2, '学习笔记', '/images/covers/notes.jpg', '个人学习笔记和心得', NULL, NULL, '个人学习笔记', 'notes-001', '/posts/notes/personal.html', '2024-03-14 16:00:00', '2024-03-14 16:00:00', 6, 0, 0, 0, 1, 0, 0, 0, 1, 0);
INSERT INTO `post` VALUES (18, 3, 2, '测试', '/images/covers/test.jpg', '测试帖子', NULL, NULL, '测试帖子', 'test-001', '/posts/test/content.html', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 0, 0, 0, 0, 1, 0, 0, 1, 1, 1);
INSERT INTO `post` VALUES (23, 18, 1, '1,2', NULL, '去微软', NULL, NULL, '去微软', '', '', '2025-01-10 16:47:34', '2025-01-10 18:06:06', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 1);
INSERT INTO `post` VALUES (24, 18, 1, '1,2', NULL, 'qwerqwerwqerqwerewrqwerweq', NULL, NULL, 'qwerwe q', '', '', '2025-01-10 16:59:21', '2025-01-10 18:06:07', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (25, 18, 1, '1,2', NULL, 'qwerweqrwqerweqrqwer', NULL, NULL, 'qwerwqerwqer', '', '', '2025-01-10 16:59:45', '2025-01-10 18:06:10', 10, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (26, 18, 1, '机器学习, Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', '', '', '2025-01-10 17:39:40', '2025-01-10 18:06:04', 5, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (27, 18, 1, '机器学习,  Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', 'content-18-5c4ea7ce-22b3-4eae-91b1-980830d44e3b', 'post/content/5ffd0904-caf3-4ea2-9915-3905215c86b7.html', '2025-01-10 18:02:44', '2025-01-10 18:06:12', 3, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (28, 18, 1, '机器学习,   Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', 'content-18-f9b00361-1ba0-4725-a449-f03d64276a7c', 'post/content/5792a85b-a725-4897-9560-6f48a48c68f3.html', '2025-01-10 18:05:59', '2025-01-10 21:51:11', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (29, 18, 1, '机器学习,    Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', 'content-18-7ad785b9-513f-4579-b23a-fec58313669b', 'post/content/b96a0e46-3eca-4c3c-bd15-88314d63a594.html', '2025-01-10 18:06:14', '2025-01-10 21:51:12', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (30, 18, 1, '机器学习,     Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', 'content-18-b75ae289-4948-4685-94da-572f057c886c', 'post/content/32232826-0810-40a4-b551-001798562bac.html', '2025-01-10 18:06:30', '2025-01-10 21:51:14', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (31, 18, 1, '机器学习,      Python编程', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/f72691e85791453f99557619895d14a1.jpg', 'sadfasdf', NULL, NULL, 'asdf ', 'content-18-e7cfddbe-74a3-40e6-90a5-4c12ddfdd2a3', 'post/content/aaa28ece-1efc-4081-882e-bf8f45979e72.html', '2025-01-10 21:45:12', '2025-01-10 21:45:12', 11, 1, 0, 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `post` VALUES (32, 18, 1, '机器学习', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/dbbd5220708a489eb05ea18baecbd0b8.jpg', '123213', NULL, NULL, '123asdfsda', 'content-18-d4638e96-2b92-48e9-a267-41d8319cab9b', 'post/content/a6633dac-9022-4a78-b367-2212f76c2233.html', '2025-01-10 21:55:32', '2025-01-11 01:06:46', 143, 7, 1, 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `post` VALUES (33, 18, 1, '机器学习', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/10/dbbd5220708a489eb05ea18baecbd0b8.jpg', '123213', NULL, NULL, '123asdfsda', 'content-18-35e444f1-112b-40ed-a984-de42f7cb605a', 'post/content/6bc15b72-b085-4369-820b-3e34ee89ac46.html', '2025-01-11 00:58:16', '2025-01-11 01:04:58', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (34, 18, 1, 'Python编程, 前端开发', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/11/cb775e428e574111b41faca204f6006c.jpg', '教你如何快速创建一个spingboot项目', NULL, NULL, '快速创建一个SpringBoot项目', 'content-18-6160351f-2d39-4679-ac30-807ec6b60272', 'post/content/9b53adfb-e488-48c7-8ca5-96250dec29ae.html', '2025-01-11 01:13:39', '2025-01-11 01:19:14', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `post` VALUES (35, 18, 1, 'Python编程,  前端开发', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/11/cb775e428e574111b41faca204f6006c.jpg', '教你如何快速创建一个spingboot项目', NULL, NULL, '快速创建一个SpringBoot项目', 'content-18-ec22bd7c-7c10-4762-b93a-cde86172ca9d', 'post/content/dc586369-6595-4a54-b449-a50b3eef61fb.html', '2025-01-11 01:13:49', '2025-01-11 01:19:16', 2, 0, 0, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `post` VALUES (36, 18, 1, 'Python编程,    前端开发', 'http://jg85768183.vicp.fun:30562/images/user_18/2025/01/11/fbc8a8c8e6bc45d78850e24d16cdce21.jpg', '教你如何快速创建一个spingboot项目', NULL, NULL, '快速创建一个SpringBoot项目', 'content-18-5a948f9e-89e3-4548-90a2-baeaafab8f89', 'post/content/d437af44-7419-4a36-a407-c9be85eb1456.html', '2025-01-11 01:19:02', '2025-01-11 01:19:21', 89, 2, 1, 4, 0, 0, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条举报记录，即举报ID（report_id）',
  `user_id` bigint NULL DEFAULT NULL COMMENT '进行举报的用户ID，外键，关联用户实体（User）的id',
  `reported_content_id` bigint NULL DEFAULT NULL COMMENT '被举报的内容ID，具体取决于被举报的对象类型',
  `reported_type_id` bigint NULL DEFAULT NULL COMMENT '标识被举报内容的类型，外键，关联举报对象类型实体（ReportedType）的id',
  `report_type_id` bigint NULL DEFAULT NULL COMMENT '标识举报的类型，外键，关联举报类型实体（ReportType）的id',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户举报的具体理由或描述',
  `report_time` datetime NULL DEFAULT NULL COMMENT '用户提交举报的时间',
  `status` int NULL DEFAULT NULL COMMENT '举报的处理状态，0：待处理，1：正在处理，2：已处理，3：无需处理',
  `outcome` int NULL DEFAULT NULL COMMENT '举报处理的结果，0：无行动，1：内容已删除，2：警告用户，3：用户禁言，4：用户封禁',
  `is_deleted` int NULL DEFAULT NULL COMMENT '区分位，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_r_user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_r_reported_type_id`(`reported_type_id` ASC) USING BTREE,
  INDEX `fk_r_report_type_id`(`report_type_id` ASC) USING BTREE,
  INDEX `idx_r_report_time`(`report_time` ASC) USING BTREE,
  CONSTRAINT `fk_r_report_type_id` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_r_reported_type_id` FOREIGN KEY (`reported_type_id`) REFERENCES `reported_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_r_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, 3, 1, 1, 1, '该帖子内容包含大量推广链接，疑似垃圾广告', '2024-03-10 14:30:00', 0, 0, 0);
INSERT INTO `report` VALUES (2, 5, 2, 1, 5, '发现该帖子内容与某论文高度相似，疑似抄袭', '2024-03-15 09:20:00', 0, NULL, 0);
INSERT INTO `report` VALUES (3, 3, 1, 2, 2, '该评论包含侮辱性语言，影响社区氛围', '2024-03-14 16:45:00', 2, 2, 0);
INSERT INTO `report` VALUES (4, 2, 2, 2, 3, '评论中包含违法信息', '2024-03-15 10:30:00', 1, NULL, 0);
INSERT INTO `report` VALUES (5, 3, 4, 3, 11, '该用户频繁发布相同内容，扰乱社区秩序', '2024-03-13 11:20:00', 2, 3, 0);
INSERT INTO `report` VALUES (6, 5, 4, 3, 10, '该用户疑似冒充他人身份', '2024-03-15 15:40:00', 2, 4, 0);
INSERT INTO `report` VALUES (7, 3, 3, 1, 14, '测试举报', '2024-02-01 10:00:00', 2, 0, 1);
INSERT INTO `report` VALUES (8, 9, 1, 1, 2, '测试徐磊', '2025-01-07 15:40:00', 2, 0, 0);
INSERT INTO `report` VALUES (9, 9, 1, 2, 1, '测试', '2025-01-07 16:22:00', 0, 0, 0);
INSERT INTO `report` VALUES (10, 18, 32, 1, 1, '涉黄', '2025-01-10 22:34:41', 0, 0, 0);
INSERT INTO `report` VALUES (11, 18, 14, 2, 1, '不太行', '2025-01-11 00:37:47', 0, 0, 0);
INSERT INTO `report` VALUES (12, 18, 36, 1, 2, '', '2025-01-11 20:41:41', 0, 0, 0);
INSERT INTO `report` VALUES (13, 18, 40, 2, 1, '', '2025-01-11 20:53:01', 0, 0, 0);

-- ----------------------------
-- Table structure for report_type
-- ----------------------------
DROP TABLE IF EXISTS `report_type`;
CREATE TABLE `report_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个举报类型，即举报类型ID（report_type_id）',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '举报类型的名称，如不当言论、色情内容、抄袭、欺诈行为等',
  `type_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对举报类型进行详细描述，包括该类型的具体定义和举报标准',
  `is_active` int NULL DEFAULT NULL COMMENT '区分位，1表示启用，0表示未启用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rt_type_name`(`type_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_type
-- ----------------------------
INSERT INTO `report_type` VALUES (1, '垃圾广告', '发布垃圾广告、营销信息、钓鱼链接等垃圾信息内容', 1);
INSERT INTO `report_type` VALUES (2, '不当言论', '包含辱骂、歧视、挑衅、人身攻击等不当言论', 1);
INSERT INTO `report_type` VALUES (3, '违法信息', '发布涉及违法犯罪、暴力恐怖等违法信息', 1);
INSERT INTO `report_type` VALUES (4, '色情内容', '发布色情、低俗、暴露等不适宜内容', 1);
INSERT INTO `report_type` VALUES (5, '抄袭剽窃', '未经授权复制、抄袭他人的学术成果或内容', 1);
INSERT INTO `report_type` VALUES (6, '虚假信息', '发布虚假学术成果、伪造数据或实验结果', 1);
INSERT INTO `report_type` VALUES (7, '学术造假', '篡改、伪造研究数据、实验结果或其他学术信息', 1);
INSERT INTO `report_type` VALUES (8, '侵犯版权', '未经授权使用他人享有著作权的作品', 1);
INSERT INTO `report_type` VALUES (9, '侵犯隐私', '未经许可披露他人个人隐私信息', 1);
INSERT INTO `report_type` VALUES (10, '盗用身份', '冒充他人身份或盗用他人账号信息', 1);
INSERT INTO `report_type` VALUES (11, '恶意刷屏', '重复发布相同内容或频繁发帖影响平台秩序', 1);
INSERT INTO `report_type` VALUES (12, '恶意举报', '无正当理由恶意举报他人内容', 1);
INSERT INTO `report_type` VALUES (13, '账号异常', '账号存在异常操作或可疑行为', 1);
INSERT INTO `report_type` VALUES (14, '其他违规', '其他违反平台规则但未列入以上类型的行为', 1);
INSERT INTO `report_type` VALUES (15, '已废弃类型', '历史遗留的举报类型，已不再使用', 0);

-- ----------------------------
-- Table structure for reported_type
-- ----------------------------
DROP TABLE IF EXISTS `reported_type`;
CREATE TABLE `reported_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个举报对象类型，即举报对象类型ID（reported_type_id）',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '举报对象类型的名称，如帖子、评论、用户等',
  `type_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对举报对象类型进行详细描述，包括该类型的对象范围和特点',
  `is_active` int NULL DEFAULT NULL COMMENT '区分位，1表示启用，0表示未启用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rpt_type_name`(`type_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reported_type
-- ----------------------------
INSERT INTO `reported_type` VALUES (1, '帖子', '针对平台上发布的帖子内容进行举报，包括帖子的标题、正文内容、图片等所有帖子相关内容', 1);
INSERT INTO `reported_type` VALUES (2, '评论', '针对帖子下的评论内容进行举报，包括主评论及其回复评论', 1);
INSERT INTO `reported_type` VALUES (3, '用户', '针对用户账号进行举报，包括用户的个人资料、头像以及整体行为', 1);
INSERT INTO `reported_type` VALUES (4, '其他内容', '历史遗留的举报对象类型，已不再使用', 0);

-- ----------------------------
-- Table structure for review_log
-- ----------------------------
DROP TABLE IF EXISTS `review_log`;
CREATE TABLE `review_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条审核记录',
  `content_id` bigint NOT NULL COMMENT '被审核内容的ID，可能是用户、帖子、合集或收藏夹的ID',
  `content_type` int NOT NULL COMMENT '被审核内容的类型，0表示用户，1表示帖子，2表示合集，3表示收藏夹',
  `reviewer_id` bigint NOT NULL COMMENT '审核人的ID，关联到用户表（user）的id',
  `review_status` int NOT NULL COMMENT '审核状态，0表示待审核，1表示已通过，2表示已拒绝',
  `review_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核发生的时间',
  `review_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '审核备注或说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reviewer_id`(`reviewer_id` ASC) USING BTREE,
  INDEX `idx_content`(`content_id` ASC, `content_type` ASC) USING BTREE,
  INDEX `idx_review_status`(`review_status` ASC) USING BTREE,
  CONSTRAINT `review_log_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_log
-- ----------------------------
INSERT INTO `review_log` VALUES (1, 2, 1, 2, 0, '2025-01-08 10:18:42', '内容符合规范，通过审核');
INSERT INTO `review_log` VALUES (2, 4, 1, 2, 0, '2024-03-15 14:30:00', '待审核');
INSERT INTO `review_log` VALUES (3, 5, 0, 2, 1, '2024-03-14 16:00:00', '用户资料完整，通过审核');
INSERT INTO `review_log` VALUES (4, 4, 0, 2, 2, '2024-03-13 09:00:00', '存在违规行为，拒绝审核');
INSERT INTO `review_log` VALUES (5, 1, 2, 2, 1, '2024-03-15 11:30:00', '合集内容规范，通过审核');
INSERT INTO `review_log` VALUES (6, 2, 2, 2, 0, '2024-03-15 15:00:00', '待审核');
INSERT INTO `review_log` VALUES (7, 1, 3, 2, 1, '2024-03-15 13:00:00', '收藏夹内容合规，通过审核');
INSERT INTO `review_log` VALUES (8, 2, 3, 2, 2, '2024-03-15 13:30:00', '收藏夹包含不当内容，拒绝审核');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个分区，自增',
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分区的名称，用于用户识别和展示',
  `section_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分区的详细描述，可以包含分区的主题、目的和包含内容的概述',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '分区创建的时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '分区信息最后一次更新的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '表示分区是否被删除，1表示是，0表示否',
  `visibility` int NULL DEFAULT NULL COMMENT '分区的可见性，0表示隐藏，1表示公开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES (1, '计算机科学', '讨论编程、算法、人工智能、软件开发等计算机相关话题。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (2, '电子工程', '交流电子技术、集成电路、嵌入式系统等相关内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (3, '机械工程', '分享机械设计、自动化、工业制造等领域的研究与讨论。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (4, '经济金融', '探讨经济学理论、金融市场、投资理财等相关话题。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (5, '文学艺术', '交流文学创作、艺术鉴赏、文化研究等内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (6, '历史研究', '讨论历史事件、历史人物、考古发现等相关内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (7, '生物医学', '交流生物技术、医学研究、药物开发等相关话题。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (8, '环境科学', '讨论环境保护、生态系统、可持续发展等相关内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (9, '数据科学', '探讨数据分析、统计建模、机器学习等跨学科话题。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (10, '认知科学', '研究心理学、神经科学、人工智能等交叉领域内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (11, '考研交流', '分享考研经验、资料、院校信息等实用内容。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);
INSERT INTO `section` VALUES (12, '科研方法', '交流论文写作、实验设计、研究方法等学术技能。', '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0, 1);

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个分享记录，自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '进行分享的用户ID，外键，关联用户实体（User）',
  `share_object_id` bigint NULL DEFAULT NULL COMMENT '被分享的对象ID，外键，关联对应的对象实体（如帖子、合集）',
  `share_object_type` int NULL DEFAULT NULL COMMENT '分享对象类型，1表示帖子，2表示合集',
  `share_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享内容生成的链接，用于追踪分享内容',
  `share_time` datetime NULL DEFAULT NULL COMMENT '用户分享的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '逻辑删除标识，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_share_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_share_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (1, 3, 2, 1, 'https://example.com/share/post/python-ml-tutorial?sid=abc123', '2024-03-15 10:30:00', 0);
INSERT INTO `share` VALUES (2, 5, 3, 1, 'https://example.com/share/post/academic-writing?sid=def456', '2024-03-15 11:20:00', 0);
INSERT INTO `share` VALUES (3, 2, 1, 1, 'https://example.com/share/post/community-guidelines?sid=ghi789', '2024-03-15 09:00:00', 0);
INSERT INTO `share` VALUES (4, 3, 1, 2, 'https://example.com/share/collection/python-series?sid=jkl012', '2024-03-14 16:45:00', 0);
INSERT INTO `share` VALUES (5, 5, 2, 2, 'https://example.com/share/collection/academic-writing-guide?sid=mno345', '2024-03-14 17:30:00', 0);
INSERT INTO `share` VALUES (6, 3, 2, 1, 'https://example.com/share/post/python-ml-tutorial?sid=pqr678', '2024-03-15 14:20:00', 0);
INSERT INTO `share` VALUES (7, 5, 1, 2, 'https://example.com/share/collection/python-series?sid=stu901', '2024-03-15 15:10:00', 0);
INSERT INTO `share` VALUES (8, 3, 6, 1, 'https://example.com/share/post/test?sid=vwx234', '2024-02-01 10:00:00', 1);
INSERT INTO `share` VALUES (9, 9, 1, 1, '/share/7fbffe18-2070-436e-b795-d910479b51fb', '2025-01-07 15:37:18', 0);
INSERT INTO `share` VALUES (10, 12, 2, 2, '/share/fbc7ef85-6561-4144-8185-38455eddc726', '2025-01-07 15:49:27', 0);
INSERT INTO `share` VALUES (19, 18, 36, 1, '/share/dddb582b-eea7-46b8-879d-4b9e473f204b', '2025-01-11 20:51:40', 0);
INSERT INTO `share` VALUES (20, 12, 8, 1, '/share/b238d333-8a88-4f50-9d2b-706ff5c3f374', '2025-01-14 22:54:46', 0);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个标签，自增',
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签的名称，用于用户识别和展示，应该是唯一的',
  `tag_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签的详细描述，可以包含标签所代表的主题或分类的额外信息',
  `section_id` bigint NULL DEFAULT NULL COMMENT '标签所属的分区ID，关联分区表section的id',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '标签创建的时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '标签信息最后一次更新的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '表示标签是否被删除，1表示是，0表示否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_t_section_id`(`section_id` ASC) USING BTREE,
  CONSTRAINT `fk_tag_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Python编程', 'Python语言相关的编程技术讨论和学习资源分享', 1, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (2, '机器学习', '机器学习算法、框架和应用实践的讨论', 1, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (3, '前端开发', 'Web前端技术、框架和开发经验分享', 1, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (4, '宏观经济', '宏观经济政策、经济形势分析讨论', 4, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (5, '投资理财', '个人投资、理财规划、金融市场分析', 4, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (6, '分子生物学', '分子生物学研究方法和最新进展讨论', 7, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (7, '临床医学', '临床医学研究和实践经验分享', 7, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (8, '考研数学', '考研数学复习经验和习题讨论', 11, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (9, '院校信息', '各高校考研招生信息和报考指南', 11, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (10, '论文写作', '学术论文写作技巧和经验分享', 12, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (11, '文献检索', '文献资料搜索和管理方法', 12, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (12, '数据分析', '数据分析方法、工具和实践案例', 9, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);
INSERT INTO `tag` VALUES (13, '深度学习', '深度学习模型、框架和应用实践', 9, '2023-01-01 00:00:00', '2024-03-15 10:00:00', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个用户，自增',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名，用户登录的名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码，存储时为加密后的密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐值，用于密码加密的盐值',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号，用户的手机号码',
  `registration_time` datetime NULL DEFAULT NULL COMMENT '注册时间，用户注册的时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间，用户最后一次登录的时间',
  `last_login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录地点，用户最后一次登录的地点',
  `last_updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间，用户资料最后一次更新的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '区分位，表示用户账户是否被删除，1表示是，0表示否',
  `is_admin` int NULL DEFAULT NULL COMMENT '区分位，表示用户是否是管理员，1表示是，0表示否',
  `is_frozen` int NULL DEFAULT NULL COMMENT '区分位，表示用户账户是否被冻结，1表示是，0表示否',
  `permission_level` int NULL DEFAULT NULL COMMENT '权限限制等级，0：正常；1：禁止评论；2：禁止发帖等，具体等级定义根据业务需求确定',
  `gender` int NULL DEFAULT NULL COMMENT '性别，0：男，1：女，2：其他，具体定义可根据业务需求扩展',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生日期，用户的出生日期',
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介，用户个人简介或自我描述',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像，用户头像的路径或URL',
  `following_count` int NULL DEFAULT NULL COMMENT '关注数，用户关注的用户数量',
  `followers_count` int NULL DEFAULT NULL COMMENT '粉丝数，用户的粉丝数量',
  `review_status` int NULL DEFAULT NULL COMMENT '审核状态，0：待审核，1：已通过，2：已拒绝',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uniq_u_username`(`username` ASC) USING BTREE,
  INDEX `idx_u_last_login_time`(`last_login_time` ASC) USING BTREE,
  INDEX `idx_u_last_updated_time`(`last_updated_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'asd', '{bcrypt}$2a$10$Z2mm.XVVp8UCLaADZ9l3uuWLHnQESL9Zh.k9YlXdnR8depTDzsUzm', 'f0508cd009f84422b0fd8c791aef16ef', '13514995984', '2025-01-03 11:33:02', NULL, NULL, '2025-01-03 11:33:02', 0, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'abc123', '13800138000', '2023-01-01 00:00:00', '2024-03-15 10:30:00', '北京', '2024-03-15 10:30:00', 0, 1, 0, 0, 0, '1990-01-01', '系统管理员', '/avatars/admin.jpg', 0, 100, 1, 'admin@example.com');
INSERT INTO `user` VALUES (3, 'zhang_san', 'e10adc3949ba59abbe56e057f20f883e', 'def456', '13911112222', '2023-06-15 14:20:00', '2024-03-14 18:45:00', '上海', '2024-02-28 16:30:00', 0, 0, 0, 0, 0, '1995-05-15', '热爱生活，热爱分享', '/avatars/zhangsan.jpg', 50, 30, 1, 'zhangsan@example.com');
INSERT INTO `user` VALUES (4, 'frozen_user', 'e10adc3949ba59abbe56e057f20f883e', 'ghi789', '13922223333', '2023-08-20 09:15:00', '2024-01-10 20:15:00', '广州', '2024-01-10 20:15:00', 0, 0, 1, 2, 1, '1992-12-25', '账号已被冻结', '/avatars/default.jpg', 10, 5, 1, 'frozen@example.com');
INSERT INTO `user` VALUES (5, 'new_user', 'e10adc3949ba59abbe56e057f20f883e', 'jkl012', '13933334444', '2024-03-14 16:00:00', '2024-03-14 16:00:00', '深圳', '2024-03-14 16:00:00', 0, 0, 0, 0, 2, '1998-08-08', '新用户求关注', '/avatars/new_user.jpg', 0, 0, 0, 'newuser@example.com');
INSERT INTO `user` VALUES (6, 'deleted_user', 'e10adc3949ba59abbe56e057f20f883e', 'mno345', '13944445555', '2023-03-01 08:00:00', '2023-12-31 23:59:59', '武汉', '2024-01-01 00:00:00', 1, 0, 0, 0, 1, '1994-03-21', '这个用户已被删除', '/avatars/deleted.jpg', 20, 15, 1, 'deleted@example.com');
INSERT INTO `user` VALUES (7, '干凤英', '{bcrypt}$2a$10$b5za3tV8.Mgkq3nMVgWq0uHClEh2yDU1J/6cMXfd3MfhesegKzeyO', '9e24e9bcc7414e1181d0f8adecf3835a', '19977586497', '2025-01-07 14:35:53', NULL, NULL, '2025-01-07 14:35:53', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (8, 'lijian', '{bcrypt}$2a$10$f0nf0I8CCqHedZEnki4NcuIt7JpcHYwSp3kuEilAXN4.nzLf8sEcG', '4f76c6952fdd4fad81a23dab1c030882', '15283257418', '2025-01-07 14:40:02', '2024-08-06 20:12:05', '本地主机', '2025-01-07 15:35:28', 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (9, 'test1', '{bcrypt}$2a$10$jG1NH5MRAxX9iXwbqPOwcucA3DYh.mdwsTVYhr2oa66uQMgWJseIS', 'dac7231f232d4f3f93f4538e42ddf914', '14444445555', '2025-01-07 14:45:42', '2025-01-15 11:42:06', '本地主机', '2025-01-15 11:42:06', 0, 1, 0, 0, 0, NULL, '1111啊', 'http://jg85768183.vicp.fun:30562/avatars/avatar_9_1736408895863.jpg', 0, 0, 1, NULL);
INSERT INTO `user` VALUES (10, 'huazihan', '{bcrypt}$2a$10$J.EbKTOzgaojAhIMzZd2ke52ywpkYugtIb5Fb.91kcHKKoiwn1QKi', '85af83777f8d4fce902888ed1b6c1c3e', '13217135795', '2025-01-07 14:55:42', '2025-01-08 22:51:52', '本地主机', '2025-01-08 22:51:52', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (11, 'huazihan1', '{bcrypt}$2a$10$nHoezS.TP3WXgNsUytZxT.jipjZJtvTaddhq53/Hb.KJp6TU4WCbe', 'f7a6b1e080b2494eb31598ffec9b2017', '1321713792', '2025-01-07 15:00:32', NULL, NULL, '2025-01-07 15:00:32', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (12, 'glj', '{bcrypt}$2a$10$R/ZGfVRvZJliCJU/5I7t0O/UL2foPtlDjBYwq8NoOkGdLybZKuNEe', '5eab24ac11044b65b18b5b08601bd6b7', '13013060229', '2025-01-07 15:15:15', '2025-01-15 12:01:48', '本地主机', '2025-01-15 12:01:48', 0, 1, 0, 0, 0, NULL, '', 'http://jg85768183.vicp.fun:30562/avatars/avatar_12_1736866006595.png', 0, 0, 1, NULL);
INSERT INTO `user` VALUES (13, 'test2', '{bcrypt}$2a$10$pEz4MblrCp3xoXZIDjHJb./KTLhQZLFpGi780ig6J5TELb/fgn3Wa', '79c845fb64844ccfaeb3ffa7094c8583', '13333333333', '2025-01-07 15:33:09', '2025-01-07 15:33:16', '本地主机', '2025-01-07 15:33:16', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (14, '巫一全 巫一全', NULL, NULL, '18485517871', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, '2025-05-09', NULL, 'https://avatars.githubusercontent.com/u/15889365', NULL, NULL, 1, 'lzbmd210@tom.com');
INSERT INTO `user` VALUES (15, '夕敬阳', '{bcrypt}$2a$10$IMzSsH5TN/MZe8AvIqklZeMX7Brtfe8EkvlHzOxnwXkGmspKEYCou', 'a8f7253f0cc940c6b3469b54915c9099', '14827463307', '2025-01-09 09:57:05', NULL, NULL, '2025-01-09 09:57:05', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (16, 'ly', '{bcrypt}$2a$10$ty8Or6yqYF.KZ1kpoYml8e1/HeqWh1gQHd2NT.tvOsT9ry9KtAO9G', '3d21034d71674815b167779b409c59f2', '18296990970', '2025-01-09 10:19:56', NULL, NULL, '2025-01-09 10:19:56', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (17, 'lly', '{bcrypt}$2a$10$UUsSEt7uYv2P0fXztkaWjutK/MmM4p3dKhcovtG4Jj8/vPOR8ZxF6', '70b24880f96a43d78f8ace6d1e2f8852', '18296990971', '2025-01-09 10:23:09', NULL, NULL, '2025-01-09 10:23:09', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (18, 'llyy', '{bcrypt}$2a$10$r8tOzVKMTJQX1exV/rrIA.GHYl8/PqXBxB1Mrmc/6BUAcwSEMynga', '9b408695c59b4ba2b4e98d6d4d0c1f42', '18296990972', '2025-01-09 10:24:18', '2025-01-15 11:38:08', '本地主机', '2025-01-15 11:38:08', 0, 0, 0, 0, 1, NULL, 'aa', 'http://jg85768183.vicp.fun:30562/avatars/avatar_18_1736430912793.jpg', 0, 0, 1, '1324888434@qq.com');
INSERT INTO `user` VALUES (19, '1234', '{bcrypt}$2a$10$X6hLkQyYwePBnLt7NFMx3OyaWefNygWBgISwXmK0JNePr7E/UVOgm', '24ed14b3717f41acabc5fabba16e7391', '9876543210', '2025-01-11 22:42:27', NULL, NULL, '2025-01-11 22:42:27', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (20, 'luoy', 'qwerqwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1324888434@qq.com');
INSERT INTO `user` VALUES (21, 'qwer', 'qwerqwer', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `user` VALUES (22, 'new_admin', 'qwerqwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1324888434@qq.com');
INSERT INTO `user` VALUES (28, 'glasa', '{bcrypt}$2a$10$Nh.SAvwo9ky3uujaYwOdu.Rk/vtkEtpRQw7oBAR9FRxdzyFd/8c2S', '7993a0bcb3ad48a8a1ac08eae3245212', NULL, '2025-01-13 16:36:46', NULL, NULL, '2025-01-13 16:36:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, '');
INSERT INTO `user` VALUES (29, 'asdasd', '{bcrypt}$2a$10$COj1CUrpF/elB/uxa1I9tOWP5qjuMVqrkFfvzjF5BdyD68XayRY2G', 'fc191da5e9734f288b47c5d2c17c18e1', NULL, '2025-01-13 16:52:24', NULL, NULL, '2025-01-13 16:52:24', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, '');
INSERT INTO `user` VALUES (30, 'asdas1d', '{bcrypt}$2a$10$U8XiYd8gvp6.cIJPZXbkYek8wuCCJGLVjnqGGbx/UNh/LH8MHlYf6', '71d4bdf4c1114ead8e23f1359f3f5c67', NULL, '2025-01-13 17:10:05', NULL, NULL, '2025-01-13 17:10:05', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `user` VALUES (31, '嵇军_嵇军', '{bcrypt}$2a$10$tVbhNn7hw3kRnOGrumBame7GXvwu.Dtg5guKLC2WcGqp762xcxhHC', '1dbc1bc50f934b039d4d08cd43f8e3ef', '13830669106', '2025-01-13 17:23:35', NULL, NULL, '2025-01-13 17:23:35', 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS `view`;
CREATE TABLE `view`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一条浏览记录',
  `user_id` bigint NULL DEFAULT NULL COMMENT '进行浏览的用户ID，外键，关联用户表的id',
  `post_id` bigint NULL DEFAULT NULL COMMENT '被浏览的帖子ID，外键，关联帖子表的id',
  `view_time` datetime NULL DEFAULT NULL COMMENT '用户浏览帖子的时间',
  `is_deleted` int NULL DEFAULT NULL COMMENT '区分位，1表示已删除，0表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_v_view_time`(`view_time` ASC) USING BTREE,
  INDEX `fk_view_user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_view_post_id`(`post_id` ASC) USING BTREE,
  CONSTRAINT `fk_view_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_view_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO `view` VALUES (1, 3, 1, '2024-03-15 09:00:00', 0);
INSERT INTO `view` VALUES (2, 3, 3, '2024-03-15 09:30:00', 0);
INSERT INTO `view` VALUES (3, 3, 2, '2024-03-15 10:15:00', 0);
INSERT INTO `view` VALUES (4, 5, 1, '2024-03-14 16:00:00', 0);
INSERT INTO `view` VALUES (5, 5, 2, '2024-03-14 16:30:00', 0);
INSERT INTO `view` VALUES (6, 5, 3, '2024-03-14 17:00:00', 0);
INSERT INTO `view` VALUES (7, 2, 2, '2024-03-15 11:00:00', 0);
INSERT INTO `view` VALUES (8, 2, 4, '2024-03-15 11:30:00', 0);
INSERT INTO `view` VALUES (9, 3, 2, '2024-03-15 14:20:00', 0);
INSERT INTO `view` VALUES (10, 5, 1, '2024-03-15 15:00:00', 0);
INSERT INTO `view` VALUES (11, 3, 6, '2024-02-01 10:00:00', 1);
INSERT INTO `view` VALUES (12, 9, 1, '2025-01-07 15:36:53', 0);
INSERT INTO `view` VALUES (13, 9, 1, '2025-01-08 19:59:37', 0);
INSERT INTO `view` VALUES (14, 9, 1, '2025-01-08 19:59:47', 0);
INSERT INTO `view` VALUES (15, 9, 1, '2025-01-08 20:00:03', 0);
INSERT INTO `view` VALUES (16, 18, 1, '2025-01-10 14:59:19', 0);
INSERT INTO `view` VALUES (17, 18, 14, '2025-01-10 15:20:34', 0);
INSERT INTO `view` VALUES (18, 18, 14, '2025-01-10 15:20:34', 0);
INSERT INTO `view` VALUES (20, 18, 15, '2025-01-10 15:20:52', 0);
INSERT INTO `view` VALUES (21, 18, 15, '2025-01-10 15:20:52', 0);
INSERT INTO `view` VALUES (22, 18, 15, '2025-01-10 15:20:52', 0);
INSERT INTO `view` VALUES (23, 18, 15, '2025-01-10 15:26:17', 0);
INSERT INTO `view` VALUES (24, 18, 15, '2025-01-10 15:26:17', 0);
INSERT INTO `view` VALUES (26, 18, 15, '2025-01-10 15:28:37', 0);
INSERT INTO `view` VALUES (27, 18, 15, '2025-01-10 15:28:37', 0);
INSERT INTO `view` VALUES (29, 18, 11, '2025-01-10 15:29:07', 0);
INSERT INTO `view` VALUES (30, 18, 11, '2025-01-10 15:29:07', 0);
INSERT INTO `view` VALUES (31, 18, 11, '2025-01-10 15:29:07', 0);
INSERT INTO `view` VALUES (32, 18, 7, '2025-01-10 15:29:58', 0);
INSERT INTO `view` VALUES (33, 18, 7, '2025-01-10 15:29:58', 0);
INSERT INTO `view` VALUES (34, 18, 7, '2025-01-10 15:29:58', 0);
INSERT INTO `view` VALUES (35, 18, 3, '2025-01-10 15:30:05', 0);
INSERT INTO `view` VALUES (36, 18, 3, '2025-01-10 15:30:05', 0);
INSERT INTO `view` VALUES (38, 18, 7, '2025-01-10 15:30:13', 0);
INSERT INTO `view` VALUES (39, 18, 7, '2025-01-10 15:30:13', 0);
INSERT INTO `view` VALUES (42, 18, 7, '2025-01-10 15:30:29', 0);
INSERT INTO `view` VALUES (44, 18, 2, '2025-01-10 16:06:12', 0);
INSERT INTO `view` VALUES (47, 18, 3, '2025-01-10 16:06:51', 0);
INSERT INTO `view` VALUES (49, 18, 3, '2025-01-10 16:06:51', 0);
INSERT INTO `view` VALUES (50, 18, 23, '2025-01-10 16:47:41', 0);
INSERT INTO `view` VALUES (51, 18, 23, '2025-01-10 16:48:35', 0);
INSERT INTO `view` VALUES (52, 18, 23, '2025-01-10 16:51:16', 0);
INSERT INTO `view` VALUES (53, 18, 23, '2025-01-10 16:51:27', 0);
INSERT INTO `view` VALUES (54, 18, 23, '2025-01-10 16:52:41', 0);
INSERT INTO `view` VALUES (55, 18, 23, '2025-01-10 16:53:00', 0);
INSERT INTO `view` VALUES (56, 18, 25, '2025-01-10 17:00:08', 0);
INSERT INTO `view` VALUES (57, 18, 25, '2025-01-10 17:00:20', 0);
INSERT INTO `view` VALUES (58, 18, 25, '2025-01-10 17:07:25', 0);
INSERT INTO `view` VALUES (59, 18, 25, '2025-01-10 17:07:34', 0);
INSERT INTO `view` VALUES (60, 18, 25, '2025-01-10 17:27:09', 0);
INSERT INTO `view` VALUES (61, 18, 25, '2025-01-10 17:27:18', 0);
INSERT INTO `view` VALUES (62, 18, 25, '2025-01-10 17:27:25', 0);
INSERT INTO `view` VALUES (63, 18, 25, '2025-01-10 17:30:26', 0);
INSERT INTO `view` VALUES (64, 18, 25, '2025-01-10 17:31:09', 0);
INSERT INTO `view` VALUES (65, 18, 24, '2025-01-10 17:31:19', 0);
INSERT INTO `view` VALUES (66, 18, 25, '2025-01-10 17:31:31', 0);
INSERT INTO `view` VALUES (67, 18, 26, '2025-01-10 17:39:42', 0);
INSERT INTO `view` VALUES (68, 18, 26, '2025-01-10 17:39:55', 0);
INSERT INTO `view` VALUES (69, 18, 26, '2025-01-10 17:46:06', 0);
INSERT INTO `view` VALUES (70, 18, 26, '2025-01-10 18:01:12', 0);
INSERT INTO `view` VALUES (71, 18, 26, '2025-01-10 18:01:25', 0);
INSERT INTO `view` VALUES (72, 18, 27, '2025-01-10 18:02:49', 0);
INSERT INTO `view` VALUES (73, 18, 27, '2025-01-10 18:02:59', 0);
INSERT INTO `view` VALUES (74, 18, 27, '2025-01-10 18:05:47', 0);
INSERT INTO `view` VALUES (75, 18, 28, '2025-01-10 18:06:12', 0);
INSERT INTO `view` VALUES (76, 18, 29, '2025-01-10 18:06:24', 0);
INSERT INTO `view` VALUES (77, 18, 30, '2025-01-10 21:42:25', 0);
INSERT INTO `view` VALUES (78, 18, 31, '2025-01-10 21:51:15', 0);
INSERT INTO `view` VALUES (79, 18, 32, '2025-01-10 21:55:35', 0);
INSERT INTO `view` VALUES (80, 18, 32, '2025-01-10 21:58:13', 0);
INSERT INTO `view` VALUES (81, 18, 9, '2025-01-10 21:58:24', 0);
INSERT INTO `view` VALUES (82, 18, 9, '2025-01-10 21:58:24', 0);
INSERT INTO `view` VALUES (83, 18, 9, '2025-01-10 21:58:24', 0);
INSERT INTO `view` VALUES (84, 18, 31, '2025-01-10 21:58:30', 0);
INSERT INTO `view` VALUES (85, 18, 31, '2025-01-10 21:58:30', 0);
INSERT INTO `view` VALUES (86, 18, 31, '2025-01-10 21:58:30', 0);
INSERT INTO `view` VALUES (87, 18, 31, '2025-01-10 22:06:44', 0);
INSERT INTO `view` VALUES (88, 18, 31, '2025-01-10 22:06:44', 0);
INSERT INTO `view` VALUES (90, 18, 31, '2025-01-10 22:08:30', 0);
INSERT INTO `view` VALUES (91, 18, 32, '2025-01-10 22:09:37', 0);
INSERT INTO `view` VALUES (92, 18, 32, '2025-01-10 22:17:38', 0);
INSERT INTO `view` VALUES (93, 18, 32, '2025-01-10 22:20:53', 0);
INSERT INTO `view` VALUES (94, 18, 32, '2025-01-10 22:23:21', 0);
INSERT INTO `view` VALUES (95, 18, 32, '2025-01-10 22:25:21', 0);
INSERT INTO `view` VALUES (96, 18, 32, '2025-01-10 22:27:48', 0);
INSERT INTO `view` VALUES (97, 18, 32, '2025-01-10 22:28:22', 0);
INSERT INTO `view` VALUES (98, 18, 32, '2025-01-10 22:28:29', 0);
INSERT INTO `view` VALUES (99, 18, 31, '2025-01-10 22:32:58', 0);
INSERT INTO `view` VALUES (100, 18, 31, '2025-01-10 22:32:58', 0);
INSERT INTO `view` VALUES (102, 18, 32, '2025-01-10 22:33:01', 0);
INSERT INTO `view` VALUES (103, 18, 32, '2025-01-10 22:33:01', 0);
INSERT INTO `view` VALUES (105, 18, 32, '2025-01-10 22:34:01', 0);
INSERT INTO `view` VALUES (106, 18, 32, '2025-01-10 22:34:07', 0);
INSERT INTO `view` VALUES (107, 18, 32, '2025-01-10 22:36:15', 0);
INSERT INTO `view` VALUES (108, 18, 32, '2025-01-10 22:36:15', 0);
INSERT INTO `view` VALUES (110, 18, 32, '2025-01-10 22:36:25', 0);
INSERT INTO `view` VALUES (112, 18, 32, '2025-01-10 22:36:32', 0);
INSERT INTO `view` VALUES (113, 18, 32, '2025-01-10 22:36:32', 0);
INSERT INTO `view` VALUES (114, 18, 32, '2025-01-10 22:36:45', 0);
INSERT INTO `view` VALUES (115, 18, 32, '2025-01-10 22:36:45', 0);
INSERT INTO `view` VALUES (117, 18, 32, '2025-01-10 22:37:24', 0);
INSERT INTO `view` VALUES (118, 18, 32, '2025-01-10 22:37:24', 0);
INSERT INTO `view` VALUES (120, 18, 32, '2025-01-10 22:37:57', 0);
INSERT INTO `view` VALUES (121, 18, 32, '2025-01-10 22:38:01', 0);
INSERT INTO `view` VALUES (122, 18, 32, '2025-01-10 22:38:08', 0);
INSERT INTO `view` VALUES (124, 18, 32, '2025-01-10 22:38:08', 0);
INSERT INTO `view` VALUES (125, 18, 32, '2025-01-10 22:38:43', 0);
INSERT INTO `view` VALUES (127, 18, 32, '2025-01-10 22:38:43', 0);
INSERT INTO `view` VALUES (128, 18, 32, '2025-01-10 22:41:55', 0);
INSERT INTO `view` VALUES (129, 18, 32, '2025-01-10 22:41:55', 0);
INSERT INTO `view` VALUES (131, 18, 32, '2025-01-10 22:42:22', 0);
INSERT INTO `view` VALUES (132, 18, 32, '2025-01-10 22:42:22', 0);
INSERT INTO `view` VALUES (133, 18, 32, '2025-01-10 22:42:22', 0);
INSERT INTO `view` VALUES (134, 18, 32, '2025-01-10 22:42:32', 0);
INSERT INTO `view` VALUES (136, 18, 32, '2025-01-10 22:42:32', 0);
INSERT INTO `view` VALUES (137, 18, 32, '2025-01-10 22:43:56', 0);
INSERT INTO `view` VALUES (138, 18, 32, '2025-01-10 22:43:57', 0);
INSERT INTO `view` VALUES (140, 18, 32, '2025-01-10 22:44:32', 0);
INSERT INTO `view` VALUES (141, 18, 32, '2025-01-10 22:47:08', 0);
INSERT INTO `view` VALUES (143, 18, 32, '2025-01-10 22:47:08', 0);
INSERT INTO `view` VALUES (144, 18, 32, '2025-01-10 22:49:11', 0);
INSERT INTO `view` VALUES (145, 18, 32, '2025-01-10 22:49:11', 0);
INSERT INTO `view` VALUES (146, 18, 32, '2025-01-10 22:49:11', 0);
INSERT INTO `view` VALUES (147, 18, 32, '2025-01-10 22:50:33', 0);
INSERT INTO `view` VALUES (148, 18, 32, '2025-01-10 22:53:05', 0);
INSERT INTO `view` VALUES (149, 18, 32, '2025-01-10 22:53:05', 0);
INSERT INTO `view` VALUES (151, 18, 32, '2025-01-10 22:54:10', 0);
INSERT INTO `view` VALUES (152, 18, 32, '2025-01-10 22:54:10', 0);
INSERT INTO `view` VALUES (153, 18, 32, '2025-01-10 22:54:10', 0);
INSERT INTO `view` VALUES (154, 18, 32, '2025-01-10 23:00:23', 0);
INSERT INTO `view` VALUES (155, 18, 32, '2025-01-10 23:00:23', 0);
INSERT INTO `view` VALUES (156, 18, 32, '2025-01-10 23:00:23', 0);
INSERT INTO `view` VALUES (157, 18, 32, '2025-01-10 23:00:43', 0);
INSERT INTO `view` VALUES (159, 18, 32, '2025-01-10 23:00:43', 0);
INSERT INTO `view` VALUES (160, 18, 32, '2025-01-10 23:04:45', 0);
INSERT INTO `view` VALUES (161, 18, 32, '2025-01-10 23:04:45', 0);
INSERT INTO `view` VALUES (163, 18, 32, '2025-01-10 23:04:52', 0);
INSERT INTO `view` VALUES (164, 18, 32, '2025-01-10 23:04:56', 0);
INSERT INTO `view` VALUES (165, 18, 32, '2025-01-10 23:04:57', 0);
INSERT INTO `view` VALUES (166, 18, 32, '2025-01-10 23:04:59', 0);
INSERT INTO `view` VALUES (167, 18, 32, '2025-01-10 23:04:59', 0);
INSERT INTO `view` VALUES (168, 18, 32, '2025-01-10 23:05:01', 0);
INSERT INTO `view` VALUES (169, 18, 32, '2025-01-10 23:05:04', 0);
INSERT INTO `view` VALUES (170, 18, 32, '2025-01-10 23:05:09', 0);
INSERT INTO `view` VALUES (171, 18, 32, '2025-01-10 23:07:04', 0);
INSERT INTO `view` VALUES (173, 18, 32, '2025-01-10 23:07:04', 0);
INSERT INTO `view` VALUES (174, 18, 32, '2025-01-10 23:07:31', 0);
INSERT INTO `view` VALUES (176, 18, 32, '2025-01-10 23:07:31', 0);
INSERT INTO `view` VALUES (177, 18, 32, '2025-01-10 23:07:37', 0);
INSERT INTO `view` VALUES (178, 18, 32, '2025-01-10 23:07:38', 0);
INSERT INTO `view` VALUES (179, 18, 32, '2025-01-10 23:07:39', 0);
INSERT INTO `view` VALUES (180, 18, 32, '2025-01-10 23:07:40', 0);
INSERT INTO `view` VALUES (181, 18, 32, '2025-01-10 23:08:07', 0);
INSERT INTO `view` VALUES (182, 18, 32, '2025-01-10 23:08:30', 0);
INSERT INTO `view` VALUES (183, 18, 32, '2025-01-10 23:08:30', 0);
INSERT INTO `view` VALUES (185, 18, 32, '2025-01-10 23:08:32', 0);
INSERT INTO `view` VALUES (186, 18, 32, '2025-01-10 23:08:33', 0);
INSERT INTO `view` VALUES (187, 18, 32, '2025-01-10 23:08:34', 0);
INSERT INTO `view` VALUES (188, 18, 32, '2025-01-10 23:08:54', 0);
INSERT INTO `view` VALUES (189, 18, 32, '2025-01-10 23:08:55', 0);
INSERT INTO `view` VALUES (190, 18, 32, '2025-01-10 23:09:40', 0);
INSERT INTO `view` VALUES (191, 18, 32, '2025-01-10 23:10:10', 0);
INSERT INTO `view` VALUES (192, 18, 32, '2025-01-10 23:15:37', 0);
INSERT INTO `view` VALUES (193, 18, 32, '2025-01-10 23:15:37', 0);
INSERT INTO `view` VALUES (194, 18, 32, '2025-01-10 23:15:37', 0);
INSERT INTO `view` VALUES (195, 18, 32, '2025-01-10 23:21:55', 0);
INSERT INTO `view` VALUES (196, 18, 32, '2025-01-10 23:21:55', 0);
INSERT INTO `view` VALUES (198, 18, 32, '2025-01-10 23:31:38', 0);
INSERT INTO `view` VALUES (199, 18, 32, '2025-01-10 23:31:38', 0);
INSERT INTO `view` VALUES (200, 18, 32, '2025-01-10 23:31:38', 0);
INSERT INTO `view` VALUES (201, 9, 1, '2025-01-10 23:31:49', 0);
INSERT INTO `view` VALUES (202, 18, 32, '2025-01-10 23:32:12', 0);
INSERT INTO `view` VALUES (203, 18, 32, '2025-01-10 23:32:13', 0);
INSERT INTO `view` VALUES (205, 18, 32, '2025-01-10 23:36:09', 0);
INSERT INTO `view` VALUES (206, 18, 32, '2025-01-10 23:39:50', 0);
INSERT INTO `view` VALUES (207, 18, 32, '2025-01-10 23:40:16', 0);
INSERT INTO `view` VALUES (208, 18, 32, '2025-01-10 23:43:12', 0);
INSERT INTO `view` VALUES (209, 18, 32, '2025-01-10 23:43:40', 0);
INSERT INTO `view` VALUES (210, 18, 32, '2025-01-10 23:44:32', 0);
INSERT INTO `view` VALUES (211, 18, 32, '2025-01-10 23:45:43', 0);
INSERT INTO `view` VALUES (212, 18, 32, '2025-01-10 23:46:42', 0);
INSERT INTO `view` VALUES (213, 18, 32, '2025-01-10 23:48:00', 0);
INSERT INTO `view` VALUES (214, 18, 32, '2025-01-10 23:49:13', 0);
INSERT INTO `view` VALUES (215, 18, 32, '2025-01-10 23:49:36', 0);
INSERT INTO `view` VALUES (216, 18, 32, '2025-01-10 23:54:54', 0);
INSERT INTO `view` VALUES (217, 18, 32, '2025-01-10 23:56:49', 0);
INSERT INTO `view` VALUES (218, 18, 32, '2025-01-10 23:56:57', 0);
INSERT INTO `view` VALUES (219, 18, 32, '2025-01-10 23:58:14', 0);
INSERT INTO `view` VALUES (220, 18, 32, '2025-01-10 23:58:38', 0);
INSERT INTO `view` VALUES (221, 18, 32, '2025-01-11 00:03:33', 0);
INSERT INTO `view` VALUES (222, 18, 32, '2025-01-11 00:05:15', 0);
INSERT INTO `view` VALUES (224, 18, 32, '2025-01-11 00:05:52', 0);
INSERT INTO `view` VALUES (225, 18, 32, '2025-01-11 00:07:04', 0);
INSERT INTO `view` VALUES (226, 18, 32, '2025-01-11 00:07:53', 0);
INSERT INTO `view` VALUES (227, 18, 32, '2025-01-11 00:09:29', 0);
INSERT INTO `view` VALUES (228, 18, 32, '2025-01-11 00:17:50', 0);
INSERT INTO `view` VALUES (230, 18, 32, '2025-01-11 00:21:28', 0);
INSERT INTO `view` VALUES (231, 18, 32, '2025-01-11 00:23:10', 0);
INSERT INTO `view` VALUES (232, 18, 32, '2025-01-11 00:23:55', 0);
INSERT INTO `view` VALUES (233, 18, 32, '2025-01-11 00:24:16', 0);
INSERT INTO `view` VALUES (234, 18, 32, '2025-01-11 00:31:28', 0);
INSERT INTO `view` VALUES (235, 18, 32, '2025-01-11 00:31:52', 0);
INSERT INTO `view` VALUES (236, 18, 32, '2025-01-11 00:33:42', 0);
INSERT INTO `view` VALUES (237, 18, 32, '2025-01-11 00:35:02', 0);
INSERT INTO `view` VALUES (238, 18, 32, '2025-01-11 00:37:56', 0);
INSERT INTO `view` VALUES (239, 18, 32, '2025-01-11 00:38:33', 0);
INSERT INTO `view` VALUES (240, 18, 32, '2025-01-11 00:38:39', 0);
INSERT INTO `view` VALUES (241, 18, 32, '2025-01-11 00:40:05', 0);
INSERT INTO `view` VALUES (242, 18, 32, '2025-01-11 00:45:17', 0);
INSERT INTO `view` VALUES (243, 18, 32, '2025-01-11 00:45:40', 0);
INSERT INTO `view` VALUES (244, 18, 32, '2025-01-11 00:46:06', 0);
INSERT INTO `view` VALUES (245, 18, 32, '2025-01-11 00:49:26', 0);
INSERT INTO `view` VALUES (246, 18, 32, '2025-01-11 00:49:34', 0);
INSERT INTO `view` VALUES (247, 18, 32, '2025-01-11 00:51:46', 0);
INSERT INTO `view` VALUES (248, 18, 32, '2025-01-11 00:52:04', 0);
INSERT INTO `view` VALUES (249, 18, 32, '2025-01-11 00:52:56', 0);
INSERT INTO `view` VALUES (250, 12, 32, '2025-01-11 01:09:46', 0);
INSERT INTO `view` VALUES (251, 12, 32, '2025-01-11 01:10:14', 0);
INSERT INTO `view` VALUES (252, 12, 2, '2025-01-11 01:10:42', 0);
INSERT INTO `view` VALUES (253, 12, 2, '2025-01-11 01:11:05', 0);
INSERT INTO `view` VALUES (254, 12, 2, '2025-01-11 01:11:07', 0);
INSERT INTO `view` VALUES (255, 12, 2, '2025-01-11 01:11:09', 0);
INSERT INTO `view` VALUES (256, 12, 2, '2025-01-11 01:11:16', 0);
INSERT INTO `view` VALUES (257, 18, 35, '2025-01-11 01:13:54', 0);
INSERT INTO `view` VALUES (258, 18, 35, '2025-01-11 01:14:45', 0);
INSERT INTO `view` VALUES (259, 12, 5, '2025-01-11 01:14:59', 0);
INSERT INTO `view` VALUES (260, 18, 36, '2025-01-11 01:19:36', 0);
INSERT INTO `view` VALUES (261, 12, 2, '2025-01-11 01:22:45', 0);
INSERT INTO `view` VALUES (262, 12, 1, '2025-01-11 01:22:47', 0);
INSERT INTO `view` VALUES (263, 12, 2, '2025-01-11 01:22:50', 0);
INSERT INTO `view` VALUES (264, 12, 2, '2025-01-11 01:22:59', 0);
INSERT INTO `view` VALUES (265, 12, 3, '2025-01-11 01:23:22', 0);
INSERT INTO `view` VALUES (266, 12, 15, '2025-01-11 01:24:17', 0);
INSERT INTO `view` VALUES (267, 18, 7, '2025-01-11 01:36:04', 0);
INSERT INTO `view` VALUES (268, 18, 7, '2025-01-11 02:33:27', 0);
INSERT INTO `view` VALUES (269, 18, 2, '2025-01-11 02:44:00', 0);
INSERT INTO `view` VALUES (270, 18, 3, '2025-01-11 02:44:43', 0);
INSERT INTO `view` VALUES (271, 18, 31, '2025-01-11 02:44:59', 0);
INSERT INTO `view` VALUES (272, 18, 36, '2025-01-11 02:45:13', 0);
INSERT INTO `view` VALUES (273, 18, 36, '2025-01-11 02:54:16', 0);
INSERT INTO `view` VALUES (274, 18, 36, '2025-01-11 02:55:42', 0);
INSERT INTO `view` VALUES (275, 18, 36, '2025-01-11 02:56:14', 0);
INSERT INTO `view` VALUES (276, 9, 15, '2025-01-11 08:40:37', 0);
INSERT INTO `view` VALUES (277, 9, 7, '2025-01-11 08:40:59', 0);
INSERT INTO `view` VALUES (278, 12, 7, '2025-01-11 08:41:16', 0);
INSERT INTO `view` VALUES (279, 12, 1, '2025-01-11 10:23:15', 0);
INSERT INTO `view` VALUES (280, 9, 9, '2025-01-11 12:58:49', 0);
INSERT INTO `view` VALUES (281, 9, 9, '2025-01-11 12:59:03', 0);
INSERT INTO `view` VALUES (282, 9, 7, '2025-01-11 12:59:29', 0);
INSERT INTO `view` VALUES (283, 9, 11, '2025-01-11 12:59:57', 0);
INSERT INTO `view` VALUES (284, 18, 36, '2025-01-11 14:12:46', 0);
INSERT INTO `view` VALUES (285, 18, 36, '2025-01-11 14:15:38', 0);
INSERT INTO `view` VALUES (286, 18, 36, '2025-01-11 14:16:04', 0);
INSERT INTO `view` VALUES (287, 18, 2, '2025-01-11 14:17:17', 0);
INSERT INTO `view` VALUES (288, 18, 1, '2025-01-11 14:17:23', 0);
INSERT INTO `view` VALUES (289, 18, 1, '2025-01-11 14:17:24', 0);
INSERT INTO `view` VALUES (290, 18, 36, '2025-01-11 14:17:27', 0);
INSERT INTO `view` VALUES (291, 18, 36, '2025-01-11 14:18:14', 0);
INSERT INTO `view` VALUES (292, 18, 36, '2025-01-11 14:19:08', 0);
INSERT INTO `view` VALUES (293, 18, 36, '2025-01-11 14:20:46', 0);
INSERT INTO `view` VALUES (294, 18, 36, '2025-01-11 14:22:10', 0);
INSERT INTO `view` VALUES (295, 18, 36, '2025-01-11 14:23:08', 0);
INSERT INTO `view` VALUES (296, 18, 36, '2025-01-11 14:23:44', 0);
INSERT INTO `view` VALUES (297, 18, 36, '2025-01-11 14:25:13', 0);
INSERT INTO `view` VALUES (298, 18, 36, '2025-01-11 14:28:48', 0);
INSERT INTO `view` VALUES (299, 18, 36, '2025-01-11 14:29:10', 0);
INSERT INTO `view` VALUES (300, 18, 36, '2025-01-11 14:34:53', 0);
INSERT INTO `view` VALUES (301, 18, 36, '2025-01-11 14:52:32', 0);
INSERT INTO `view` VALUES (302, 18, 36, '2025-01-11 14:53:26', 0);
INSERT INTO `view` VALUES (303, 18, 36, '2025-01-11 14:54:02', 0);
INSERT INTO `view` VALUES (304, 18, 36, '2025-01-11 14:58:18', 0);
INSERT INTO `view` VALUES (305, 18, 36, '2025-01-11 15:09:28', 0);
INSERT INTO `view` VALUES (306, 18, 36, '2025-01-11 15:16:20', 0);
INSERT INTO `view` VALUES (307, 18, 36, '2025-01-11 15:16:35', 0);
INSERT INTO `view` VALUES (308, 18, 36, '2025-01-11 15:17:10', 0);
INSERT INTO `view` VALUES (309, 18, 36, '2025-01-11 15:19:13', 0);
INSERT INTO `view` VALUES (310, 18, 36, '2025-01-11 15:20:49', 0);
INSERT INTO `view` VALUES (311, 18, 36, '2025-01-11 15:25:02', 0);
INSERT INTO `view` VALUES (312, 18, 36, '2025-01-11 15:32:36', 0);
INSERT INTO `view` VALUES (313, 18, 36, '2025-01-11 15:35:44', 0);
INSERT INTO `view` VALUES (314, 18, 36, '2025-01-11 15:51:25', 0);
INSERT INTO `view` VALUES (315, 18, 36, '2025-01-11 15:54:35', 0);
INSERT INTO `view` VALUES (316, 18, 36, '2025-01-11 15:57:09', 0);
INSERT INTO `view` VALUES (317, 18, 36, '2025-01-11 15:57:52', 0);
INSERT INTO `view` VALUES (318, 18, 36, '2025-01-11 15:59:21', 0);
INSERT INTO `view` VALUES (319, 18, 36, '2025-01-11 16:00:06', 0);
INSERT INTO `view` VALUES (320, 18, 36, '2025-01-11 16:01:51', 0);
INSERT INTO `view` VALUES (321, 18, 36, '2025-01-11 16:03:26', 0);
INSERT INTO `view` VALUES (322, 18, 36, '2025-01-11 16:04:36', 0);
INSERT INTO `view` VALUES (323, 18, 36, '2025-01-11 16:05:45', 0);
INSERT INTO `view` VALUES (324, 18, 36, '2025-01-11 16:33:34', 0);
INSERT INTO `view` VALUES (325, 18, 36, '2025-01-11 16:33:58', 0);
INSERT INTO `view` VALUES (326, 18, 36, '2025-01-11 18:14:13', 0);
INSERT INTO `view` VALUES (327, 18, 36, '2025-01-11 18:14:22', 0);
INSERT INTO `view` VALUES (328, 18, 36, '2025-01-11 18:17:34', 0);
INSERT INTO `view` VALUES (329, 18, 36, '2025-01-11 18:22:18', 0);
INSERT INTO `view` VALUES (330, 18, 36, '2025-01-11 18:22:29', 0);
INSERT INTO `view` VALUES (331, 18, 36, '2025-01-11 18:22:39', 0);
INSERT INTO `view` VALUES (332, 18, 36, '2025-01-11 18:22:52', 0);
INSERT INTO `view` VALUES (333, 18, 36, '2025-01-11 18:24:57', 0);
INSERT INTO `view` VALUES (334, 18, 36, '2025-01-11 18:42:26', 0);
INSERT INTO `view` VALUES (335, 18, 36, '2025-01-11 18:43:28', 0);
INSERT INTO `view` VALUES (336, 18, 36, '2025-01-11 18:43:45', 0);
INSERT INTO `view` VALUES (337, 18, 36, '2025-01-11 20:31:08', 0);
INSERT INTO `view` VALUES (338, 18, 36, '2025-01-11 20:33:05', 0);
INSERT INTO `view` VALUES (339, 18, 36, '2025-01-11 20:33:05', 0);
INSERT INTO `view` VALUES (340, 18, 36, '2025-01-11 20:51:17', 0);
INSERT INTO `view` VALUES (341, 18, 36, '2025-01-11 20:51:23', 0);
INSERT INTO `view` VALUES (342, 18, 36, '2025-01-11 20:51:36', 0);
INSERT INTO `view` VALUES (343, 18, 36, '2025-01-11 20:52:29', 0);
INSERT INTO `view` VALUES (344, 18, 36, '2025-01-12 01:40:10', 0);
INSERT INTO `view` VALUES (345, 18, 36, '2025-01-12 01:51:07', 0);
INSERT INTO `view` VALUES (346, 18, 36, '2025-01-12 01:51:21', 0);
INSERT INTO `view` VALUES (347, 18, 36, '2025-01-12 02:25:48', 0);
INSERT INTO `view` VALUES (348, 18, 36, '2025-01-12 03:55:49', 0);
INSERT INTO `view` VALUES (349, 18, 36, '2025-01-12 03:55:59', 0);
INSERT INTO `view` VALUES (350, 18, 36, '2025-01-12 04:04:50', 0);
INSERT INTO `view` VALUES (351, 18, 36, '2025-01-12 04:06:11', 0);
INSERT INTO `view` VALUES (352, 18, 36, '2025-01-12 04:06:50', 0);
INSERT INTO `view` VALUES (353, 18, 36, '2025-01-12 04:07:31', 0);
INSERT INTO `view` VALUES (354, 18, 36, '2025-01-12 04:07:40', 0);
INSERT INTO `view` VALUES (355, 18, 32, '2025-01-12 04:08:13', 0);
INSERT INTO `view` VALUES (356, 18, 32, '2025-01-12 04:08:57', 0);
INSERT INTO `view` VALUES (357, 18, 36, '2025-01-12 04:10:11', 0);
INSERT INTO `view` VALUES (358, 18, 32, '2025-01-12 04:11:52', 0);
INSERT INTO `view` VALUES (359, 18, 36, '2025-01-12 04:14:27', 0);
INSERT INTO `view` VALUES (360, 18, 36, '2025-01-12 04:15:35', 0);
INSERT INTO `view` VALUES (361, 18, 36, '2025-01-12 04:16:14', 0);
INSERT INTO `view` VALUES (362, 18, 36, '2025-01-12 04:16:22', 0);
INSERT INTO `view` VALUES (363, 18, 36, '2025-01-12 04:16:34', 0);
INSERT INTO `view` VALUES (364, 18, 36, '2025-01-12 04:22:03', 0);
INSERT INTO `view` VALUES (365, 18, 36, '2025-01-12 04:44:51', 0);
INSERT INTO `view` VALUES (366, 18, 32, '2025-01-12 04:44:54', 0);
INSERT INTO `view` VALUES (367, 12, 2, '2025-01-12 15:02:56', 0);
INSERT INTO `view` VALUES (368, 12, 1, '2025-01-12 15:03:27', 0);
INSERT INTO `view` VALUES (369, 12, 11, '2025-01-12 15:03:30', 0);
INSERT INTO `view` VALUES (370, 12, 11, '2025-01-12 15:03:59', 0);
INSERT INTO `view` VALUES (371, 18, 36, '2025-01-12 19:02:20', 0);
INSERT INTO `view` VALUES (372, 18, 36, '2025-01-13 03:28:17', 0);
INSERT INTO `view` VALUES (373, 18, 36, '2025-01-13 09:13:58', 0);
INSERT INTO `view` VALUES (374, 18, 36, '2025-01-13 09:14:16', 0);
INSERT INTO `view` VALUES (375, 18, 36, '2025-01-14 00:56:25', 0);
INSERT INTO `view` VALUES (376, 18, 36, '2025-01-14 03:09:39', 0);
INSERT INTO `view` VALUES (377, 9, 8, '2025-01-14 08:52:58', 0);
INSERT INTO `view` VALUES (378, 18, 36, '2025-01-14 15:25:46', 0);
INSERT INTO `view` VALUES (379, 12, 8, '2025-01-14 22:54:36', 0);
INSERT INTO `view` VALUES (380, 12, 13, '2025-01-14 22:55:21', 0);
INSERT INTO `view` VALUES (381, 12, 2, '2025-01-14 22:56:41', 0);
INSERT INTO `view` VALUES (382, 12, 2, '2025-01-14 22:56:54', 0);
INSERT INTO `view` VALUES (383, 18, 36, '2025-01-15 10:09:23', 0);
INSERT INTO `view` VALUES (384, 9, 2, '2025-01-15 11:36:33', 0);
INSERT INTO `view` VALUES (385, 9, 10, '2025-01-15 11:38:24', 0);
INSERT INTO `view` VALUES (386, 9, 17, '2025-01-15 11:39:53', 0);
INSERT INTO `view` VALUES (387, 9, 31, '2025-01-15 11:39:57', 0);
INSERT INTO `view` VALUES (388, 9, 32, '2025-01-15 11:40:03', 0);
INSERT INTO `view` VALUES (389, 9, 2, '2025-01-15 11:40:06', 0);

SET FOREIGN_KEY_CHECKS = 1;
