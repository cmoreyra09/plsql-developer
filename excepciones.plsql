/*

Mejoras y explicación rápida

Formato mejorado en la salida → Mensajes más claros y mejor organizados.
Manejo de errores mejorado:

NO_DATA_FOUND               → Si el código no existe en la tabla.
OTHERS                      → Captura cualquier otro error y muestra el mensaje real con SQLERRM.
Uso de SET SERVEROUTPUT ON; → Asegura que los mensajes se impriman en la consola.

Este código ahora es más robusto, manejable y con mejor presentación. 

*/




SET SERVEROUTPUT ON;

DECLARE
    -- Variables con el tipo de la tabla
    v_codigo producto.codigo%TYPE := &codigo; -- TYPE SOLO PARA COLUMNAS
    v_producto producto%ROWTYPE; -- ROWTYPE SOLO PARA TABLAS
BEGIN
    -- Intentar obtener los datos del producto
    SELECT * INTO v_producto
    FROM producto
    WHERE codigo = v_codigo;

    -- Mostrar la información del producto
    DBMS_OUTPUT.PUT_LINE('=== Información del Producto ===');
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.PUT_LINE('Código de Fabricante: ' || v_producto.codigo_fabricante);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error: No existe un producto con el código ' || v_codigo);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Error inesperado: ' || SQLERRM);
END;
/
