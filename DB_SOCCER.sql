DROP TABLE IF EXISTS `st_profili`;
CREATE TABLE IF NOT EXISTS `st_profili` (
  `id_profilo` int(10) NOT NULL AUTO_INCREMENT,
  `profilo` varchar(100) NULL,
  `desc_profilo` TEXT NULL,
  PRIMARY KEY (`id_profilo`),
  UNIQUE KEY `profilo` (`profilo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
insert into st_profili(id_profilo, profilo, desc_profilo) values(null, 'ADMIN', 'Profilo AMMINISTRATORE di sistema.');
insert into st_profili(id_profilo, profilo, desc_profilo) values(null, 'PROFESSIONAL', 'Profilo professionale di sistema.');
insert into st_profili(id_profilo, profilo, desc_profilo) values(null, 'FREE', 'Profilo gratuito di sistema.');

DROP TABLE IF EXISTS `st_gruppi`;
CREATE TABLE IF NOT EXISTS `st_gruppi` (
  `id_gruppo` int(10) NOT NULL AUTO_INCREMENT,
  `gruppo` varchar(100) NULL,
  `desc_gruppo` TEXT NULL,
  PRIMARY KEY (`id_gruppo`),
  UNIQUE KEY `gruppo` (`gruppo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
insert into st_gruppi(id_gruppo, gruppo, desc_gruppo) values(null, 'SISTEMA', 'Gruppo di sistema.'); 

DROP TABLE IF EXISTS `st_squadre`;
CREATE TABLE IF NOT EXISTS `st_squadre` (
  `id_squadra` int(10) NOT NULL AUTO_INCREMENT,
  `squadra` varchar(100) NULL,
  `desc_squadra` TEXT NULL,
  PRIMARY KEY (`id_squadra`),
  UNIQUE KEY `squadra` (`squadra`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
insert into st_gruppi(id_squadra, squadra, desc_squadra) values(null, 'SS LAZIO ELITE 2007', 'Squadra elite della SS LAZIO anno 2007.'); 

DROP TABLE IF EXISTS `st_utenti`;
CREATE TABLE IF NOT EXISTS `st_utenti` (
  `id_utente` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nome` varchar(100) NULL,
  `cognome` varchar(100) NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NULL,
  `indirizzo` varchar(100) NULL,
  `civico` int(10) NULL,
  `cap` varchar(10) NULL,
  `citta` varchar(50) NULL,
  `nazione` varchar(50) NULL,
  `id_profilo` int(10) NOT NULL,
  `id_gruppo` int(10) NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `st_calciatori`;
CREATE TABLE IF NOT EXISTS `st_calciatori` (
  `id_calciatore` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) DEFAULT NULL,
  `luogo_nascita` varchar(100) NOT NULL,
  `data_nascita` timestamp NULL,
  `nazionalita` varchar(100) NULL,
  `altezza_cm` int(3) DEFAULT 0,
  `peso_kg` int(2) DEFAULT 0,
  `creatore` varchar(100) NULL,
  PRIMARY KEY (`id_calciatore`),
  UNIQUE KEY `id_calciatore` (`id_calciatore`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `st_calciatori` (`id_calciatore`, `nome`, `cognome`, `luogo_nascita`, `data_nascita`, `nazionalita`, `altezza_cm`, `peso_kg`, `creatore`) VALUES
(1, 'SIMONE', 'TONNI', 'ROMA', '1978-01-06 23:00:00', 'ITALIANA', 181, 83, 'simone'),
(2, 'FRANCESCO', 'TOTTI', 'ROMA', '1976-09-26 23:00:00', 'ITALIANA', 180, 82, 'simone');


DROP TABLE IF EXISTS `st_schede`;
CREATE TABLE IF NOT EXISTS `st_schede` (
  `id_scheda` int(10) NOT NULL AUTO_INCREMENT,
  `id_calciatore` int(10) NOT NULL,
  `creatore` varchar(100) NULL,
  `creazione` timestamp DEFAULT current_timestamp NOT NULL,
  `modifica` timestamp NULL,
  -- informazioni generali
  `costituzione` ENUM('LONGILINEA', 'NORMOLINEA', 'BREVILINEA') NULL, 
  `ruolo` varchar(100) NULL,
  `club` varchar(100) NULL,
  `gara` varchar(100) NULL,
  `data_gara` timestamp NULL,
  `campionato` varchar(100) NULL,
  `situazione_campo` varchar(100) NULL,
  `temperatura` varchar(100) NULL,
  `spettatori` varchar(100) NULL,
  `importanza_gara` varchar(100) NULL,
  -- note fisiche
  `agilita` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `coordinazione` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `elevazione` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `forza` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `resistenza` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `struttura_fisica` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `velocita_nel_breve` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `velocita_nel_lungo` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  -- note tecniche
  `controllo` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `dribbling` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `gioco_aereo` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `modo_di_calciare` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `uso_piede_sinistro` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `uso_piede_destro` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  -- note tattiche
  `posizionamento_in_campo` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `marcamento` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `smarcamento` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `visione_di_gioco` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  -- note caratteriali
  `autorita_nel_gioco` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `concentrazione` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `motivazione` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  `spirito_di_sacrificio` ENUM('INSUFFICIENTE', 'SUFFICIENTE', 'DISCRETO', 'BUONO', 'OTTIMO') NULL,
  PRIMARY KEY (`id_scheda`),
  UNIQUE KEY `id_scheda` (`id_scheda`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


