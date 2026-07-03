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
  data: number1 type i,
        number2 type i,
        result type p length 8 decimals 2.

        number1 = -8.
        number2 = 3.

        result = number1 / number2.

        data(output) = | { number1 } / { number2 } = { result } |.
        out->write( output ).
  ENDMETHOD.
ENDCLASS.
