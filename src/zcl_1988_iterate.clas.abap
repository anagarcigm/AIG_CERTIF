CLASS zcl_1988_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_1988_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    CONSTANTS max_count TYPE i VALUE '20'.
    TYPES:tt_number TYPE TABLE OF i.
    DATA: numbers TYPE tt_number.
    DATA: output TYPE string_table.


    DO max_count TIMES.
      IF sy-index = 1.
        APPEND 0 TO numbers.
      ELSEIF sy-index = 2.
        APPEND 1 TO numbers.
      ELSE.
        APPEND numbers[ sy-index - 1 ] +
          numbers[ sy-index - 2 ] TO numbers.
      ENDIF.
    ENDDO.
    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).
      counter = counter + 1.
      APPEND | Counter { counter widTH = 4 } es { number width = 10 ALIGN = right } |
       TO output.
    ENDLOOP.
    out->write( data = output name = | Los primeros { max_count } numeros de fibonacci | ).
  ENDMETHOD.
ENDCLASS.
