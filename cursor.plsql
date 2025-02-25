/*


📌 Explicación Mejorada de Cursores en PL/SQL
En PL/SQL, los cursores permiten recorrer un conjunto de registros devueltos por una consulta fila por fila. Se utilizan en bucles para procesar los datos de manera estructurada.

📌 Tipos de cursores en el código
Este código usa dos tipos de cursores:

Cursor explícito (c_productos)

Se abre, recorre y cierra manualmente usando OPEN, FETCH y CLOSE.
Se almacena cada fila en v_producto, que es de tipo %ROWTYPE.
Cursor implícito (c_productos_fabricante)

Se usa en un bucle FOR, lo que hace que PL/SQL maneje automáticamente OPEN, FETCH y CLOSE.
Recupera información de dos tablas (producto y fabricante).


*/



SET SERVEROUTPUT ON;

DECLARE
    -- 🔹 Cursor que obtiene todos los productos ordenados por precio
    CURSOR c_productos IS
        SELECT * FROM producto ORDER BY precio;
    
    -- Variable para almacenar una fila del cursor c_productos
    v_producto producto%ROWTYPE;

    -- 🔹 Cursor que obtiene productos con el nombre del fabricante
    CURSOR c_productos_fabricante IS
        SELECT 
            p.codigo,
            p.nombre,
            p.precio,
            f.nombre AS nombre_fabricante
        FROM producto p
        JOIN fabricante f ON p.codigo_fabricante = f.codigo
        ORDER BY p.precio;

BEGIN
    -- 🔹 Procesar el cursor explícito
    DBMS_OUTPUT.PUT_LINE('===== Cursor c_productos =====');
    
    -- Abrimos el cursor manualmente
    OPEN c_productos;
    
    LOOP
        -- Extraemos una fila y la guardamos en v_producto
        FETCH c_productos INTO v_producto;
        
        -- Salimos cuando no haya más registros
        EXIT WHEN c_productos%NOTFOUND;
        
        -- 📌 Mostrar información del producto
        DBMS_OUTPUT.PUT_LINE('Código: ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio || '€');
        DBMS_OUTPUT.PUT_LINE('Código de Fabricante: ' || v_producto.codigo_fabricante);
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
        
    END LOOP;

    -- Cerramos el cursor manualmente
    CLOSE c_productos;
    
    -- 🔹 Procesar el cursor implícito (no requiere OPEN ni CLOSE)
    DBMS_OUTPUT.PUT_LINE('===== Cursor c_productos_fabricante =====');
    
    FOR registro IN c_productos_fabricante LOOP
        -- 📌 Mostrar información del producto con su fabricante
        DBMS_OUTPUT.PUT_LINE('Código: ' || registro.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registro.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || registro.precio || '€');
        DBMS_OUTPUT.PUT_LINE('Fabricante: ' || registro.nombre_fabricante);
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
    END LOOP;

END;
/


