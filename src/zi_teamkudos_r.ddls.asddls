@ObjectModel.usageType.serviceQuality: #X
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.usageType.dataClass: #MIXED@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view for Kudos'
@UI.headerInfo: { typeName: 'Kudos', typeNamePlural: 'Kudos', title: { value: 'Message' }, description: { value: 'Sender' } }
define root view entity ZI_TeamKudos_R as select from zteam_kudos   
{
  key uuid        as Uuid,
      sender      as Sender,
      receiver    as Receiver,

      @UI.lineItem: [{  position: 10 } ]     
      @UI.selectionField: [ { position: 10 } ]
      sender     as SenderName,

      @UI.lineItem:    [   { position: 20 }]
      @UI.selectionField: [ { position: 20 } ]
      receiver as ReceiverName,

      @UI.lineItem:       [{ position: 30 }]
      @UI.selectionField: [ { position: 30 } ]
      @UI.multiLineText: true
      message     as Message,

      status      as Status,

      @Semantics.systemDateTime.createdAt: true
      created_at  as CreatedAt,

      @Semantics.user.createdBy: true
      created_by  as CreatedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      cast(
        case status
          when 'A' then 3
          else 1
        end as abap.int1
      ) as CriticalityValue
}
