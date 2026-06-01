@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consupmtions Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_TRAVEL_428DH
  provider contract transactional_query
  as projection on ZI_TRAVEL_428DH
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      Description,
      OverallStatus,
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
