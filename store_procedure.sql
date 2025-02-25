/*


Este procedimiento almacenado (infoProducto) se encarga de buscar un producto en la tabla producto 
utilizando un código ingresado como parámetro (p_codigo). 
Luego, muestra la información del producto o un mensaje de error si el 
producto no existe o si ocurre un error inesperado.


*/



CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%TYPE)
AS
    v_producto producto%ROWTYPE;
    v_existe NUMBER;
BEGIN
    -- Verificar si el producto existe antes de hacer el SELECT
    SELECT COUNT(*) INTO v_existe FROM producto WHERE codigo = p_codigo;

    IF v_existe = 0 THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error: No existe un producto con el código ' || p_codigo);
        RETURN; -- Sale del procedimiento si el producto no existe
    END IF;

    -- Obtener los datos del producto
    SELECT * INTO v_producto
    FROM producto
    WHERE codigo = p_codigo;

    -- Mostrar la información del producto
    DBMS_OUTPUT.PUT_LINE('=================================');
    DBMS_OUTPUT.PUT_LINE('✅ Información del Producto');
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('Código: ' || v_producto.codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio || '€');
    DBMS_OUTPUT.PUT_LINE('Código de Fabricante: ' || v_producto.codigo_fabricante);
    DBMS_OUTPUT.PUT_LINE('=================================');

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, '⚠️ Error inesperado: ' || SQLERRM);
END;
/



EXEC infoProducto(2)