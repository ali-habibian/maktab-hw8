/*
 Navicat Premium Data Transfer

 Source Server         : ali
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : league

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 05/10/2021 22:21:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for citys
-- ----------------------------
DROP TABLE IF EXISTS `citys`;
CREATE TABLE `citys`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coachs
-- ----------------------------
DROP TABLE IF EXISTS `coachs`;
CREATE TABLE `coachs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for matchs
-- ----------------------------
DROP TABLE IF EXISTS `matchs`;
CREATE TABLE `matchs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `stadium_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `matchs_FK`(`stadium_id`) USING BTREE,
  CONSTRAINT `matchs_FK` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for matchs_players
-- ----------------------------
DROP TABLE IF EXISTS `matchs_players`;
CREATE TABLE `matchs_players`  (
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `scored_goals` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`match_id`, `player_id`) USING BTREE,
  INDEX `match_player_FK_1`(`player_id`) USING BTREE,
  CONSTRAINT `match_player_FK` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_player_FK_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for matchs_teams
-- ----------------------------
DROP TABLE IF EXISTS `matchs_teams`;
CREATE TABLE `matchs_teams`  (
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `scored_goals` int NOT NULL DEFAULT 0,
  `points` int NOT NULL DEFAULT 0,
  `is_derby` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`match_id`, `team_id`) USING BTREE,
  INDEX `matchs_teams_FK`(`team_id`) USING BTREE,
  CONSTRAINT `matchs_teams_FK` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `matchs_teams_FK_1` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `injury` tinyint(1) NOT NULL,
  `ability_level` int NOT NULL,
  `team_id` int NULL DEFAULT NULL,
  `capitan` tinyint(1) UNSIGNED ZEROFILL NOT NULL,
  `value` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `players_FK`(`team_id`) USING BTREE,
  CONSTRAINT `players_FK` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stadiums
-- ----------------------------
DROP TABLE IF EXISTS `stadiums`;
CREATE TABLE `stadiums`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stadiums_FK`(`city_id`) USING BTREE,
  CONSTRAINT `stadiums_FK` FOREIGN KEY (`city_id`) REFERENCES `citys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city_id` int NOT NULL,
  `stadium_id` int NOT NULL,
  `coach_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teams_FK`(`city_id`) USING BTREE,
  INDEX `teams_FK_1`(`stadium_id`) USING BTREE,
  INDEX `teams_FK_2`(`coach_id`) USING BTREE,
  CONSTRAINT `teams_FK` FOREIGN KEY (`city_id`) REFERENCES `citys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teams_FK_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teams_FK_2` FOREIGN KEY (`coach_id`) REFERENCES `coachs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
