CLASS zcl_1988_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_1988_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: number1 TYPE i,
          number2 TYPE i,
          result  TYPE p LENGTH 8 DECIMALS 2,
          op      TYPE c LENGTH 1,
          output  TYPE string.

    number1 = -8.
    number2 = 3.
    op = '/'.

    CASE 'op'.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY.
            result = number1 / number2.
          CATCH cx_sy_zerodivide.
            output = |divisor es 0|.
        ENDTRY.
      WHEN OTHERS.
        output = |Operando no permitido { op }|.
    ENDCASE.
    IF output IS INITIAL.
      output = | { number1 } { op } { number2 } = { result } |.
    ENDIF.
    out->write( output ).
  ENDMETHOD.
ENDCLASS.
