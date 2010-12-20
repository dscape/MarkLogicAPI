xquery version "1.0-ml";

import module
  namespace mvc = "http://ns.dscape.org/2010/dxc/mvc"
  at "/lib/dxc/mvc/mvc.xqy";
import module
  namespace db = "model:database"
  at "../mdl/database.xqy" ; 

declare function local:get()    { 
  let $db := mvc:get-input( 'database' )
  return ( mvc:must-revalidate-cache(),
    if ( db:exists ( $db ) )
    then "info"
    else mvc:raise-error( 'Database does not exist.', 404, 'Not Found', 'not_found' ) ) } ;

declare function local:put()    {
  let $db := mvc:get-input( 'database' )
  return ( mvc:must-revalidate-cache(),
           if ( db:valid-name( $db ) )
           then if ( db:exists ( $db ) )
                then mvc:raise-error( 'The database could not be created, the file already exists.',
                  412, 'Pre-condicion failed', 'file_exists' )
                else let $db := try { db:create( $db ) }
                                catch ( $e ) { mvc:raise-error-from-exception( $e, 
  'The database could not be created, an logged exception ocurred.', 'db_create_exc' ) }
                     return if ($db castable as xs:integer) 
                            then mvc:render( 'database', 'put' ) else ()
           else mvc:raise-error( 'Only lowercase characters (a-z), digits (0-9), and any of the characters _, and - are allowed. Must begin with a letter.',
             400, 'Bad Request', 'illegal_database_name') ) } ;

declare function local:post()   { 1 } ;

declare function local:delete() { 
  let $db := mvc:get-input( 'database' )
  return ( mvc:must-revalidate-cache(),
    if ( db:exists ( $db ) )
    then let $db := try { db:delete( $db ) }
                    catch ( $e ) { mvc:raise-error-from-exception( $e, 
'The database could not be deleted, an logged exception ocurred.', 'db_delete_exc' ) }
         return mvc:render( 'database', 'put' )
    else mvc:raise-error( 'Database does not exist.', 404, 'Not Found', 'not_found' ) ) } ;

try          { xdmp:apply( mvc:function() ) } 
catch ( $e ) { mvc:raise-error-from-exception( $e ) }
