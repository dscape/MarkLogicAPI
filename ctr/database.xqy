xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace db = "model:database"
  at "../mdl/database.xqy" ; 

(: declare function local:get()    { 1 } ; :)
declare function local:put()    {
  let $db := mvc:get-input( 'database' )
  return ( mvc:must-revalidate-cache(),
           if ( db:valid-name( $db ) )
           then if ( db:exists ( $db ) )
                then mvc:render( 'error', 'reason', 
                  ( 412, 'Pre-condicion failed', 'file_exists',
                    'The database could not be created, the file already exists.' ) )
                else try { db:create( $db ), mvc:render( 'database', 'put' ) }
                     catch ( $e ) { 
                       ( mvc:render( 'error', 'reason', 
                           ( 500, 'Internal Server Error', 'db_create_exception',
                           'The database could not be created. Check ErrorLog.txt for more info.')),
                         xdmp:log( xdmp:quote( $e ) ) ) }
           else mvc:render( 'error', 'reason', 
             ( 400, 'Bad Request', 'illegal_database_name',
               'Only lowercase characters (a-z), digits (0-9), and any of the characters _, and - are allowed. Must begin with a letter.' ) ) ) } ;

declare function local:post()   { 1 } ;
declare function local:delete() { 1 } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-error-from-exception( $e ) }
