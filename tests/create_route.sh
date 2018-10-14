endpoint=http://localhost:8080
echo $endpoint > endpoint.txt

# Create User
echo "Create User"
./create_user.sh

# Get Token
token=$(./get_user_token.sh)

# Set Key Name and value
key=mykey
val="lorem ipsum $random $(date)"
echo -e "\n\nKey is: $endpoint/keys/$key - Value is: '$val'"

# Write Key
echo "WRITE key"
echo $val | curl -s -X PUT -d @- $endpoint/keys/$key -H "Authorization: Bearer $token" 

# Get Key

echo -e "\n\nGET key"
curl -s $endpoint/keys/$key -H "Authorization: Bearer $token"

# Create Route

echo -e "\nCreate route for key"
echo $val | curl -s -X PUT -d @- $endpoint/routes/$key -H "Authorization: Bearer $token" 

