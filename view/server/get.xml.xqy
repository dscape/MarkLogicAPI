xquery version "1.0-ml" ;
import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";

declare variable $args external ;

declare function local:main() { 
  <welcome>
    <product>marklogic</product>
    <version>{$args}</version>
  </welcome> } ;

mvc:sequence-to-map(
  for $f in ('main') return ( $f, xdmp:apply( mvc:function( $f ) ) ) )


