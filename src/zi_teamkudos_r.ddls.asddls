@ObjectModel.usageType.serviceQuality: #X
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.usageType.dataClass: #MIXED@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view for Kudos'
@UI.headerInfo: { typeName: 'Kudos', typeNamePlural: 'Kudos', title: { value: 'Message' }, description: { value: 'Sender' } }
define root view entity ZI_TeamKudos_R as select from zteam_kudos   
{
  
   @UI.facet: [ { id:              'KudosHeader',
                 type:            #IDENTIFICATION_REFERENCE,
                 label:           'Kudos Information',
                 position:        10 } ]
                 
  @EndUserText.label: 'UUID'
  key uuid        as Uuid,

  @EndUserText.label: 'Sender (Technical)'
  sender      as Sender,

  @EndUserText.label: 'Receiver (Technical)'
  receiver    as Receiver,

  @EndUserText.label: 'Sender'
  @UI: { lineItem:       [ { position: 10 } ],
          selectionField: [ { position: 10 } ],
          identification: [ { position: 10 } ] }
  sender     as SenderName,

  @EndUserText.label: 'Receiver'
  @UI: { lineItem:       [ { position: 20 } ],
          selectionField: [ { position: 20 } ],
          identification: [ { position: 20 } ] }
  receiver as ReceiverName,

  @EndUserText.label: 'Message'
  @UI: { lineItem:       [ { position: 30 } ],
          selectionField: [ { position: 30 } ],
          identification: [ { position: 30 } ] }
  @UI.multiLineText: true
  message     as Message,

  @EndUserText.label: 'Status'
  status      as Status,

  @EndUserText.label: 'Created At'
  @Semantics.systemDateTime.createdAt: true
  created_at  as CreatedAt,

  @EndUserText.label: 'Created By'
  @Semantics.user.createdBy: true
  created_by  as CreatedBy,

  @EndUserText.label: 'Last Changed At'
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,

  @EndUserText.label: 'Criticality'
  cast(
    case status
      when 'A' then 3
      else 1
    end as abap.int1
  ) as CriticalityValue
}
