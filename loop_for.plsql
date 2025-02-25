/*

Bucle For
Crear una tabla de multiplicar con el bucle For 

*/


SET SERVEROUTPUT ON;


    DECLARE 
            contador INTEGER := 1;
            tabla    INTEGER := 12;

    BEGIN

        FOR contador IN 1..12
            LOOP
                DBMS_OUTPUT.PUT_LINE(contador || ' * ' || contador ||' = ' || contador * tabla);
                
            END LOOP;

        END;
        /

/*

    Buclefor Reverse : Itera pero al reves segun la logica propuesta.

*/


SET SERVEROUTPUT ON;


    DECLARE 
            contador INTEGER := 1;
            tabla    INTEGER := 12;

    BEGIN

        FOR contador  IN REVERSE 1..12
            LOOP
                DBMS_OUTPUT.PUT_LINE(contador || ' * ' || contador ||' = ' || contador * tabla);
                
            END LOOP;

        END;
        /
