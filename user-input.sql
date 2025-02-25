/* Crear INPUTS / Entradas de usuario para que ingresen su necesidad  */



/* Se pide que el usuario ingrese su nombre apellidos , y su lugar de residencia asi mismo la fecha de consulta solo dia int */


SET SERVEROUTPUT ON;

-- Pedir datos al usuario
ACCEPT nameUser     CHAR    PROMPT 'Ingrese su nombre: ';
ACCEPT lastUser     CHAR    PROMPT 'Ingrese su apellido: ';
ACCEPT ageUser      NUMBER  PROMPT 'Ingrese su edad: ';
ACCEPT yearBirth    NUMBER  PROMPT 'Ingrese su año de nacimiento: ';

DECLARE 
    nameUser  VARCHAR2(50)  := '&nameUser';
    lastUser  VARCHAR2(50)  := '&lastUser';
    ageUser   INTEGER       := TO_NUMBER('&ageUser');
    yearBirth INTEGER       := TO_NUMBER('&yearBirth');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Bienvenido estimado: ' || nameUser);
    DBMS_OUTPUT.PUT_LINE('Su apellido es: ' || lastUser);
    DBMS_OUTPUT.PUT_LINE('Tu edad es: ' || ageUser);
    DBMS_OUTPUT.PUT_LINE('Tu año de nacimiento es: ' || yearBirth);
END;
/
