xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
(: import module
  namespace server = "model:database"
  at "../mdl/database.xqy" ; :)

declare function local:get()    { 1 } ;
declare function local:put()    { 1 } ;
declare function local:post()   { 1 } ;
declare function local:delete() { 1 } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-http-error( $e ) }
