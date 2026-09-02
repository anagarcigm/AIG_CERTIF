CLASS zcl_1988_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_1988_LOCAL_CLASS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: connection TYPE REF TO lcl_connection.
    DATA: connections TYPE TABLE OF REF TO lcl_connection.
    TRY.
        connection = NEW #( i_carrier_id = 'LH'
                                        i_connection_id = '0400' ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.
*    connection->carrier_id = 'LH'.
*    connection->connection_id = '0400'.
    TRY.
        connection = NEW #( i_carrier_id    = 'AA'
              i_connection_id = '0017' ).

*        connection->set_attributes(
*          i_carrier_id    = 'AA'
*          i_connection_id = '0017'
*        ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.
*    connection->carrier_id = 'AA'.
*    connection->connection_id = '0017'.


    TRY.
        connection = NEW #(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001'
        ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.
*    connection->carrier_id = 'SQ'.
*    connection->connection_id = '0001'.

    LOOP AT connections INTO connection.
      out->write( data = connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
