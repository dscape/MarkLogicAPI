declare function local:main() { 
  <forests> {
    for $db in $args 
    return <forest id="{xdmp:forest($db)}">{$db}</forest> }</forests>};

