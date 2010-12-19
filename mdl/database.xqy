xquery version "1.0-ml";

module namespace db = "model:database";

declare function db:list() {
  xdmp:database-name( xdmp:databases() ) } ;

declare function db:exists ( $name ){
  db:list() [ . = $name ] } ;

declare function db:valid-name( $name ) { 
  fn:matches( $name, '^[a-z]([a-z]|[0-9]|_|-)*$' ) } ;

declare function db:create( $name ) { 
  let $prolog := 'xquery version "1.0-ml";
    import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";
    let $config := admin:get-configuration()',
      $final  := 'return admin:save-configuration($config); '
  return xdmp:eval(
    mvc:q( '$1 
      let $config := admin:forest-create(
      $config, 
      "$3-01",
      xdmp:host(), 
      ()) 
      $2 $1
      let $config := admin:database-create(
      $config,
      "$3",
      xdmp:database("Security"),
      xdmp:database("Schemas"))
      $2 $1
      let $config := admin:database-attach-forest(
      $config,
      xdmp:database("$3"), 
      xdmp:forest("$3-01")) $2', ($prolog, $final, $name ) ) ) } ;
