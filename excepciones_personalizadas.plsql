/*

Mejoras y optimización
Mensajes más claros y bien organizados ✅

Se agrega === Información del Producto === para claridad.
Se muestra el precio con € para contexto.
Manejo mejorado de la excepción limite_precio ✅

Ahora muestra el precio exacto en el mensaje de error.
Uso de SQLERRM en WHEN OTHERS ✅

Se muestra el mensaje real del error para facilitar depuración.
Estructura más limpia y profesional ✅

Mejor indentación y comentarios.




*/



SET SERVEROUTPUT ON;

DECLARE
    -- Variables con el tipo de la tabla
    v_codigo producto.codigo%TYPE := &codigo;
    v_producto producto%ROWTYPE;
    
    -- Excepción personalizada
    limite_precio EXCEPTION;

BEGIN
    -- Intentar obtener los datos del producto
    SELECT * INTO v_producto
    FROM producto
    WHERE codigo = v_codigo;

    -- Verificar si el precio supera el límite
    IF v_producto.precio >= 100 THEN
        RAISE limite_precio; -- Disparar la excepción si el precio es mayor o igual a 100
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
    
    -- Capturar si el precio excede el límite
    WHEN limite_precio THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Advertencia: El producto tiene un precio de ' || v_producto.precio || '€, que excede el límite permitido.');
    
    -- Capturar cualquier otro error inesperado
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Error inesperado: ' || SQLERRM);
END;
/
