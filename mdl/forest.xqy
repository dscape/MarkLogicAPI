xquery version "1.0-ml";

module namespace fr = "model:forest";


import module
  namespace x = "http://ns.dscape.org/2010/dxc/xml"
  at "/lib/dxc/xml/xml.xqy";

declare variable $assignments := x:strip-namespaces( xdmp:read-cluster-config-file("assignments.xml")/* );
declare variable $hosts       := x:strip-namespaces( xdmp:read-cluster-config-file("hosts.xml")/* );

declare function fr:list() {
  xdmp:forest-name( xdmp:forests() ) } ;

declare function fr:exists ( $forest ){
  fr:list() [ . = $forest ] } ;

declare function fr:valid-name( $forest ) { 
  fn:matches( $forest, '^[a-z]([a-z]|[0-9]|_|-)*$' ) } ;

declare function fr:host( $forest ) {
  $hosts /host
      [ host-id = 
        $assignments /assignment [forest-name=$forest] /host ]
      /host-name/fn:string() } ; 

declare function fr:status( $forest ) {
  let $id     := xdmp:forest($forest)
  let $status := x:strip-namespaces(<forest> { xdmp:forest-status($id), xdmp:forest-counts($id, ("*")) } </forest>)
  return $status
};