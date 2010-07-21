xquery version "1.0-ml";

declare namespace s = "http://www.w3.org/2009/xpath-functions/analyze-string" ;

import module 
  namespace r = "http://ns.dscape.org/2010/dxc/mvc/routes" 
  at "/lib/dxc/mvc/routes.xqy" ;
import module
  namespace u = "http://ns.dscape.org/2010/dxc/ext/util"
  at "/lib/dxc/ext/util.xqy" ;

declare variable $routes-cfg := u:document-get("cfg/routes.xml") ;
r:selected-route( $routes-cfg )

