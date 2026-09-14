*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        i_connection_id TYPE /dmo/connection_id
        i_carrier_id    TYPE /dmo/carrier_id
      RAISING
        cx_abap_invalid_value .

    METHODS get_output
      RETURNING
        VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    TYPES:BEGIN OF ST_DETAILS,
       DepartureAirport TYPE /dmo/airport_from_id,
       DestinationAirport   TYPE /dmo/airport_to_id,
       AirlineName    type /dmo/carrier_name.
    TYPES:END OF ST_DETAILS.
    DATA: LS_DETAILS TYPE ST_DETAILS.
ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.

    " ensure non-initial input
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    " check existence and read additional data
*    SELECT SINGLE
*      FROM /dmo/connection
*    FIELDS airport_from_id, airport_to_id
*     WHERE carrier_id    = @i_carrier_id
*       AND connection_id = @i_connection_id
*      INTO ( @airport_from_id, @airport_to_id ).
    SELECT SINGLE
    FROM /dmo/i_connection
    FIELDS DepartureAirport,
     DestinationAirport,
     \_Airline-name
    WHERE AirlineID    = @i_carrier_id
     AND ConnectionID = @i_connection_id
    INTO @ls_details.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->connection_id = i_connection_id.
    me->carrier_id = i_carrier_id.

    conn_counter = conn_counter + 1.

  ENDMETHOD.

  METHOD get_output.

    APPEND |--------------------------------|             TO r_output.
    APPEND |Carrier:     { carrier_id      }|             TO r_output.
    APPEND |Carrier : { ls_details-AirlineName }|               TO r_output.
    APPEND |Connection:  { connection_id   }|             TO r_output.
    APPEND |Departure:   { ls_details-departureairport }|    TO r_output.
    APPEND |Destination: { ls_details-destinationairport }| TO r_output.

  ENDMETHOD.

ENDCLASS.
