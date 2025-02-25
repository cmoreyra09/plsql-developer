
/*

    En PL/SQL, la estructura CASE WHEN se utiliza para evaluar múltiples condiciones en un formato más limpio y estructurado que IF-ELSIF-ELSE. Se puede usar en expresiones dentro de consultas SQL o dentro de bloques PL/SQL.
  
  
    Condicionales CASE WHEN

*/




    DECLARE dayInt INT := 5;


    BEGIN

        CASE
            WHEN dayInt = 1 
                THEN DBMS_OUTPUT.PUT_LINE('El dia que esta cursando es Lunes. ');
            WHEN dayInt = 2
                THEN DBMS_OUTPUT.PUT_LINE('El dia que se esta cursando es martes. ');
            WHEN dayInt = 3
                THEN DBMS_OUTPUT.PUT_LINE('El dia que se esta cursando es miercoles.');
            WHEN dayInt = 4
                THEN DBMS_OUTPUT.PUT_LINE('El dia que se esta cursando es jueves. ');
            WHEN dayInt = 5
                THEN DBMS_OUTPUT.PUT_LINE('El dia que se esta cursando es viernes. ');

            ELSE DBMS_OUTPUT.PUT_LINE('La opcion escogida no existe.');
            END CASE ;
        END;
        /