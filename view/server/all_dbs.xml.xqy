declare function local:main() { 
  <databases> {
    for $db in $args 
    return <database id="{xdmp:database($db)}">{$db}</database> }</databases>};

