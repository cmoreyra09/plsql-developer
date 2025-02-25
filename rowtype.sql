

/*

¿Qué hace %ROWTYPE en este código?
v_producto producto%ROWTYPE;

Declara una variable (v_producto) que tiene la misma estructura que una fila de la tabla PRODUCTO.
Contiene todas las columnas de PRODUCTO sin necesidad de declararlas individualmente.
SELECT * INTO v_producto FROM producto WHERE codigo = v_codigo;

Recupera una fila completa de la tabla PRODUCTO y la almacena en v_producto.
v_producto ahora contiene todas las columnas de la fila obtenida.
Acceder a los valores:

v_producto.nombre → Accede a la columna nombre.
v_producto.precio → Accede a la columna precio.
v_producto.codigo_fabricante → Accede a la columna codigo_fabricante.


*/



DECLARE
    -- Variable que almacena un solo valor (el código del producto)
    v_codigo producto.codigo%TYPE := &codigo;

    -- Variable que almacena una fila completa de la tabla PRODUCTO
    v_producto producto%ROWTYPE;
BEGIN
    -- Obtener toda la fila de la tabla PRODUCTO donde el código coincida
    SELECT * INTO v_producto
    FROM producto
    WHERE codigo = v_codigo;
    
    -- Mostrar los valores obtenidos
    DBMS_OUTPUT.PUT_LINE('Información del producto con código ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.PUT_LINE('Código fabricante: ' || v_producto.codigo_fabricante);
END;
/
