


/*

Resumen de TRIGGERS
Tipo de TRIGGER	                ¿Cuándo se ejecuta?	                    ¿Se ejecuta por fila o por operación?	Uso común

BEFORE INSERT/UPDATE/DELETE	    Antes de una operación	                Por operación o por fila (FOR EACH ROW)	Validaciones antes de modificar registros

AFTER INSERT/UPDATE/DELETE	    Después de una operación	            Por operación o por fila (FOR EACH ROW)	Auditoría o notificaciones

INSTEAD OF	                    En VISTAS en lugar de una operación	    Por cada fila	Permite modificar VISTAS como si fueran tablas


*/




SET SERVEROUTPUT ON;

-- 🔹 TRIGGER 1: BEFORE Trigger para registrar operaciones en la tabla PRODUCTO
CREATE OR REPLACE TRIGGER estado_operacion_before
BEFORE INSERT OR UPDATE OR DELETE ON producto
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('🔄 Insertando productos...');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('🔄 Actualizando productos...');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('🔄 Borrando productos...');
    END IF;
END;
/

-- 🔹 TRIGGER 2: AFTER Trigger para confirmar operaciones en la tabla PRODUCTO
CREATE OR REPLACE TRIGGER estado_operacion_after
AFTER INSERT OR UPDATE OR DELETE ON producto
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('✅ Producto/s insertados.');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('✅ Producto/s actualizados.');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('✅ Producto/s borrados.');
    END IF;
END;
/

-- 🔹 TRIGGER 3: Validaciones antes de insertar o actualizar un producto (FOR EACH ROW)
CREATE OR REPLACE TRIGGER validacion_producto
BEFORE INSERT OR UPDATE ON producto FOR EACH ROW
DECLARE
    v_num_fabricantes NUMBER(4);
BEGIN
    -- 🔹 Validación de precio positivo
    IF :NEW.precio < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, '⚠️ Error: El precio no puede ser negativo.');
    END IF;

    -- 🔹 Validación de fabricante existente
    SELECT COUNT(*) INTO v_num_fabricantes FROM fabricante WHERE codigo = :NEW.codigo_fabricante;
    
    IF v_num_fabricantes = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, '⚠️ Error: No existe el fabricante especificado.');
    END IF;
END;
/

-- 🔹 TRIGGER 4: Aumenta el precio cuando cambia el fabricante del producto
CREATE OR REPLACE TRIGGER cambio_fabricante
BEFORE UPDATE OF codigo_fabricante ON producto FOR EACH ROW
BEGIN
    IF :NEW.codigo_fabricante <> :OLD.codigo_fabricante THEN
        :NEW.precio := :OLD.precio + 10; -- 🔹 Aumenta el precio en 10€ si cambia el fabricante
    END IF;
END;
/
