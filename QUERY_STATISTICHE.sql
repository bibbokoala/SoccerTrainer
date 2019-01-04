-- SoccerTrainer QUERY STATISTICHE

 SELECT ce.id_calciatore,  
               DATE_FORMAT(e.data_inizio,'%Y-%m') as mese,  
               count(1) partite_giocate,  
               ROUND(sum(ce.minutaggio)/count(1),2) as media_minuti,  
               ROUND(SUM(CASE   
                 WHEN ce.valutazione = 'INSUFFICIENTE' THEN 4  
                 WHEN ce.valutazione = 'SUFFICIENTE' THEN 6  
                 WHEN ce.valutazione = 'DISCRETO' THEN 7  
                 WHEN ce.valutazione = 'BUONO' THEN 8  
                 WHEN ce.valutazione = 'OTTIMO' THEN 10  
                 ELSE 0   
                END)/count(1),2) as media_voto  
          FROM st_calciatori_evento ce  
          JOIN st_eventi e ON e.id_evento = ce.id_evento  
         WHERE ce.id_calciatore= '48'  
           AND ce.minutaggio>0   
           AND ce.valutazione is not null  
         GROUP BY ce.id_calciatore, DATE_FORMAT(e.data_inizio,'%Y-%m');

SELECT id_squadra , 
       tipo_evento, 
       DATE_FORMAT(data_inizio,'%Y-%m') as mese, 
       count(1) as numero,
       sum(IF(risultato='VITTORIA', 1, 0)) as vittorie,       
       sum(IF(risultato='PAREGGIO', 1, 0)) as pareggi,       
       sum(IF(risultato='SCONFITTA', 1, 0)) as sconfitte    
FROM st_eventi
WHERE id_squadra=1
AND data_inizio<CURRENT_TIMESTAMP
GROUP BY tipo_evento, mese
ORDER BY tipo_evento, mese
/*
SELECT id_squadra , 
       tipo_evento, 
       DATE_FORMAT(data_inizio,'%Y-%m') as mese, 
       sum(IF(data_inizio<CURRENT_TIMESTAMP, 1, 0)) as eventi_passati, 
       sum(IF(data_inizio>=CURRENT_TIMESTAMP, 1, 0)) as eventi_futuri,
       sum(IF(risultato='VITTORIA', 1, 0)) as vittorie,       
       sum(IF(risultato='PAREGGIO', 1, 0)) as pareggi,       
       sum(IF(risultato='SCONFITTA', 1, 0)) as sconfitte    
FROM st_eventi
WHERE id_squadra=1
GROUP BY tipo_evento, mese
ORDER BY tipo_evento, mese
*/

/***
DROP FUNCTION IF EXISTS NUMERO_PARTITE;
DELIMITER $$
CREATE FUNCTION NUMERO_PARTITE(p_fleet_hcode VARCHAR(50), p_fms_status VARCHAR(3) ) 
  RETURNS INT
 BEGIN
  DECLARE result INT DEFAULT 0;
  DECLARE v_finished INTEGER DEFAULT 0;
  DECLARE ve_cursor CURSOR FOR
   SELECT count(1) 
     FROM vehicles 
     JOIN fleet_has_vehicle USING(vehicle_code) 
    WHERE fleet_code in (select f2.fleet_code from fleet f2 where f2.hcode like CONCAT(p_fleet_hcode,'%') )
      AND fms_status = p_fms_status;
       -- declare NOT FOUND handler
        DECLARE CONTINUE HANDLER 
               FOR NOT FOUND SET v_finished = 1;
        OPEN ve_cursor;
        get_ve: LOOP
        FETCH ve_cursor INTO result;
        IF v_finished = 1 THEN 
          LEAVE get_ve;
        END IF;
   
  END LOOP;
  CLOSE ve_cursor;
   
  RETURN result;
 END;
$$
DELIMITER ;
***/

SELECT e.tipo_evento, e.data_inizio, count(ce.id_calciatore)
  FROM st_eventi e 
  JOIN st_calciatori_evento ce on ce.id_evento=e.id_evento
  JOIN st_squadre s on s.id_squadra=e.id_squadra 
 WHERE e.id_squadra=1
   AND e.data_inizio<CURRENT_TIMESTAMP
 GROUP BY e.id_evento, e.data_inizio


