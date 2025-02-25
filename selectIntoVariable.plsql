/*

Select INTO guardar variables en un select 


*/



SELECT * FROM PRODUCTO;



SET SERVEROUTPUT ON ;

    DECLARE 
            precioAll   INTEGER := 0;
            qtyProducts INTEGER := 0;

            BEGIN

                SELECT  
                    SUM(P.PRECIO),COUNT(*) INTO precioAll, qtyProducts
                        FROM PRODUCTO P;

                DBMS_OUTPUT.PUT_LINE('El precio total de la tabla es: '|| precioAll||' .');
                DBMS_OUTPUT.PUT_LINE('La cantidad total de productos en la tabla es: '|| qtyProducts ||' .');


                END;
                /

