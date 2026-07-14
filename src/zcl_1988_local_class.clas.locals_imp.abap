*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter  TYPE i READ-ONLY.


*    methods set_attributes importing i_carrier_id TYPE /dmo/carrier_id
*                                     i_connection_id type /dmo/connection_id
*                                     raising CX_ABAP_INVALID_VALUE.
    METHODS constructor
      IMPORTING
                i_carrier_id    TYPE /dmo/carrier_id
                i_connection_id TYPE /dmo/connection_id
      RAISING   cx_abap_invalid_value.
    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.
PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: carrier_id    TYPE /dmo/carrier_id,
          connection_id TYPE /dmo/connection_id.

endclass.

class lcl_connection implementation.

  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    lcl_connection=>conn_counter = lcl_connection=>conn_counter + 1.
  ENDMETHOD.

  METHOD get_output.

    APPEND |carrier id = { carrier_id }| TO r_output.
    APPEND |connection id = { connection_id }| TO r_output.

  ENDMETHOD.


endclass.
