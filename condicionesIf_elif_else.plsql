/*

    Definir una aplicacion que identifique si es mayor de edad o menor de edad  -- Condicionales IF ELSIF 


*/



SET SERVEROUTPUT ON ;

    DECLARE 

            inputUser INTEGER := 15;
            userOld   INTEGER := 18;


            BEGIN


                IF inputUser > userOld AND inputUser = userOld  
                    
                    THEN
                        DBMS_OUTPUT.PUT_LINE('El usuario es mayor de edad '|| inputUser ||' .');
                
                ELSIF inputUser  <= userOld 
                    
                    THEN
                        DBMS_OUTPUT.PUT_LINE('El usuario es menor de edad '|| inputUser||' .');

                ELSE
                    DBMS_OUTPUT.PUT_LINE('Opcion invalida.');
                END IF;

                END;
                /



SET SERVEROUTPUT ON;

ACCEPT inputUser NUMBER PROMPT 'Ingrese su edad: ';

DECLARE
    inputUser INTEGER := &inputUser;
    userOld   INTEGER := 18;
BEGIN
    IF inputUser >= userOld THEN
        DBMS_OUTPUT.PUT_LINE('El usuario es mayor de edad (' || inputUser || ' años).');
    
    ELSIF inputUser > 0 AND inputUser < userOld THEN
        DBMS_OUTPUT.PUT_LINE('El usuario es menor de edad (' || inputUser || ' años).');
    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: La edad ingresada no es válida.');
    END IF;

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Ingrese un número válido.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/




/*  Explicación de mejoras


    Entrada dinámica con ACCEPT → Permite al usuario ingresar la edad en SQL*Plus o SQLcl.
    Condiciones más claras: >= 18 → Mayor de edad. 
    > 0 AND < 18 → Menor de edad.
    ELSE → Captura valores inválidos (como negativos o no numéricos).

    Manejo de errores con EXCEPTION:
    VALUE_ERROR → Si el usuario ingresa un valor no numérico.
    OTHERS → Cubre cualquier otro error inesperado.
    
*/