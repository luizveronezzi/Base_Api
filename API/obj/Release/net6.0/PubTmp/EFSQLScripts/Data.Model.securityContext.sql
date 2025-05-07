CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `agendacab` (
        `id` int NOT NULL AUTO_INCREMENT,
        `idpessoa` int NOT NULL,
        `idcategoria` int NOT NULL,
        `nome` longtext CHARACTER SET utf8mb4 NOT NULL,
        `color` longtext CHARACTER SET utf8mb4 NOT NULL,
        `backcolor` longtext CHARACTER SET utf8mb4 NOT NULL,
        `tipo` int NOT NULL,
        `edicao` tinyint(1) NOT NULL,
        `mover` tinyint(1) NOT NULL,
        `check` tinyint(1) NOT NULL,
        CONSTRAINT `PK_agendacab` PRIMARY KEY (`id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `grupo` (
        `id` int NOT NULL AUTO_INCREMENT,
        `nomegrupo` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_grupo` PRIMARY KEY (`id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `agendaeven` (
        `id` int NOT NULL AUTO_INCREMENT,
        `idagecab` int NOT NULL,
        `start` datetime(6) NOT NULL,
        `end` datetime(6) NOT NULL,
        `titulo` longtext CHARACTER SET utf8mb4 NOT NULL,
        `diatodo` tinyint(1) NOT NULL,
        `url` longtext CHARACTER SET utf8mb4 NULL,
        `display` longtext CHARACTER SET utf8mb4 NULL,
        `descricao` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_agendaeven` PRIMARY KEY (`id`),
        CONSTRAINT `FK_agendaeven_agendacab_idagecab` FOREIGN KEY (`idagecab`) REFERENCES `agendacab` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `empresa` (
        `id` int NOT NULL AUTO_INCREMENT,
        `razaosocial` longtext CHARACTER SET utf8mb4 NULL,
        `email` longtext CHARACTER SET utf8mb4 NULL,
        `id_grupo` int NOT NULL,
        CONSTRAINT `PK_empresa` PRIMARY KEY (`id`),
        CONSTRAINT `FK_empresa_grupo_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `funcsal` (
        `id` int NOT NULL AUTO_INCREMENT,
        `nome` longtext CHARACTER SET utf8mb4 NULL,
        `salario` decimal(65,30) NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_funcsal` PRIMARY KEY (`id`),
        CONSTRAINT `FK_funcsal_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `paramcusto` (
        `id` int NOT NULL AUTO_INCREMENT,
        `diames` decimal(65,30) NOT NULL,
        `horadia` decimal(65,30) NOT NULL,
        `encargos` decimal(65,30) NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_paramcusto` PRIMARY KEY (`id`),
        CONSTRAINT `FK_paramcusto_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `perfil` (
        `id` int NOT NULL AUTO_INCREMENT,
        `descricao` longtext CHARACTER SET utf8mb4 NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_perfil` PRIMARY KEY (`id`),
        CONSTRAINT `FK_perfil_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `projetos` (
        `id` int NOT NULL AUTO_INCREMENT,
        `nro` longtext CHARACTER SET utf8mb4 NULL,
        `diames` decimal(65,30) NOT NULL,
        `horadia` decimal(65,30) NOT NULL,
        `encargos` decimal(65,30) NOT NULL,
        `nomecliente` longtext CHARACTER SET utf8mb4 NULL,
        `acrecimoquebra` decimal(65,30) NOT NULL,
        `material` decimal(65,30) NOT NULL,
        `fixomo` decimal(65,30) NOT NULL,
        `diversos` decimal(65,30) NOT NULL,
        `recebido` decimal(65,30) NOT NULL,
        `gasto` decimal(65,30) NOT NULL,
        `apurado` decimal(65,30) NOT NULL,
        `comissaoarquiteto` decimal(65,30) NOT NULL,
        `custodoprojeto` decimal(65,30) NOT NULL,
        `totalmaodeobra` decimal(65,30) NOT NULL,
        `rentabilidade` decimal(65,30) NOT NULL,
        `tiporentabilidade` longtext CHARACTER SET utf8mb4 NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_projetos` PRIMARY KEY (`id`),
        CONSTRAINT `FK_projetos_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `rotina` (
        `id` int NOT NULL AUTO_INCREMENT,
        `idpai` int NOT NULL,
        `descricao` longtext CHARACTER SET utf8mb4 NULL,
        `link` longtext CHARACTER SET utf8mb4 NULL,
        `icone` longtext CHARACTER SET utf8mb4 NULL,
        `modulo` longtext CHARACTER SET utf8mb4 NULL,
        `menu` tinyint(1) NOT NULL,
        `ordem` int NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_rotina` PRIMARY KEY (`id`),
        CONSTRAINT `FK_rotina_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `usuario` (
        `id` int NOT NULL AUTO_INCREMENT,
        `nome` longtext CHARACTER SET utf8mb4 NOT NULL,
        `senha` longtext CHARACTER SET utf8mb4 NOT NULL,
        `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
        `departamento` longtext CHARACTER SET utf8mb4 NULL,
        `tema` longtext CHARACTER SET utf8mb4 NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_usuario` PRIMARY KEY (`id`),
        CONSTRAINT `FK_usuario_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `projmoves` (
        `id` int NOT NULL AUTO_INCREMENT,
        `data` datetime(6) NOT NULL,
        `horainicio` longtext CHARACTER SET utf8mb4 NULL,
        `horafinal` longtext CHARACTER SET utf8mb4 NULL,
        `horainiint` longtext CHARACTER SET utf8mb4 NULL,
        `horafimint` longtext CHARACTER SET utf8mb4 NULL,
        `jornada` decimal(65,30) NOT NULL,
        `id_projetos` int NOT NULL,
        `id_funcsal` int NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_projmoves` PRIMARY KEY (`id`),
        CONSTRAINT `FK_projmoves_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_projmoves_funcsal_id_funcsal` FOREIGN KEY (`id_funcsal`) REFERENCES `funcsal` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_projmoves_projetos_id_projetos` FOREIGN KEY (`id_projetos`) REFERENCES `projetos` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `perfil_rotina` (
        `id` int NOT NULL AUTO_INCREMENT,
        `id_perfil` int NOT NULL,
        `id_rotina` int NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_perfil_rotina` PRIMARY KEY (`id`),
        CONSTRAINT `FK_perfil_rotina_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_perfil_rotina_perfil_id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_perfil_rotina_rotina_id_rotina` FOREIGN KEY (`id_rotina`) REFERENCES `rotina` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `sobre_acessos` (
        `id` int NOT NULL AUTO_INCREMENT,
        `id_usuario` int NOT NULL,
        `id_usuario_copia` int NOT NULL,
        `data_inicio` datetime(6) NOT NULL,
        `data_fim` datetime(6) NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_sobre_acessos` PRIMARY KEY (`id`),
        CONSTRAINT `FK_sobre_acessos_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_sobre_acessos_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_sobre_acessos_usuario_id_usuario_copia` FOREIGN KEY (`id_usuario_copia`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE TABLE `acessos` (
        `id` int NOT NULL AUTO_INCREMENT,
        `id_usuario` int NOT NULL,
        `id_rotina` int NOT NULL,
        `id_perfil` int NOT NULL,
        `id_grupo` int NOT NULL,
        `id_empresa` int NOT NULL,
        CONSTRAINT `PK_acessos` PRIMARY KEY (`id`),
        CONSTRAINT `FK_acessos_empresa_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_acessos_perfil_rotina_id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_rotina` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_acessos_rotina_id_rotina` FOREIGN KEY (`id_rotina`) REFERENCES `rotina` (`id`) ON DELETE CASCADE,
        CONSTRAINT `FK_acessos_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `agendacab` (`id`, `backcolor`, `check`, `color`, `edicao`, `idcategoria`, `idpessoa`, `mover`, `nome`, `tipo`)
    VALUES (1, '#9134c1', TRUE, '#fffff', FALSE, 1, 0, FALSE, 'Feriados', 2);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `grupo` (`id`, `nomegrupo`)
    VALUES (1, 'Guerra');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `empresa` (`id`, `email`, `id_grupo`, `razaosocial`)
    VALUES (1, 'furacao-cmp@furacao.com.br', 1, 'Fabrica de Moveis Planejados');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `paramcusto` (`id`, `diames`, `encargos`, `horadia`, `id_empresa`, `id_grupo`)
    VALUES (1, 21.6, 1.3, 8.0, 1, 1);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `rotina` (`id`, `descricao`, `icone`, `id_empresa`, `id_grupo`, `idpai`, `link`, `menu`, `modulo`, `ordem`)
    VALUES (1, 'Cadastros', 'bi bi-archive', 1, 1, 0, NULL, TRUE, 'Basico', 1);
    INSERT INTO `rotina` (`id`, `descricao`, `icone`, `id_empresa`, `id_grupo`, `idpai`, `link`, `menu`, `modulo`, `ordem`)
    VALUES (2, 'Funcionários', 'bi bi-person-bounding-box', 1, 1, 1, '/FuncSal/FuncSal', TRUE, NULL, 2);
    INSERT INTO `rotina` (`id`, `descricao`, `icone`, `id_empresa`, `id_grupo`, `idpai`, `link`, `menu`, `modulo`, `ordem`)
    VALUES (3, 'Parâmetros', 'bi bi-sliders', 1, 1, 1, '/ParamCusto/ParamCusto', TRUE, NULL, 3);
    INSERT INTO `rotina` (`id`, `descricao`, `icone`, `id_empresa`, `id_grupo`, `idpai`, `link`, `menu`, `modulo`, `ordem`)
    VALUES (4, 'Projetos', 'bi bi-pencil-square', 1, 1, 1, '/Projetos/Projetos', TRUE, NULL, 4);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `usuario` (`id`, `departamento`, `email`, `id_empresa`, `id_grupo`, `nome`, `senha`, `tema`)
    VALUES (1, 'INFORMATICA', 'ti06@furacao.com.br', 1, 1, 'LUIZ VERONEZZI', '123mudar', 'dark');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_acessos_id_empresa` ON `acessos` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_acessos_id_perfil` ON `acessos` (`id_perfil`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_acessos_id_rotina` ON `acessos` (`id_rotina`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_acessos_id_usuario` ON `acessos` (`id_usuario`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_agendaeven_idagecab` ON `agendaeven` (`idagecab`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_empresa_id_grupo` ON `empresa` (`id_grupo`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_funcsal_id_empresa` ON `funcsal` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_paramcusto_id_empresa` ON `paramcusto` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_perfil_id_empresa` ON `perfil` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_perfil_rotina_id_empresa` ON `perfil_rotina` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_perfil_rotina_id_perfil` ON `perfil_rotina` (`id_perfil`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_perfil_rotina_id_rotina` ON `perfil_rotina` (`id_rotina`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_projetos_id_empresa` ON `projetos` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_projmoves_id_empresa` ON `projmoves` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_projmoves_id_funcsal` ON `projmoves` (`id_funcsal`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_projmoves_id_projetos` ON `projmoves` (`id_projetos`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_rotina_id_empresa` ON `rotina` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_sobre_acessos_id_empresa` ON `sobre_acessos` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_sobre_acessos_id_usuario` ON `sobre_acessos` (`id_usuario`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_sobre_acessos_id_usuario_copia` ON `sobre_acessos` (`id_usuario_copia`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE UNIQUE INDEX `IX_usuario_email` ON `usuario` (`email`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    CREATE INDEX `IX_usuario_id_empresa` ON `usuario` (`id_empresa`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241021122059_inicio') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20241021122059_inicio', '6.0.7');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

