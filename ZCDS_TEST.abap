*&---------------------------------------------------------------------*
*& Report ZCDS_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcds_test.

SELECT * FROM zget_full_address
INTO TABLE @DATA(lt_data)
    WHERE partner = '0010100001'.
IF sy-subrc IS INITIAL.
  cl_demo_output=>display( lt_data ).
ENDIF.
