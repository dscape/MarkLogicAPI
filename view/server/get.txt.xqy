xquery version "1.0-ml" ;
import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";

declare variable $sections external ;
declare variable $args external ;

declare function local:main() {
  mvc:q('{"marklogic":"Welcome","version":"$1"}', ( $args ) ) } ;

mvc:sequence-to-map(
  for $f in ('main') return ( $f, xdmp:apply( mvc:function( $f ) ) ) )

