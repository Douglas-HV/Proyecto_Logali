@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consupmtions Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BSUPPL_428DH as projection on ZI_BSUPPL_428DH
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    @ObjectModel.text.element: [ 'SupplementDescription' ]
    SupplementId,
    _SupplementText.Description as SupplementDescription : localized,
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLasChangedAt,
    /* Associations */
    _Booking : redirected to parent ZC_BOOKING_428DH,
    _Currency,
    _Product,
    _SupplementText,
    _Travel : redirected to ZC_TRAVEL_428DH
}
