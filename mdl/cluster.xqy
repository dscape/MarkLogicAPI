xquery version "1.0-ml";
module namespace cluster = "model:cluster";

import module
  namespace json = "http://ns.dscape.org/2010/dxc/json"
  at "/lib/dxc/json/json.xqy";

declare function cluster:read-config-file( $filename ) {
  let $file := xdmp:read-cluster-config-file(fn:concat($filename,".xml")) 
  return ($file, json:serialize($file/*)) };