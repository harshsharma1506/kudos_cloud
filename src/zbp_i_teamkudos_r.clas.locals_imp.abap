CLASS lhc_ZI_TeamKudos_R DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_TeamKudos_R RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_TeamKudos_R RESULT result.

    METHODS ApproveKudo FOR MODIFY
      IMPORTING keys FOR ACTION ZI_TeamKudos_R~ApproveKudo RESULT result.

    METHODS validateUser FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZI_TeamKudos_R~validateUser.

ENDCLASS.

CLASS lhc_ZI_TeamKudos_R IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ApproveKudo.
  READ ENTITIES OF ZI_TeamKudos_R IN LOCAL MODE
    ENTITY ZI_TeamKudos_R
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_kudos).

  " 2. Change status to 'A'
  MODIFY ENTITIES OF ZI_TeamKudos_R IN LOCAL MODE
    ENTITY ZI_TeamKudos_R
      UPDATE FIELDS ( Status )
      WITH VALUE #( FOR kudo IN lt_kudos ( %tky = kudo-%tky Status = 'A' ) )
    FAILED failed
    REPORTED reported.

    READ ENTITIES OF ZI_TeamKudos_R IN LOCAL MODE
    ENTITY ZI_TeamKudos_R
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT lt_kudos.

  result = VALUE #( FOR kudo IN lt_kudos ( %tky = kudo-%tky %param = kudo ) ).

  ENDMETHOD.

  METHOD validateUser.
  ENDMETHOD.

ENDCLASS.
