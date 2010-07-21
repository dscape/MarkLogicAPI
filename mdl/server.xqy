xquery version "1.0-ml";
module namespace server = "model:server";

declare function server:version() { xdmp:version() } ;

declare function server:uuid() {
  fn:substring( xdmp:md5( fn:concat(
    fn:string( fn:current-date() ), fn:string( xdmp:request() ) ) ), 1, 16 ) };

declare function server:databases() {
  for $id in xdmp:databases() return xdmp:database-name( $id ) } ;
