@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TRAVEL_428DH
  as select from ztravel_428dh
  composition [0..*] of ZI_BOOKING_428DH as _Booking
  association [0..1] to /DMO/I_Agency as _Agengy on $projection.AgencyID = _Agengy.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
{
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      _Agengy.Name          as AgencyName,
      customer_id           as CustomerID,
      concat_with_space(_Customer.FirstName, _Customer.LastName, 1) as CustomerName,
      begin_date            as BeginDate,
      end_date              as EndDate,
      currency_code         as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      description           as Description,
      overall_status        as OverallStatus,
      case overall_status
        when 'O' then 5     //Information ==> Azul
        when 'A' then 3     //Positive    ==> Verde
        when 'X' then 1     //Negativo    ==> Rojo
        else 0              //Neutral     ==> Gris
      end                   as OverallStatusCriticality,
      @Semantics.user.createdBy: true
      local_create_by       as LocalCreateBy,
      @Semantics.systemDateTime.createdAt: true
      local_create_at       as LocalCreateAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      /** Associations*/
      _Booking,
      _Agengy,
      _Customer,
      _Currency,
      _OverallStatus
}
