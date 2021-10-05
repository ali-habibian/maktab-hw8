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

 Date: 05/10/2021 22:22:07
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
-- Records of citys
-- ----------------------------
INSERT INTO `citys` VALUES (1, 'London');
INSERT INTO `citys` VALUES (2, 'Birmingham');
INSERT INTO `citys` VALUES (3, 'Brighton');
INSERT INTO `citys` VALUES (4, 'Burnley');
INSERT INTO `citys` VALUES (7, 'Liverpool');
INSERT INTO `citys` VALUES (8, 'Leeds');
INSERT INTO `citys` VALUES (9, 'Leicester');
INSERT INTO `citys` VALUES (10, 'Manchester');
INSERT INTO `citys` VALUES (11, 'Newcastle');
INSERT INTO `citys` VALUES (12, 'Sheffield');
INSERT INTO `citys` VALUES (13, 'Southampton');
INSERT INTO `citys` VALUES (14, 'West Bromwich');
INSERT INTO `citys` VALUES (15, 'Wolverhampton');

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
-- Records of coachs
-- ----------------------------
INSERT INTO `coachs` VALUES (1, 'Jürgen Klopp', 15000000);
INSERT INTO `coachs` VALUES (2, 'Pep Guardiola', 20000000);
INSERT INTO `coachs` VALUES (3, 'Frank Lampard', 8000000);
INSERT INTO `coachs` VALUES (4, 'José Mourinho', 15000000);
INSERT INTO `coachs` VALUES (5, 'Ole Gunnar Solskjær', 7800000);
INSERT INTO `coachs` VALUES (6, 'Mikel Arteta', 5000000);
INSERT INTO `coachs` VALUES (7, 'Carlo Ancelotti', 11000000);
INSERT INTO `coachs` VALUES (8, 'Brendan Rodgers', 5000000);
INSERT INTO `coachs` VALUES (9, 'Nuno Espírito Santo', 4000000);
INSERT INTO `coachs` VALUES (10, 'David Moyes', 3000000);
INSERT INTO `coachs` VALUES (11, 'Dean Smith', 1500000);
INSERT INTO `coachs` VALUES (12, 'Steve Bruce', 2750000);
INSERT INTO `coachs` VALUES (13, 'Scott Parker', 3500000);
INSERT INTO `coachs` VALUES (14, 'Roy Hodgson', 4500000);
INSERT INTO `coachs` VALUES (15, 'Ralph Hasenhüttl', 1000000);
INSERT INTO `coachs` VALUES (16, 'Graham Potter', 1000000);
INSERT INTO `coachs` VALUES (17, 'Marcelo Bielsa', 8000000);
INSERT INTO `coachs` VALUES (18, 'Sean Dyche', 2400000);
INSERT INTO `coachs` VALUES (19, 'Chris Wilder', 675000);
INSERT INTO `coachs` VALUES (20, 'Slaven Bilić', 850000);

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
-- Records of matchs
-- ----------------------------
INSERT INTO `matchs` VALUES (3, 1);
INSERT INTO `matchs` VALUES (7, 2);
INSERT INTO `matchs` VALUES (2, 3);
INSERT INTO `matchs` VALUES (1, 4);
INSERT INTO `matchs` VALUES (5, 4);
INSERT INTO `matchs` VALUES (6, 4);
INSERT INTO `matchs` VALUES (4, 5);

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
-- Records of matchs_players
-- ----------------------------
INSERT INTO `matchs_players` VALUES (1, 1, 0);
INSERT INTO `matchs_players` VALUES (1, 2, 0);
INSERT INTO `matchs_players` VALUES (1, 3, 2);
INSERT INTO `matchs_players` VALUES (1, 4, 0);
INSERT INTO `matchs_players` VALUES (1, 5, 0);
INSERT INTO `matchs_players` VALUES (1, 6, 0);
INSERT INTO `matchs_players` VALUES (1, 7, 0);
INSERT INTO `matchs_players` VALUES (1, 8, 0);
INSERT INTO `matchs_players` VALUES (1, 9, 0);
INSERT INTO `matchs_players` VALUES (1, 10, 0);
INSERT INTO `matchs_players` VALUES (1, 11, 0);
INSERT INTO `matchs_players` VALUES (1, 15, 0);
INSERT INTO `matchs_players` VALUES (1, 16, 0);
INSERT INTO `matchs_players` VALUES (1, 39, 0);
INSERT INTO `matchs_players` VALUES (1, 40, 0);
INSERT INTO `matchs_players` VALUES (1, 42, 0);
INSERT INTO `matchs_players` VALUES (1, 45, 0);
INSERT INTO `matchs_players` VALUES (1, 46, 0);
INSERT INTO `matchs_players` VALUES (1, 47, 0);
INSERT INTO `matchs_players` VALUES (1, 48, 0);
INSERT INTO `matchs_players` VALUES (1, 52, 0);
INSERT INTO `matchs_players` VALUES (1, 53, 0);
INSERT INTO `matchs_players` VALUES (1, 56, 0);
INSERT INTO `matchs_players` VALUES (1, 58, 0);
INSERT INTO `matchs_players` VALUES (2, 2, 1);
INSERT INTO `matchs_players` VALUES (2, 3, 0);
INSERT INTO `matchs_players` VALUES (2, 4, 0);
INSERT INTO `matchs_players` VALUES (2, 5, 0);
INSERT INTO `matchs_players` VALUES (2, 6, 0);
INSERT INTO `matchs_players` VALUES (2, 7, 0);
INSERT INTO `matchs_players` VALUES (2, 9, 0);
INSERT INTO `matchs_players` VALUES (2, 11, 0);
INSERT INTO `matchs_players` VALUES (2, 12, 0);
INSERT INTO `matchs_players` VALUES (2, 13, 0);
INSERT INTO `matchs_players` VALUES (2, 17, 0);
INSERT INTO `matchs_players` VALUES (2, 20, 0);
INSERT INTO `matchs_players` VALUES (2, 22, 0);
INSERT INTO `matchs_players` VALUES (2, 23, 0);
INSERT INTO `matchs_players` VALUES (2, 24, 0);
INSERT INTO `matchs_players` VALUES (2, 27, 0);
INSERT INTO `matchs_players` VALUES (2, 28, 0);
INSERT INTO `matchs_players` VALUES (2, 29, 0);
INSERT INTO `matchs_players` VALUES (2, 30, 0);
INSERT INTO `matchs_players` VALUES (2, 31, 1);
INSERT INTO `matchs_players` VALUES (2, 33, 0);
INSERT INTO `matchs_players` VALUES (2, 37, 0);
INSERT INTO `matchs_players` VALUES (3, 2, 1);
INSERT INTO `matchs_players` VALUES (3, 3, 0);
INSERT INTO `matchs_players` VALUES (3, 4, 0);
INSERT INTO `matchs_players` VALUES (3, 5, 0);
INSERT INTO `matchs_players` VALUES (3, 6, 1);
INSERT INTO `matchs_players` VALUES (3, 7, 0);
INSERT INTO `matchs_players` VALUES (3, 8, 0);
INSERT INTO `matchs_players` VALUES (3, 9, 0);
INSERT INTO `matchs_players` VALUES (3, 11, 0);
INSERT INTO `matchs_players` VALUES (3, 15, 0);
INSERT INTO `matchs_players` VALUES (3, 18, 0);
INSERT INTO `matchs_players` VALUES (3, 61, 0);
INSERT INTO `matchs_players` VALUES (3, 62, 1);
INSERT INTO `matchs_players` VALUES (3, 63, 0);
INSERT INTO `matchs_players` VALUES (3, 64, 0);
INSERT INTO `matchs_players` VALUES (3, 68, 0);
INSERT INTO `matchs_players` VALUES (3, 69, 0);
INSERT INTO `matchs_players` VALUES (3, 74, 0);
INSERT INTO `matchs_players` VALUES (3, 75, 0);
INSERT INTO `matchs_players` VALUES (3, 76, 0);
INSERT INTO `matchs_players` VALUES (3, 79, 0);
INSERT INTO `matchs_players` VALUES (3, 81, 0);
INSERT INTO `matchs_players` VALUES (4, 20, 0);
INSERT INTO `matchs_players` VALUES (4, 23, 0);
INSERT INTO `matchs_players` VALUES (4, 24, 0);
INSERT INTO `matchs_players` VALUES (4, 25, 0);
INSERT INTO `matchs_players` VALUES (4, 26, 0);
INSERT INTO `matchs_players` VALUES (4, 27, 0);
INSERT INTO `matchs_players` VALUES (4, 28, 0);
INSERT INTO `matchs_players` VALUES (4, 30, 0);
INSERT INTO `matchs_players` VALUES (4, 31, 0);
INSERT INTO `matchs_players` VALUES (4, 33, 0);
INSERT INTO `matchs_players` VALUES (4, 34, 0);
INSERT INTO `matchs_players` VALUES (4, 61, 0);
INSERT INTO `matchs_players` VALUES (4, 62, 1);
INSERT INTO `matchs_players` VALUES (4, 63, 0);
INSERT INTO `matchs_players` VALUES (4, 64, 0);
INSERT INTO `matchs_players` VALUES (4, 68, 0);
INSERT INTO `matchs_players` VALUES (4, 69, 1);
INSERT INTO `matchs_players` VALUES (4, 70, 0);
INSERT INTO `matchs_players` VALUES (4, 74, 0);
INSERT INTO `matchs_players` VALUES (4, 76, 0);
INSERT INTO `matchs_players` VALUES (4, 77, 0);
INSERT INTO `matchs_players` VALUES (4, 79, 0);
INSERT INTO `matchs_players` VALUES (4, 81, 0);
INSERT INTO `matchs_players` VALUES (5, 20, 1);
INSERT INTO `matchs_players` VALUES (5, 22, 0);
INSERT INTO `matchs_players` VALUES (5, 23, 0);
INSERT INTO `matchs_players` VALUES (5, 25, 1);
INSERT INTO `matchs_players` VALUES (5, 27, 0);
INSERT INTO `matchs_players` VALUES (5, 29, 0);
INSERT INTO `matchs_players` VALUES (5, 30, 0);
INSERT INTO `matchs_players` VALUES (5, 32, 0);
INSERT INTO `matchs_players` VALUES (5, 34, 0);
INSERT INTO `matchs_players` VALUES (5, 35, 0);
INSERT INTO `matchs_players` VALUES (5, 38, 1);
INSERT INTO `matchs_players` VALUES (5, 39, 0);
INSERT INTO `matchs_players` VALUES (5, 41, 0);
INSERT INTO `matchs_players` VALUES (5, 42, 1);
INSERT INTO `matchs_players` VALUES (5, 43, 0);
INSERT INTO `matchs_players` VALUES (5, 44, 0);
INSERT INTO `matchs_players` VALUES (5, 46, 0);
INSERT INTO `matchs_players` VALUES (5, 47, 0);
INSERT INTO `matchs_players` VALUES (5, 50, 0);
INSERT INTO `matchs_players` VALUES (5, 51, 0);
INSERT INTO `matchs_players` VALUES (5, 52, 0);
INSERT INTO `matchs_players` VALUES (5, 53, 0);
INSERT INTO `matchs_players` VALUES (6, 39, 0);
INSERT INTO `matchs_players` VALUES (6, 41, 0);
INSERT INTO `matchs_players` VALUES (6, 42, 0);
INSERT INTO `matchs_players` VALUES (6, 43, 0);
INSERT INTO `matchs_players` VALUES (6, 44, 0);
INSERT INTO `matchs_players` VALUES (6, 46, 0);
INSERT INTO `matchs_players` VALUES (6, 47, 0);
INSERT INTO `matchs_players` VALUES (6, 51, 0);
INSERT INTO `matchs_players` VALUES (6, 52, 0);
INSERT INTO `matchs_players` VALUES (6, 53, 0);
INSERT INTO `matchs_players` VALUES (6, 60, 0);
INSERT INTO `matchs_players` VALUES (6, 61, 0);
INSERT INTO `matchs_players` VALUES (6, 62, 0);
INSERT INTO `matchs_players` VALUES (6, 63, 0);
INSERT INTO `matchs_players` VALUES (6, 68, 0);
INSERT INTO `matchs_players` VALUES (6, 70, 0);
INSERT INTO `matchs_players` VALUES (6, 74, 0);
INSERT INTO `matchs_players` VALUES (6, 75, 0);
INSERT INTO `matchs_players` VALUES (6, 76, 0);
INSERT INTO `matchs_players` VALUES (6, 77, 0);
INSERT INTO `matchs_players` VALUES (6, 79, 0);
INSERT INTO `matchs_players` VALUES (6, 81, 0);

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
-- Records of matchs_teams
-- ----------------------------
INSERT INTO `matchs_teams` VALUES (1, 2, 2, 3, 0);
INSERT INTO `matchs_teams` VALUES (1, 4, 0, 0, 0);
INSERT INTO `matchs_teams` VALUES (2, 2, 1, 1, 0);
INSERT INTO `matchs_teams` VALUES (2, 3, 1, 1, 0);
INSERT INTO `matchs_teams` VALUES (3, 2, 2, 3, 0);
INSERT INTO `matchs_teams` VALUES (3, 5, 1, 0, 0);
INSERT INTO `matchs_teams` VALUES (4, 3, 0, 0, 0);
INSERT INTO `matchs_teams` VALUES (4, 5, 2, 3, 0);
INSERT INTO `matchs_teams` VALUES (5, 3, 3, 3, 0);
INSERT INTO `matchs_teams` VALUES (5, 4, 1, 0, 0);
INSERT INTO `matchs_teams` VALUES (6, 4, 0, 1, 1);
INSERT INTO `matchs_teams` VALUES (6, 5, 0, 1, 1);
INSERT INTO `matchs_teams` VALUES (7, 5, 1, 0, 1);
INSERT INTO `matchs_teams` VALUES (7, 7, 2, 3, 1);

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
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (1, 'VIRGIL\r\nVAN DIJK', 'CB', 0, 90, 2, 0, 55000000);
INSERT INTO `players` VALUES (2, 'MOHAMED SALAH', 'RW', 0, 90, 2, 0, 100000000);
INSERT INTO `players` VALUES (3, 'SADIO MANÉ', 'LW', 0, 90, 2, 0, 85000000);
INSERT INTO `players` VALUES (4, 'ALISSON', 'GK', 0, 90, 2, 0, 60000000);
INSERT INTO `players` VALUES (5, 'TRENT ALEXANDER-ARNOLD', 'RB', 0, 87, 2, 0, 75000000);
INSERT INTO `players` VALUES (6, 'ROBERTO FIRMINO', 'CF', 0, 87, 2, 0, 50000000);
INSERT INTO `players` VALUES (7, 'ANDREW ROBERTSON', 'LB', 0, 87, 2, 0, 65000000);
INSERT INTO `players` VALUES (8, 'FABINHO', 'CDM', 0, 87, 2, 0, 60000000);
INSERT INTO `players` VALUES (9, 'JORDAN HENDERSON', 'CDM', 0, 86, 2, 1, 20000000);
INSERT INTO `players` VALUES (10, 'THIAGO', 'CM', 0, 85, 2, 0, 30000000);
INSERT INTO `players` VALUES (11, 'GEORGINIO WIJNALDUM', 'CM', 0, 76, 2, 0, 30000000);
INSERT INTO `players` VALUES (12, 'JOEL MATIP', 'CB', 0, 83, 2, 0, 18000000);
INSERT INTO `players` VALUES (13, 'JOE GOMEZ', 'CB', 0, 83, 2, 0, 30000000);
INSERT INTO `players` VALUES (14, 'XHERDAN SHAQIRI', 'RM', 0, 81, 2, 0, 12000000);
INSERT INTO `players` VALUES (15, 'NABY KEÏTA', 'CM', 0, 81, 2, 0, 32000000);
INSERT INTO `players` VALUES (16, 'JAMES MILNER', 'CM', 0, 80, 2, 0, 3000000);
INSERT INTO `players` VALUES (17, 'DIOGO JOTA', 'LW', 0, 80, 2, 0, 45000000);
INSERT INTO `players` VALUES (18, 'CHAMBERLAIN', 'CM', 0, 79, 2, 0, 18000000);
INSERT INTO `players` VALUES (19, 'KARIUS', 'GK', 0, 78, 2, 0, 1000000);
INSERT INTO `players` VALUES (20, 'DE BRUYNE', 'CAM', 0, 91, 3, 1, 100000000);
INSERT INTO `players` VALUES (21, 'AGÜERO', 'ST', 0, 89, 3, 0, 18000000);
INSERT INTO `players` VALUES (22, 'STERLING', 'LW', 0, 88, 3, 0, 90000000);
INSERT INTO `players` VALUES (23, 'EDERSON', 'GK', 0, 88, 3, 0, 50000000);
INSERT INTO `players` VALUES (24, 'LAPORTE', 'CB', 0, 87, 3, 0, 45000000);
INSERT INTO `players` VALUES (25, 'BERNARDO SILVA', 'RW', 0, 87, 3, 0, 70000000);
INSERT INTO `players` VALUES (26, 'MAHREZ', 'RW', 0, 85, 3, 0, 42000000);
INSERT INTO `players` VALUES (27, 'RODRI', 'CDM', 0, 85, 3, 0, 70000000);
INSERT INTO `players` VALUES (28, 'KYLE WALKER', 'RB', 0, 85, 3, 0, 28000000);
INSERT INTO `players` VALUES (29, 'GÜNDOĞAN', 'CM', 0, 83, 3, 0, 40000000);
INSERT INTO `players` VALUES (30, 'JOÃO CANCELO', 'RB', 0, 83, 3, 0, 55000000);
INSERT INTO `players` VALUES (31, 'GABRIEL JESUS', 'ST', 0, 83, 3, 0, 60000000);
INSERT INTO `players` VALUES (32, 'MENDY', 'LB', 0, 81, 3, 0, 20000000);
INSERT INTO `players` VALUES (33, 'FERRÁN TORRES', 'RM', 0, 81, 3, 0, 50000000);
INSERT INTO `players` VALUES (34, 'STONES', 'CB', 0, 80, 3, 0, 30000000);
INSERT INTO `players` VALUES (35, 'ZINCHENKO', 'LB', 0, 80, 3, 0, 25000000);
INSERT INTO `players` VALUES (36, 'OTAMENDI', 'CB', 0, 79, 3, 0, 8000000);
INSERT INTO `players` VALUES (37, 'NATHAN AKÉ', 'CB', 0, 79, 3, 0, 32000000);
INSERT INTO `players` VALUES (38, 'FODEN', 'CAM', 0, 79, 3, 0, 80000000);
INSERT INTO `players` VALUES (39, 'N\'GOLO KANTÉ', 'CDM', 0, 88, 4, 0, 55000000);
INSERT INTO `players` VALUES (40, 'HAVERTZ', 'CAM', 0, 85, 4, 0, 70000000);
INSERT INTO `players` VALUES (41, 'ZIYECH', 'CAM', 0, 85, 4, 0, 38000000);
INSERT INTO `players` VALUES (42, 'WERNER', 'ST', 0, 85, 4, 0, 65000000);
INSERT INTO `players` VALUES (43, 'THIAGO SILVA', 'CB', 0, 85, 4, 0, 3000000);
INSERT INTO `players` VALUES (44, 'AZPILICUETA', 'RB', 0, 84, 4, 0, 13000000);
INSERT INTO `players` VALUES (45, 'JORGINHO', 'CM', 0, 83, 4, 1, 40000000);
INSERT INTO `players` VALUES (46, 'KOVAČIĆ', 'CM', 0, 83, 4, 0, 45000000);
INSERT INTO `players` VALUES (47, 'KEPA', 'GK', 0, 82, 4, 0, 13000000);
INSERT INTO `players` VALUES (48, 'MARCOS ALONSO', 'LB', 0, 81, 4, 0, 12000000);
INSERT INTO `players` VALUES (49, 'ANTONIO RÜDIGER', 'CB', 0, 81, 4, 0, 28000000);
INSERT INTO `players` VALUES (50, 'PULISIC', 'LW', 0, 81, 4, 0, 50000000);
INSERT INTO `players` VALUES (51, 'CHILWELL', 'LB', 0, 81, 4, 0, 45000000);
INSERT INTO `players` VALUES (52, 'ZOUMA', 'CB', 0, 80, 4, 0, 32000000);
INSERT INTO `players` VALUES (53, 'MASON MOUNT', 'CAM', 0, 80, 4, 0, 75000000);
INSERT INTO `players` VALUES (54, 'OLIVIER GIROUD', 'ST', 0, 79, 4, 0, 4000000);
INSERT INTO `players` VALUES (55, 'EMERSON', 'LB', 0, 79, 4, 0, 12000000);
INSERT INTO `players` VALUES (56, 'ANDREAS CHRISTENSEN', 'CB', 0, 79, 4, 0, 30000000);
INSERT INTO `players` VALUES (57, 'TIEMOUÉ BAKAYOKO', 'CDM', 0, 79, 4, 0, 20000000);
INSERT INTO `players` VALUES (58, 'ROSS BARKLEY', 'CM', 0, 78, 4, 0, 20000000);
INSERT INTO `players` VALUES (59, 'RUBEN LOFTUS-CHEEK', 'CM', 0, 78, 4, 0, 18000000);
INSERT INTO `players` VALUES (60, 'TAMMY ABRAHAM', 'ST', 0, 78, 4, 0, 38000000);
INSERT INTO `players` VALUES (61, 'HARRY KANE', 'ST', 0, 88, 5, 0, 120000000);
INSERT INTO `players` VALUES (62, 'HEUNG MIN', 'LM', 0, 87, 5, 0, 85000000);
INSERT INTO `players` VALUES (63, 'HUGO LLORIS', 'GK', 0, 87, 5, 1, 9000000);
INSERT INTO `players` VALUES (64, 'TOBY ALDERWEIRELD', 'CB', 0, 85, 5, 0, 11000000);
INSERT INTO `players` VALUES (65, 'GARETH BALE', 'RW', 0, 83, 5, 0, 18000000);
INSERT INTO `players` VALUES (66, 'LUCAS MOURA', 'RM', 0, 83, 5, 0, 25000000);
INSERT INTO `players` VALUES (67, 'DELE ALLI', 'CAM', 0, 83, 5, 0, 30000000);
INSERT INTO `players` VALUES (68, 'STEVEN BERGWIJN', 'LM', 0, 83, 5, 0, 22000000);
INSERT INTO `players` VALUES (69, 'GIOVANI LO CELSO', 'CM', 0, 82, 5, 0, 27000000);
INSERT INTO `players` VALUES (70, 'REGUILÓN', 'LB', 0, 82, 5, 0, 25000000);
INSERT INTO `players` VALUES (71, 'MATT DOHERTY', 'RWB', 0, 81, 5, 0, 16000000);
INSERT INTO `players` VALUES (72, 'DAVINSON SÁNCHEZ', 'CB', 0, 81, 5, 0, 32000000);
INSERT INTO `players` VALUES (73, 'ERIK LAMELA', 'RM', 0, 80, 5, 0, 16000000);
INSERT INTO `players` VALUES (74, 'SERGE AURIER', 'RB', 0, 80, 5, 0, 20000000);
INSERT INTO `players` VALUES (75, 'BEN DAVIES', 'LB', 0, 80, 5, 0, 16000000);
INSERT INTO `players` VALUES (76, 'PIERRE-EMILE HØJBJERG', 'CDM', 0, 80, 5, 0, 35000000);
INSERT INTO `players` VALUES (77, 'TANGUY NDOMBELE', 'CM', 0, 80, 5, 0, 50000000);
INSERT INTO `players` VALUES (78, 'DANNY ROSE', 'LB', 0, 79, 5, 0, 3000000);
INSERT INTO `players` VALUES (79, 'MOUSSA SISSOKO', 'CM', 0, 79, 5, 0, 10000000);
INSERT INTO `players` VALUES (80, 'HARRY WINKS', 'CDM', 0, 79, 5, 0, 20000000);
INSERT INTO `players` VALUES (81, 'ERIC DIER', 'CDM', 0, 78, 5, 0, 22000000);
INSERT INTO `players` VALUES (82, 'PAULO GAZZANIGA', 'GK', 0, 77, 5, 0, 3000000);

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
-- Records of stadiums
-- ----------------------------
INSERT INTO `stadiums` VALUES (1, 'Anfield', 54074, 7);
INSERT INTO `stadiums` VALUES (2, 'Emirates Stadium', 60704, 1);
INSERT INTO `stadiums` VALUES (3, 'Etihad Stadium', 55017, 10);
INSERT INTO `stadiums` VALUES (4, 'Stamford Bridge', 40853, 1);
INSERT INTO `stadiums` VALUES (5, 'Tottenham Hotspur Stadium', 62062, 1);
INSERT INTO `stadiums` VALUES (6, 'Old Trafford', 74879, 10);
INSERT INTO `stadiums` VALUES (7, 'Goodison Park', 39571, 7);
INSERT INTO `stadiums` VALUES (8, 'King Power Stadium', 32273, 9);
INSERT INTO `stadiums` VALUES (9, 'Molineux Stadium', 32050, 15);
INSERT INTO `stadiums` VALUES (10, 'London Stadium', 60000, 1);
INSERT INTO `stadiums` VALUES (11, 'Villa Park', 42682, 2);
INSERT INTO `stadiums` VALUES (12, 'St James Park', 52338, 11);
INSERT INTO `stadiums` VALUES (13, 'Craven Cottage', 19000, 1);
INSERT INTO `stadiums` VALUES (14, 'Selhurst Park', 26047, 1);
INSERT INTO `stadiums` VALUES (15, 'St Mary\'s Stadium', 32384, 13);
INSERT INTO `stadiums` VALUES (16, 'AMEX Stadium', 30666, 3);
INSERT INTO `stadiums` VALUES (17, 'Elland Road', 37890, 8);
INSERT INTO `stadiums` VALUES (18, 'Turf Moor', 21994, 4);
INSERT INTO `stadiums` VALUES (19, 'Bramall Lane', 32702, 12);
INSERT INTO `stadiums` VALUES (20, 'The Hawthorns', 26850, 14);

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

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES (2, 'Liverpool FC', 7, 1, 1);
INSERT INTO `teams` VALUES (3, 'Manchester City', 10, 3, 2);
INSERT INTO `teams` VALUES (4, 'Chelsea FC', 1, 4, 3);
INSERT INTO `teams` VALUES (5, 'Tottenham Hotspur', 1, 5, 4);
INSERT INTO `teams` VALUES (6, 'Manchester United', 10, 6, 5);
INSERT INTO `teams` VALUES (7, 'Arsenal FC', 1, 2, 6);
INSERT INTO `teams` VALUES (8, 'Everton FC', 7, 7, 7);
INSERT INTO `teams` VALUES (9, 'Leicester City', 9, 8, 8);
INSERT INTO `teams` VALUES (10, 'Wolverhampton Wanderers', 15, 9, 9);
INSERT INTO `teams` VALUES (11, 'West Ham United', 1, 10, 10);
INSERT INTO `teams` VALUES (12, 'Aston Villa', 2, 11, 11);
INSERT INTO `teams` VALUES (13, 'Newcastle United', 11, 12, 12);
INSERT INTO `teams` VALUES (14, 'Fulham FC', 1, 13, 13);
INSERT INTO `teams` VALUES (15, 'Crystal Palace', 1, 14, 14);
INSERT INTO `teams` VALUES (16, 'Southampton FC', 13, 15, 15);
INSERT INTO `teams` VALUES (17, 'Brighton & Hove Albion', 3, 16, 16);
INSERT INTO `teams` VALUES (18, 'Leeds United', 8, 17, 17);
INSERT INTO `teams` VALUES (19, 'Burnley FC', 4, 18, 18);
INSERT INTO `teams` VALUES (20, 'Sheffield United', 12, 19, 19);
INSERT INTO `teams` VALUES (21, 'West Bromwich Albion', 14, 20, 20);

SET FOREIGN_KEY_CHECKS = 1;
