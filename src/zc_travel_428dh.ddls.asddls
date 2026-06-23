@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consupmtions Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_428DH
  provider contract transactional_query
  as projection on ZI_TRAVEL_428DH
{
  key TravelUUID,
      TravelID,
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{
        entity: { name: '/DMO/I_Agency', element: 'AgencyID' } 
       }]
      AgencyID,
      AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ 
            entity: { name: '/DMO/I_Customer', element: 'CustomerID' }
      }]
      CustomerID, 
      CustomerName,
      BeginDate,
      EndDate,
      @Consumption.valueHelpDefinition: [{ 
            entity: { name: 'I_Currency', element: 'Currency' }
      }]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ 
            entity: { name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }
      }]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      OverallStatusCriticality,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agengy,
      _Booking : redirected to composition child ZC_BOOKING_428DH,
      _Currency,
      _Customer,
      _OverallStatus
}
