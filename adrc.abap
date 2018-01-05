@AbapCatalog.sqlViewName: 'Zadrc_view'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Partner Address'
define view Zadrc_stob
  //  with parameters
  //    i_partner :bu_partner
  as select from adrc //Zadr6_stob as b20
  //    left outer join adr6   as a6 on  b20.addrnumber = a6.addrnumber
  //                                 and a6.flgdefault  = 'X'
  association [1..1] to Zadr6_stob as _adrc on $projection.addrnumber = _adrc.addrnumber
{

  key _adrc.partner                  as partner, // Business partner
  key adrc.addrnumber                as addrnumber, // Address #
      adrc.name1                     as name, // Name
      _adrc

} 
