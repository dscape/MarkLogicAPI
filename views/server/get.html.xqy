xquery version "1.0-ml" ;
import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";

declare variable $args external ;

declare function local:title() { "MarkLogic Server Version Information" } ;
declare function local:main() { $args } ;

mvc:sequence-to-map(
  for $f in ('title', 'main') return ( $f, xdmp:apply( mvc:function( $f ) ) ) )
