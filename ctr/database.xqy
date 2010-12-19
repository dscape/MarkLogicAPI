xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace db = "model:database"
  at "../mdl/database.xqy" ; 

(: "illegal_database_name"
   "Only lowercase characters (a-z), digits (0-9), and any of the characters _, $, (, ), +, -, and / are allowed. Must begin with a letter."
:)

declare function local:get()    { 1 } ;
declare function local:put()    {
  let $db := mvc:get-input( 'database' )
  return ( mvc:must-revalidate-cache(),
           if ( db:valid-name( $db ) )
           then if ( db:exists ( $db ) )
                then mvc:render( 'error', 'reason', 
                  ( 412, 'Pre-condicion failed', 'file_exists',
                    'The database could not be created, the file already exists.' ) )
                else 'lets create this thing'
           else mvc:render( 'error', 'reason', 
             ( 400, 'Bad Request', 'illegal_database_name',
               'Only lowercase characters (a-z), digits (0-9), and any of the characters _, and - are allowed. Must begin with a letter.' ) ) ) } ;

declare function local:post()   { 1 } ;
declare function local:delete() { 1 } ;

try          { let $_ := xdmp:log( mvc:function() ) return
  xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-http-error( $e ) }
