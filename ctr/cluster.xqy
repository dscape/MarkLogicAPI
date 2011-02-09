xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace cluster = "model:cluster"
  at "../mdl/cluster.xqy" ;

declare function local:assignments() { mvc:must-revalidate-cache(),
  mvc:render( 'shared', 'raw', cluster:read-config-file( 'assignments' ) )  } ;
declare function local:databases() {  mvc:must-revalidate-cache(),
  mvc:render( 'shared', 'raw', cluster:read-config-file( 'databases' ) )  } ;
declare function local:groups() {  mvc:must-revalidate-cache(),
  mvc:render( 'shared', 'raw', cluster:read-config-file( 'groups' ) )  } ;
declare function local:hosts() {  mvc:must-revalidate-cache(),
  mvc:render( 'shared', 'raw', cluster:read-config-file( 'hosts' ) )  } ;
declare function local:server() {  mvc:must-revalidate-cache(),
  mvc:render( 'shared', 'raw', cluster:read-config-file( 'server' ) )  } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-error-from-exception( $e ) }
