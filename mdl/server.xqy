xquery version "1.0-ml";
module namespace server = "model:server";

declare function server:version() { xdmp:version() } ;

declare function server:uuids( $count ) {
  for $c in (1 to xs:integer($count)) 
  return fn:substring( xdmp:md5( fn:concat( fn:string( fn:current-date() ), 
    fn:string($c), fn:string( xdmp:request() ) ) ), 1, 32 ) };

declare function server:databases() {
  for $id in xdmp:databases() return xdmp:database-name( $id ) } ;

declare function server:forests() {
  for $id in xdmp:forests() return xdmp:forest-name( $id ) } ;
