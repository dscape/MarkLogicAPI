xquery version "1.0-ml";

module namespace db = "model:database";

import module
  namespace json = "http://ns.dscape.org/2010/dxc/json"
  at "/lib/dxc/json/json.xqy";
import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module 
  namespace info="http://marklogic.com/appservices/infostudio" 
  at "/MarkLogic/appservices/infostudio/info.xqy";

declare namespace adm = "http://marklogic.com/xdmp/database" ;

declare variable $databases := xdmp:read-cluster-config-file("databases.xml");

declare function db:list() {
  xdmp:database-name( xdmp:databases() ) } ;

declare function db:exists ( $database ){
  db:list() [ . = $database ] } ;

declare function db:valid-name( $database ) { 
  fn:matches( $database, '^[a-z]([a-z]|[0-9]|_|-)*$' ) } ;

declare function db:forests ( $database ){
  'not yet' };

declare function db:create( $database ) { info:database-create( $database ) } ;
declare function db:delete( $database ) { info:database-delete( $database ) } ;
declare function db:status( $database ) { 
  let $db := $databases /adm:databases/adm:database [adm:database-name = $database]
  return ( $db, json:serialize($db) ) } ;

