@AbapCatalog.sqlViewName: 'Zadr6_view'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Partner Address'
define view Zadr6_stob
  as select from but020 as b20
  association [1..1] to adr6 as _adr6 on  b20.addrnumber   = _adr6.addrnumber
                                      and _adr6.flgdefault = 'X'
{

  key b20.partner                  as partner,    // Business partner
  key b20.addrnumber               as addrnumber, // Address #
      b20.addr_valid_from,
      b20.addr_valid_to,
      _adr6

}
where
  (
        b20.addr_valid_from <= tstmp_current_utctimestamp() // Address should be valid on current date
    and b20.addr_valid_to   >= tstmp_current_utctimestamp()
  ) 
