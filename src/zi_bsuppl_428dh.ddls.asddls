@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_BSUPPL_428DH
  as select from zbsuppl_428dh
  association to parent ZI_BOOKING_428DH as _Booking on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to ZI_TRAVEL_428DH as _Travel on $projection.TravelUUID = _Travel.TravelUUID
  association [1..1] to /DMO/I_Supplement as _Product on $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
  association [1..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
  
{
  key booksuppl_uuid        as BooksupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementId,
      currency_code         as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_las_changed_at  as LocalLasChangedAt,
      /** Associatios*/
      _Booking,
      _Travel,
      _Product,
      _Currency,
      _SupplementText
}
