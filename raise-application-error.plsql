SET SERVEROUTPUT ON;

DECLARE
    -- Variables con el tipo de la tabla
    v_codigo producto.codigo%TYPE := &codigo;
    v_producto producto%ROWTYPE;

    -- Excepción personalizada
    limite_precio EXCEPTION;
    
    -- Asignar un código de error a la excepción personalizada
    PRAGMA EXCEPTION_INIT(limite_precio, -20001);

BEGIN
    -- Intentar obtener los datos del producto
    SELECT * INTO v_producto
    FROM producto
    WHERE codigo = v_codigo;

    -- Verificar si el precio supera el límite
    IF v_producto.precio >= 100 THEN
        RAISE_APPLICATION_ERROR(-20001, '❌ Error: El producto con código ' || v_codigo || ' tiene un precio de ' || v_producto.precio || '€, que supera el límite permitido.');
    END IF;

    -- Mostrar la información del producto si no hay errores
    DBMS_OUTPUT.PUT_LINE('=== Información del Producto ===');
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio || '€');
    DBMS_OUTPUT.PUT_LINE('Código de Fabricante: ' || v_producto.codigo_fabricante);

EXCEPTION
    -- Capturar si el producto no existe
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error: No existe un producto con el código ' || v_codigo);
    
    -- Capturar la excepción personalizada con `RAISE_APPLICATION_ERROR`
    WHEN limite_precio THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Muestra el mensaje de error personalizado
    
    -- Capturar cualquier otro error inesperado
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Error inesperado: ' || SQLERRM);
END;
/
