@AbapCatalog.sqlViewName: 'zget_full_addr'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'zget_full_address'
define view zget_full_address
  as select from Zadrc_stob as _address
{
// See how information is being fetched using Path expression
  // Root Path : _address > fields
  _address.partner, 
  _address.name,
  _address.addrnumber,

  // Path : _address > _adrc > Fields
  _address._adrc.addr_valid_from,
  _address._adrc.addr_valid_to,

  // Path : address > _adrc > _adr6 > email
  _address._adrc._adr6.smtp_addr

} 
 
