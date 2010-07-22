xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace server = "model:server"
  at "../mdl/server.xqy" ;

declare function local:version() {
  xdmp:add-response-header('Cache-Control', 'must-revalidate'),
  mvc:render( 'server', 'version', server:version() )  } ;

declare function local:ping() {
  xdmp:add-response-header('Cache-Control', 'must-revalidate'), () } ;

declare function local:uuids() {
  xdmp:add-response-header('Cache-Control', 'must-revalidate, no-cache'), 
  server:uuid()};

declare function local:all_dbs() {
  xdmp:add-response-header('Cache-Control', 'must-revalidate'),
  mvc:render( 'server', 'all_dbs', server:databases() ) } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-404( $e ) }
