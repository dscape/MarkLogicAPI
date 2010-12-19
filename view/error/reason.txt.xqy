declare function local:main() { 
  let $code := if ($args[1] castable as xs:integer) then xs:integer($args[1]) else 501,
      $msg  := $args[2],
      $err  := $args[3],
      $expl := $args[4]
  return (
    xdmp:set-response-code($code, $msg ),
    mvc:q( '{"error":"$1","reason":"$2"}', ( $err, $expl ) ) ) } ;
