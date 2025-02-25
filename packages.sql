/*


📌 Explicación de PACKAGE en PL/SQL
Un PACKAGE en PL/SQL es un contenedor que agrupa procedimientos, funciones, tipos de datos y otras estructuras relacionadas en una sola unidad lógica. Se compone de dos partes:

PACKAGE (Especificación)

Define la interfaz pública del paquete.
Contiene solo las declaraciones de los procedimientos y funciones.
No incluye la implementación del código.


PACKAGE BODY (Cuerpo)

Contiene la implementación de los procedimientos y funciones declarados en el PACKAGE.
No es obligatorio si solo se usa la especificación del PACKAGE (por ejemplo, solo con constantes o tipos de datos).




*/



CREATE OR REPLACE PACKAGE productos AS
    PROCEDURE infoproducto(p_codigo producto.codigo%TYPE);
    FUNCTION obtenerproducto(p_codigo producto.codigo%TYPE) RETURN producto%ROWTYPE;
END;
/


CREATE OR REPLACE PACKAGE BODY productos AS
    PROCEDURE infoProducto(p_codigo producto.codigo%TYPE)
    AS
        v_producto producto%ROWTYPE;
    BEGIN
        SELECT * INTO v_producto FROM producto WHERE codigo = p_codigo;
        
        DBMS_OUTPUT.PUT_LINE('Informacion del producto con codigo ' || p_codigo); 
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre); 
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio); 
        DBMS_OUTPUT.PUT_LINE('Codigo fabricante: ' || v_producto.codigo_fabricante); 
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No existe el producto ' || p_codigo);
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Error'); 
    END;
    
    FUNCTION obtenerProducto(p_codigo producto.codigo%TYPE)
    RETURN producto%ROWTYPE
    AS
        v_producto producto%ROWTYPE;
    BEGIN
        SELECT * INTO v_producto FROM producto WHERE codigo = p_codigo;
        RETURN v_producto;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No existe el producto ' || p_codigo);
            RETURN NULL;
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Error'); 
            RETURN NULL;
    END;
END;
/



BEGIN
    productos.infoProducto(1);
END;
/



DECLARE
    v_producto producto%ROWTYPE;
BEGIN
    v_producto := productos.obtenerProducto(101);

    IF v_producto.codigo IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Información del producto con código ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio || '€');
        DBMS_OUTPUT.PUT_LINE('Código de Fabricante: ' || v_producto.codigo_fabricante);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el producto.');
    END IF;
END;
/
