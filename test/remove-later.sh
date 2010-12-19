# something like a todo list.
# if its broken please fix me later :)
clear
echo "curl localhost:port [:port => 6984,5984]"
echo "----------------------------------------"
curl localhost:6984
echo
curl localhost:5984
read && clear
echo "curl -vX GET localhost:port/_all_dbs [:port => 6984,5984]"
echo "----------------------------------------------------------"
curl -vX GET localhost:6984/_all_dbs
echo
curl -vX GET localhost:5984/_all_dbs
read && clear
echo "curl -vX PUT localhost:port/Fab [:port => 6984,5984]"
echo "----------------------------------------------------"
curl -vX PUT localhost:6984/TestShouldFail -d ""
echo
curl -vX PUT localhost:5984/TestShouldFail
read && clear
echo "curl -vX PUT localhost:port/testing [:port => 6984,5984]"
echo "--------------------------------------------------------"
curl -vX PUT localhost:6984/testing -d ""
echo
curl -vX PUT localhost:5984/testing
read && clear
echo "curl -vX PUT localhost:port/testing [:port => 6984,5984]"
echo "--------------------------------------------------------"
curl -vX PUT localhost:6984/testing -d ""
echo
curl -vX PUT localhost:5984/testing
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
echo "curl localhost:port/ [:port => 6984,5984]"
echo "-------------------------------------------------"
curl localhost:6984/
echo
curl localhost:5984/
read && clear
echo "curl -vX HEAD localhost:port/ [:port => 6984,5984]"
echo "--------------------------------------------------"
curl -vX HEAD localhost:6984/
read && clear 
echo "curl -vX GET localhost:port/_uuids [:port => 6984,5984]"
echo "----------------------------------------------------------"
curl -vX GET localhost:6984/_uuids
echo
curl -vX GET localhost:5984/_uuids
read && clear 
echo "curl localhost:port/_uuids/ [:port => 6984,5984]"
echo "-----------------------------------------------------------"
curl localhost:6984/_uuids/
echo
curl localhost:5984/_uuids/
read && clear 
echo "curl localhost:port/_uuids?count=0 [:port => 6984,5984]"
echo "-----------------------------------------------------------"
curl localhost:6984/_uuids?count=0
echo
curl localhost:5984/_uuids?count=0
read && clear 
echo "curl localhost:port/_uuids?count=1 [:port => 6984,5984]"
echo "-----------------------------------------------------------"
curl localhost:6984/_uuids?count=1
echo
curl localhost:5984/_uuids?count=1
read && clear 
echo "curl localhost:port/_uuids?count=10 [:port => 6984,5984]"
echo "-----------------------------------------------------------"
curl localhost:6984/_uuids?count=10
echo
curl localhost:5984/_uuids?count=10
read && clear 
echo "time curl localhost:port/_uuids?count=10000 [:port => 6984,5984]"
echo "-----------------------------------------------------------"
time curl localhost:6984/_uuids?count=10000 > /dev/null
echo
time curl localhost:5984/_uuids?count=10000 > /dev/null
read && clear
echo 'curl -H "Accept: :type" localhost:6984 [:type => text/plain, text/html, application/xml]'
echo "------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" localhost:6984
echo
curl -H "Accept: text/html" localhost:6984
echo
curl -H "Accept: application/xml" localhost:6984
read && clear 
echo 'curl -H "Accept: :type" localhost:6984/_all_dbs [:type => text/plain, text/html, application/xml]'
echo "-------------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" localhost:6984/_all_dbs
echo
curl -H "Accept: text/html" localhost:6984/_all_dbs
echo
curl -H "Accept: application/xml" localhost:6984/_all_dbs
read && clear 
echo 'curl -H "Accept: :type" localhost:6984/_all_forests [:type => text/plain, text/html, application/xml]'
echo "-------------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" localhost:6984/_all_forests
echo
curl -H "Accept: text/html" localhost:6984/_all_forests
echo
curl -H "Accept: application/xml" localhost:6984/_all_forests
read && clear 
echo 'curl -H "Accept: :type" localhost:6984/_uuids [:type => text/plain, text/html, application/xml]'
echo "-------------------------------------------------------------------------------------------------------"
curl -H "Accept: text/plain" localhost:6984/_uuids
echo
curl -H "Accept: text/html" localhost:6984/_uuids
echo
curl -H "Accept: application/xml" localhost:6984/_uuids
read && clear
echo "curl (-vX GET)? localhost:6984/:uri [:uri => _download, 404.xqy]"
echo "----------------------------------------------------------------"
curl -vX GET localhost:6984/_download
echo
curl localhost:6984/404.xqy
read && clear
echo "curl localhost:6984/:uri [:uri => server/version, server/version/1]"
echo "------------------------------------------------------------------------------"
curl localhost:6984/server/version
echo
curl localhost:6984/server/version/1
read && clear
echo "curl localhost:6984/:uri/ [:uri => server/version/, server/version/1/]"
echo "------------------------------------------------------------------------------"
curl localhost:6984/server/version/
echo
curl localhost:6984/server/version/1/
