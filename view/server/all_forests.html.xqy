declare function local:title() { 'MarkLogic Server - Forest Listing' } ; 
declare function local:main() { 
  for $a in $args return <p xmlns="http://www.w3.org/1999/xhtml">{$a}</p> } ;

