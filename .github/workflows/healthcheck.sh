code=true
for i in {1..10}       
   do
     response=$(curl -m 5 -s -w "%{http_code}" "https://openhacktdp1i383poi-staging.azurewebsites.net/api/healthcheck/poi")
     http_code=$(tail -n1 <<< "$response") 
     echo "Status:" "$http_code" 
      if [ "$http_code" == "}200" ] 
      then
       break
      else
        code=false
      fi
        sleep 30
     done
echo "$code"
if [ "$code" == false ] 
then
 exit 1
fi      
