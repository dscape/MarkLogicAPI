declare function local:main() {
  mvc:q('{"uuids":$1}', 
  ( if (fn:count($args)=1)
    then mvc:q('["$1"]', ($args))
    else xdmp:to-json($args) ) ) } ;

