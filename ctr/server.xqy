xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace server = "model:server"
  at "../mdl/server.xqy" ;
import module
  namespace db = "model:database"
  at "../mdl/database.xqy" ;
import module
  namespace fr = "model:forest"
  at "../mdl/forest.xqy" ;

declare function local:version() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'version', server:version() )  } ;

declare function local:ping() { mvc:must-revalidate-cache(), () } ;

declare function local:uuids() {
  let $c := mvc:get-field( "count", "1" )
  return (mvc:no-cache(), mvc:render( 'server', 'uuids', server:uuids($c) )) } ;

declare function local:all_dbs() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'all_dbs', db:list() ) } ;

declare function local:all_forests() {
  mvc:must-revalidate-cache(),
  mvc:render( 'server', 'all_forests', fr:list() ) } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-error-from-exception( $e ) }
