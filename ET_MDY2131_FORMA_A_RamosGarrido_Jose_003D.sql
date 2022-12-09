--Creacion de Usuarios--

//Usuario 1

Usuario: MDY2131_ET_FA
Contraseña: MaxxSalud_01

CREATE USER "MDY2131_ET_FA" IDENTIFIED BY "MaxSalud_1"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER "MDY2131_ET_FA" QUOTA UNLIMITED ON "USERS";

GRANT "CONNECT" TO "MDY2131_ET_FA" ;
GRANT "RESOURCE" TO "MDY2131_ET_FA" ;

GRANT CREATE INDEXTYPE TO "MDY2131_ET_FA" ;
GRANT CREATE TABLE TO "MDY2131_ET_FA" ;
GRANT CREATE SEQUENCE TO "MDY2131_ET_FA" ;
GRANT ALTER TABLESPACE TO "MDY2131_ET_FA" ;
GRANT DROP TABLESPACE TO "MDY2131_ET_FA" ;
GRANT CREATE SYNONYM TO "MDY2131_ET_FA" ;

//Usuario 2

Usuario: MDY2131_ET_FA_DES
Contraseña: MaxxSalud_02

CREATE USER "MDY2131_ET_FA_DES" IDENTIFIED BY "MaxxSalud_02"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER "MDY2131_ET_FA_DES" QUOTA UNLIMITED ON "USERS";

GRANT "CONNECT" TO "MDY2131_ET_FA_DES" ;

GRANT CREATE TRIGGER TO "MDY2131_ET_FA_DES" ;
GRANT CREATE MATERIALIZED VIEW TO "MDY2131_ET_FA_DES" ;
GRANT CREATE VIEW TO "MDY2131_ET_FA_DES" ;
GRANT CREATE SESSION TO "MDY2131_ET_FA_DES" ;
GRANT CREATE PROCEDURE TO "MDY2131_ET_FA_DES" ;

//Usuario 3

Usuario: MDY2131_ET_FA_CON
Contraseña: MaxxSalud_03


CREATE USER "MDY2131_ET_FA_CON" IDENTIFIED BY "MaxxSalud_03"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER "MDY2131_ET_FA_CON" QUOTA UNLIMITED ON "USERS";


GRANT CREATE SESSION TO "MDY2131_ET_FA_CON" ;

--Creacion de Sinonimos

create synonym SYN_ESPECIALIDAD FOR ESPECIALIDAD;
create synonym SYN_MEDICO FOR MEDICO;
create synonym SYN_ATENCION FOR ATENCION;
create synonym SYN_SELECCION_ESPECIALIDAD FOR SELECCION_ESPECIALIDAD;

--Grant De Datos


GRANT SELECT ON SYN_ESPECIALIDAD TO MDY2131_ET_FA_DES;
GRANT SELECT ON SYN_MEDICO TO MDY2131_ET_FA_DES;
GRANT SELECT ON SYN_ATENCION TO MDY2131_ET_FA_DES;

GRANT SELECT ON SYN_ESPECIALIDAD TO MDY2131_ET_FA_CON;
GRANT SELECT ON SYN_MEDICO TO MDY2131_ET_FA_CON;
GRANT SELECT ON SYN_ATENCION TO MDY2131_ET_FA_CON;
GRANT SELECT,INSERT,UPDATE ON SYN_SELECCION_ESPECIALIDAD TO MDY2131_ET_FA_CON;


--INFORME 1

SELECT
    e.nombre AS "ESPECIALIDAD",
    COUNT(a.ate_id) AS "CANTIDAD ATENCIONES",
    TO_CHAR(SUM(a.costo), '$999G999G999') AS "COSTO TOTAL",
    TO_CHAR(AVG(a.costo), '$999G999G999') AS "COSTO PROMEDIO"
FROM
    MDY2131_ET_FA.SYN_ESPECIALIDAD E
    INNER JOIN MDY2131_ET_FA.SYN_MEDICO M ON e.esp_id = m.esp_id
    INNER JOIN mdy2131_et_fa.SYN_ATENCION A ON m.med_run = a.med_run
    GROUP BY e.nombre
    

    ;
	
--INFORME 2

SELECT
    sysdate                                   AS "FECHA EMISION DE INFORME",
    e.esp_id                                  AS "ID ESPECIALIDAD",
    to_char(AVG(m.sueldo_base), '$9G999G999') AS "PROMEDIO SUELDO MEDICO",
    e.nombre                                  AS "ESPECIALIDAD",
    COUNT(e.esp_id)                           AS "CANTIDAD ATENCIONES"
FROM
         mdy2131_et_fa.syn_especialidad e
    INNER JOIN mdy2131_et_fa.syn_medico   m ON e.esp_id = m.esp_id
    INNER JOIN mdy2131_et_fa.syn_atencion a ON m.med_run = a.med_run
GROUP BY
    e.esp_id,
    e.nombre
HAVING
    COUNT(e.esp_id) > 30
ORDER BY
    e.nombre ASC;
	
	
	
	
--1. ¿Cuál es el problema que se debe resolver?
-- R: ACTUALIZACION DE LOS DESCUENTOS CORRESPONDIENTES A CADA ESPECIALIDAD Y LA CREACION DE 2 ALTERNATIVAS DE SOLUCION
--2. ¿Cuál es la información significativa que necesita para resolver el problema?
-- R: EL INFORME 1 Y LOS DATOS ALMACENADOS DEL MISMO
--3. ¿Cuál es el propósito de la solución que se requiere?
-- R: ACTUALIZAR LOS DATOS ALMACENADOS EN LA TABLA "SELECCION_ESPECIALIDAD"
--4. Detalle los pasos, en lenguaje natural, necesarios para construir la alternativa que usa
--SUBCONSULTA.
--5. Detalle los pasos, en lenguaje natural, necesarios para construir la alternativa que usa OPERADOR
--SET.