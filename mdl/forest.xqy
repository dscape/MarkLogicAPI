xquery version "1.0-ml";

module namespace fr = "model:forest";

declare namespace h = "http://marklogic.com/xdmp/hosts" ;
declare namespace a = "http://marklogic.com/xdmp/assignments" ;

declare variable $assignments := xdmp:read-cluster-config-file("assignments.xml") ;
declare variable $hosts       := xdmp:read-cluster-config-file("hosts.xml") ;

declare function fr:list() {
  xdmp:forest-name( xdmp:forests() ) } ;

declare function fr:exists ( $forest ){
  fr:list() [ . = $forest ] } ;

declare function fr:valid-name( $forest ) { 
  fn:matches( $forest, '^[a-z]([a-z]|[0-9]|_|-)*$' ) } ;

declare function fr:host( $forest ) {
  $hosts /h:hosts /h:host
      [ h:host-id = 
        $assignments /a:assignments/a:assignment [a:forest-name=$forest] /a:host ]
      /h:host-name/fn:string() } ; 

declare function fr:status( $forest ) {
  xdmp:forest-status(
    $assignments /a:assignments/a:assignment [a:forest-name=$forest] /a:forest-id ) };