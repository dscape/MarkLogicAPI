declare function local:main() { 
  <uuids> {
    for $db in $args 
    return <uuid>{$db}</uuid> }</uuids>};

