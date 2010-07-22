xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace server = "model:server"
  at "../mdl/server.xqy" ;

declare function local:version() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'version', server:version() )  } ;

declare function local:ping() { mvc:must-revalidate-cache(), () } ;

declare function local:uuids() {
  let $c := mvc:get-field( "count", "1" )
  return (mvc:no-cache(), mvc:render( 'server', 'uuids', server:uuids($c) )) } ;

declare function local:all_dbs() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'all_dbs', server:databases() ) } ;

declare function local:all_forests() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'all_forests', server:forests() ) } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-http-error( $e ) }
