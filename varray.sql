/*


    VARRAY := LISTAS DE DATOS

    ARRAYS

*/


SET SERVEROUTPUT ON ;


    DECLARE 
            TYPE alumnosArray IS VARRAY(3) OF VARCHAR(20);  -- Creando array solo de 3 registros que sera en cadena de texto
            TYPE notasArray   IS VARRAY(3) OF NUMBER(2);

            alumnos alumnosArray := alumnosArray('Carlos','Diego','Sandra');
            notas   notasArray   := notasArray(20,10,30);

                BEGIN 
                    
                    FOR i in 1..alumnos.count
                    LOOP

                        DBMS_OUTPUT.PUT_LINE('Alumnos: ' || alumnos(i) || ', Nota: '|| notas(i) ||' .');

                    END LOOP;
                    
                    END;

                    /   



SET SERVEROUTPUT ON;

DECLARE 
    TYPE alumnosArray IS VARRAY(3) OF VARCHAR2(20); -- Usar VARCHAR2 en lugar de VARCHAR
    TYPE notasArray   IS VARRAY(3) OF NUMBER(2);
    
    alumnos alumnosArray := alumnosArray('Carlos', 'Diego', 'Sandra');
    notas   notasArray   := notasArray(20, 10, 30);

BEGIN 
    FOR i IN 1..alumnos.COUNT LOOP  -- Se usa alumnos.COUNT para obtener el número de elementos
        DBMS_OUTPUT.PUT_LINE('Alumno: ' || alumnos(i) || ', Nota: ' || notas(i));
    END LOOP;
END;
/
