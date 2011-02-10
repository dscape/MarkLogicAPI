
declare function local:main() { 
  mvc:q(
'{ "db_name": "$1",
  "doc_count": 0,
  "doc_del_count": 0,
  "update_seq": 0,
  "purge_seq": 0,
  "compact_running": false,
  "disk_size":79,
  "instance_start_time":"1294978007496463",
  "disk_format_version":5,
  "committed_update_seq":0, 
  "marklogic_specific": $2 }', ($args[1]//database-name, $args[2])) } ;
