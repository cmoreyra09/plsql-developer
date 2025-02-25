
/*


Explicación de las funciones en SQL (PL/SQL)
Las funciones en PL/SQL son bloques de código reutilizables que devuelven un valor después de ejecutar una serie de instrucciones. Son útiles cuando se necesita realizar cálculos o recuperar información dentro de consultas SQL o en bloques PL/SQL.

Características principales de una función en SQL:
Devuelve un solo valor

A diferencia de un procedimiento almacenado (PROCEDURE), una función siempre devuelve un valor con RETURN.
Se puede utilizar en consultas SQL

Ejemplo: SELECT obtener_precio(101) FROM dual;
Permite mejorar la reutilización de código

Se puede llamar varias veces sin repetir la lógica.
Debe especificar un tipo de retorno (RETURN tipo_dato)

Puede devolver valores escalares (NUMBER, VARCHAR2, DATE) o registros completos (%ROWTYPE).


*/




CREATE OR REPLACE FUNCTION obtenerPrecio(p_codigo producto.codigo%TYPE)
RETURN NUMBER
AS
    v_precio producto.precio%TYPE;
BEGIN
    -- Obtener el precio del producto
    SELECT precio INTO v_precio
    FROM producto
    WHERE codigo = p_codigo;

    -- Retornar el precio
    RETURN v_precio;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Si no se encuentra, devuelve NULL
    WHEN OTHERS THEN
        RETURN -1; -- Código de error genérico
END;
/



SELECT obtenerPrecio(1) FROM dual;



DECLARE
    v_precio NUMBER;
BEGIN
    v_precio := obtenerPrecio(101);
    DBMS_OUTPUT.PUT_LINE('El precio es: ' || v_precio);
END;
/
