/*

    %Type: 
    
    El atributo %TYPE en Oracle se usa para declarar variables con el mismo tipo de dato que una columna de una tabla. 
    Esto garantiza que la variable siempre tenga el mismo tipo de dato que la columna, evitando errores y facilitando cambios en la estructura de la base de datos.

*/

---(1)

    DECLARE 
            v_precio PRODUCTO.PRECIO%TYPE;

    BEGIN
    
            SELECT 
                P.PRECIO INTO v_precio 
                    FROM PRODUCTO P WHERE P.codigo = 1;
            
            DBMS_OUTPUT.PUT_LINE('Precio: '|| v_precio);
        
        END;
        
        
        
--(2) 

SET SERVEROUTPUT    ON;

        DECLARE 
            v_codigo producto.codigo%type:= &codigo; -- Para asginar el codigo dinamico
            v_nombre producto.nombre%type;

        BEGIN
            
            SELECT 
                P.NOMBRE INTO v_nombre
                    FROM PRODUCTO P
                        WHERE p.codigo = v_codigo;
        
        
        
            DBMS_OUTPUT.PUT_LINE('Nombre del producto es: '|| v_nombre);
        
            END;
