
/*  Como declarar Variables */

/* Escriba un programa que permita realizar el calculo de edad, que se muestre de salida su nombre fecha de nacimiento y la fecha actual */


/*

    En PL/SQL, las variables se declaran en la sección DECLARE, especificando su nombre, tipo de dato y opcionalmente un valor inicial con :=. Pueden ser de distintos tipos como INTEGER, VARCHAR, DATE, entre otros.

*/


SET SERVEROUTPUT ON;


DECLARE 
        yearBirth       INTEGER     :=  1996;
        currentYear     INTEGER     :=  EXTRACT(YEAR FROM  SYSDATE); -- Forma de extraer el año
        namerUser       VARCHAR(10) := 'Carlos';
        age             INTEGER     := currentYear - yearBirth;
        dateConsultin   DATE        := SYSDATE;

BEGIN 

    DBMS_OUTPUT.PUT_LINE('Hola el usuario que ingreso se llama ' || namerUser ||' .');
    DBMS_OUTPUT.PUT_LINE('La edad del usuario es '|| age || ' y su año de nacimiento fue ' || yearBirth ||' .');
    DBMS_OUTPUT.PUT_LINE('Fecha de consulta. ' || dateConsultin ||' .');

    END ;