/*


Definir las operaciones aritmeticas :

Crear un algoritmo que permita utilizarce las operaciones aritemticas



*/



SET SERVEROUTPUT ON;

ACCEPT qty NUMBER PROMPT 'Ingrese un número: ';

DECLARE 
    num NUMBER := &qty;

    suma            NUMBER := num + num;
    resta           NUMBER := num - num;
    multiplicacion  NUMBER := num * num;
    division        NUMBER := num / num;
    potencia        NUMBER := POWER(num, num);
    modulo          NUMBER := MOD(num, 3);
    raiz_cuadrada   NUMBER := SQRT(num);
    absoluto        NUMBER := ABS(num);
    log_natural     NUMBER := LN(num);
    log_base_10     NUMBER := LOG(10, num);
    truncado        NUMBER := TRUNC(num, 2);
    redondeo        NUMBER := ROUND(num, 2);
    signo           NUMBER := SIGN(num);
    aleatorio       NUMBER := DBMS_RANDOM.VALUE(1, 100);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Suma: ' || suma);
    DBMS_OUTPUT.PUT_LINE('Resta: ' || resta);
    DBMS_OUTPUT.PUT_LINE('Multiplicación: ' || multiplicacion);
    DBMS_OUTPUT.PUT_LINE('División: ' || division);
    DBMS_OUTPUT.PUT_LINE('Potencia: ' || potencia);
    DBMS_OUTPUT.PUT_LINE('Módulo (num % 3): ' || modulo);
    DBMS_OUTPUT.PUT_LINE('Raíz cuadrada: ' || raiz_cuadrada);
    DBMS_OUTPUT.PUT_LINE('Valor absoluto: ' || absoluto);
    DBMS_OUTPUT.PUT_LINE('Logaritmo natural: ' || log_natural);
    DBMS_OUTPUT.PUT_LINE('Logaritmo base 10: ' || log_base_10);
    DBMS_OUTPUT.PUT_LINE('Número truncado a 2 decimales: ' || truncado);
    DBMS_OUTPUT.PUT_LINE('Número redondeado a 2 decimales: ' || redondeo);
    DBMS_OUTPUT.PUT_LINE('Signo del número: ' || signo);
    DBMS_OUTPUT.PUT_LINE('Número aleatorio entre 1 y 100: ' || aleatorio);
END;
/
