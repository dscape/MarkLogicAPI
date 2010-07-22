# something like a todo list.
# if its broken please fix me later :)
clear
echo "curl localhost:port [:port => 6984,5984]"
echo "----------------------------------------"
curl localhost:6984
echo
curl localhost:5984
read && clear
echo "curl -vX GET localhost:port [:port => 6984,5984]"
echo "------------------------------------------------"
curl -vX GET localhost:6984
echo
curl -vX GET localhost:5984
read && clear
echo "curl -vX HEAD localhost:port [:port => 6984,5984]"
echo "-------------------------------------------------"
curl -vX HEAD localhost:6984
read && clear
echo "curl -vX GET localhost:port/ [:port => 6984,5984]"
echo "-------------------------------------------------"
curl -vX GET localhost:6984/
echo
curl -vX GET localhost:5984/
read && clear
echo "curl -vX HEAD localhost:port/ [:port => 6984,5984]"
echo "--------------------------------------------------"
curl -vX HEAD localhost:6984/
read && clear 
echo "curl -vX GET localhost:port/_all_dbs [:port => 6984,5984]"
echo "----------------------------------------------------------"
curl -vX GET localhost:6984/_all_dbs
echo
curl -vX GET localhost:5984/_all_dbs
read && clear 
echo "curl -vX GET localhost:port/_uuids [:port => 6984,5984]"
echo "----------------------------------------------------------"
curl -vX GET localhost:6984/_uuids
echo
curl -vX GET localhost:5984/_uuids
read && clear 
echo "curl -vX GET localhost:port/_uuids/ [:port => 6984,5984]"
echo "-----------------------------------------------------------"
curl -vX GET localhost:6984/_uuids/
echo
curl -vX GET localhost:5984/_uuids/
read && clear
echo 'curl -H "Accept: :type" -vX GET localhost:6984 [:type => text/plain, text/html, application/xml]'
echo "------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" -vX GET localhost:6984
echo
curl -H "Accept: text/html" -vX GET localhost:6984
echo
curl -H "Accept: application/xml" -vX GET localhost:6984
read && clear 
echo 'curl -H "Accept: :type" -vX GET localhost:6984/_all_dbs [:type => text/plain, text/html, application/xml]'
echo "-------------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" -vX GET localhost:6984/_all_dbs
echo
curl -H "Accept: text/html" -vX GET localhost:6984/_all_dbs
echo
curl -H "Accept: application/xml" -vX GET localhost:6984/_all_dbs
read && clear 
echo 'curl -H "Accept: :type" -vX GET localhost:6984/_uuids [:type => text/plain, text/html, application/xml]'
echo "-------------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" -vX GET localhost:6984/_uuids
echo
curl -H "Accept: text/html" -vX GET localhost:6984/_uuids
echo
curl -H "Accept: application/xml" -vX GET localhost:6984/_uuids
read && clear
echo "curl -vX GET localhost:6984/:uri [:uri => _download, 404.xqy]"
echo "-------------------------------------------------------------"
curl -vX GET localhost:6984/_download
echo
curl -vX GET localhost:6984/404.xqy
read && clear
echo "curl -vX GET localhost:6984/:uri [:uri => server/version, server/version/1]"
echo "------------------------------------------------------------------------------"
curl -vX GET localhost:6984/server/version
echo
curl -vX GET localhost:6984/server/version/1
read && clear
echo "curl -vX GET localhost:6984/:uri/ [:uri => server/version/, server/version/1/]"
echo "------------------------------------------------------------------------------"
curl -vX GET localhost:6984/server/version/
echo
curl -vX GET localhost:6984/server/version/1/
