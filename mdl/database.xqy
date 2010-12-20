xquery version "1.0-ml";

module namespace db = "model:database";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module 
  namespace info="http://marklogic.com/appservices/infostudio" 
  at "/MarkLogic/appservices/infostudio/info.xqy";


declare function db:list() {
  xdmp:database-name( xdmp:databases() ) } ;

declare function db:exists ( $name ){
  db:list() [ . = $name ] } ;

declare function db:valid-name( $name ) { 
  fn:matches( $name, '^[a-z]([a-z]|[0-9]|_|-)*$' ) } ;

declare function db:create( $name ) { info:database-create( $name ) } ;
declare function db:delete( $name ) { info:database-delete( $name ) } ;
