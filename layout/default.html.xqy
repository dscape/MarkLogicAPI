xquery version "1.0-ml" ;
declare variable $sections external ;

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>{ map:get( $sections, 'title' ) }</title>
  </head>
  <body>
    { map:get( $sections, 'main' ) }
  </body>
</html> 

