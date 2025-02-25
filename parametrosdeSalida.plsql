/*

Explicación de los Parámetros de Salida (OUT) en PL/SQL
Los parámetros de salida (OUT) en procedimientos almacenados permiten que el procedimiento modifique una variable y devuelva un valor al bloque que lo llama. 
A diferencia de los parámetros IN (entrada), que solo reciben valores, los OUT devuelven resultados al final de la ejecución.


*/


CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%TYPE, p_producto OUT producto%ROWTYPE)
AS
BEGIN
    -- Obtener el producto de la tabla y asignarlo al parámetro de salida
    SELECT * INTO p_producto
    FROM producto
    WHERE codigo = p_codigo;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe el producto con código ' || p_codigo);
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/



DECLARE
    v_codigo producto.codigo%TYPE := &codigo;  -- Código ingresado por el usuario
    v_producto producto%ROWTYPE;  -- Variable que almacenará el resultado
BEGIN
    -- Llamamos al procedimiento pasando el parámetro de salida
    infoProducto(v_codigo, v_producto);

    -- Verificamos si el producto fue encontrado
    IF v_producto.codigo IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Información del producto con código ' || v_codigo); 
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre); 
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio); 
        DBMS_OUTPUT.PUT_LINE('Código fabricante: ' || v_producto.codigo_fabricante);
    END IF;
END;
/
