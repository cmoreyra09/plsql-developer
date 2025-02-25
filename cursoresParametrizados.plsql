/*

Explicación de Cursores Parametrizados en PL/SQL
Un cursor parametrizado en PL/SQL es un cursor que recibe parámetros para filtrar los datos en su consulta. Esto permite reutilizar el mismo cursor para diferentes valores sin necesidad de escribir múltiples cursores.

Resumen
Los cursores parametrizados permiten filtrar datos dinámicamente.
Son útiles cuando necesitamos usar un mismo cursor para distintos valores.
Reducen la duplicación de código y mejoran la eficiencia en PL/SQL.

Este enfoque hace que el código sea más flexible, claro y reutilizable.

*/

SET SERVEROUTPUT ON;

DECLARE
    -- 🔹 Cursor parametrizado que filtra productos por fabricante
    CURSOR c_productos_fabricante (p_cod_fab NUMBER) IS
        SELECT * FROM producto
        WHERE codigo_fabricante = p_cod_fab
        ORDER BY precio;

    -- Variable para almacenar un registro del cursor
    v_producto producto%ROWTYPE;

    -- Variable que almacena el código del fabricante ingresado por el usuario
    v_codigo_fabricante fabricante.codigo%TYPE := &codigo;

BEGIN
    -- 🔹 Abrimos el cursor y pasamos el código del fabricante como parámetro
    OPEN c_productos_fabricante(v_codigo_fabricante);

    DBMS_OUTPUT.PUT_LINE('===== Productos del fabricante ' || v_codigo_fabricante || ' =====');

    -- 🔹 Recorremos el cursor y obtenemos los datos
    LOOP
        FETCH c_productos_fabricante INTO v_producto;
        EXIT WHEN c_productos_fabricante%NOTFOUND; -- Salir si no hay más registros

        -- 📌 Imprimir la información del producto
        DBMS_OUTPUT.PUT_LINE('Código: ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio || '€');
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
    END LOOP;

    -- 🔹 Cerrar el cursor después del uso
    CLOSE c_productos_fabricante;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Error inesperado: ' || SQLERRM);
END;
/
