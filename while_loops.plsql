/*

Bucle While
Crear una tabla de multiplicar con el bucle while 

*/


SET SERVEROUTPUT ON;


    DECLARE 
            contador INTEGER := 1;
            tabla    INTEGER := 12;

    BEGIN

        WHILE (contador < 13)
            LOOP
                DBMS_OUTPUT.PUT_LINE(contador || ' * ' || contador ||' = ' || contador * tabla);
                
                contador := contador + 1;

            END LOOP;

        END;
        /






/* 

    Insercion mediante while loops
    
*/



CREATE TABLE Estudiantes (

    id          INTEGER,
    nombre      NVARCHAR2(30)    

    
)


SET SERVEROUTPUT ON;

    DECLARE 
            contador INTEGER := 1;
        BEGIN
            
            WHILE (contador < 12)
            LOOP
        
                INSERT INTO Estudiantes
                    VALUES(contador,CONCAT('Estudiante',contador));
                    
                        DBMS_OUTPUT.PUT_LINE('Se ingreso registro: ' || contador||' .');
            
                contador := contador + 1;
            END LOOP;
            COMMIT; -- Confirmar los cambios en la base de datos
            
            
            -- Mostrar Registros insertados usando un cursor ....
            
            DBMS_OUTPUT.PUT_LINE('----- Registros en la tabla Estudiantes -----');

            FOR i in (SELECT id, nombre FROM Estudiantes ORDER BY id ) LOOP
                DBMS_OUTPUT.PUT_LINE('Id: '|| i.id || ' -Nombre: ' || i.nombre);
                
                END LOOP;

            END;

            











