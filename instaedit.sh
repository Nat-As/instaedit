#!bin/sh
# User Authentication Bypass Switch
# Produced by: National Assembly
# Developed by: Captain_Cozmos, (Aircrack.666.ng)

clear
cat << "EOF"
██╗███╗   ██╗███████╗████████╗ █████╗       ███████╗██████╗ ██╗████████╗    ██████╗     ██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗      ██╔════╝██╔══██╗██║╚══██╔══╝    ╚════██╗   ██╔═████╗
██║██╔██╗ ██║███████╗   ██║   ███████║█████╗█████╗  ██║  ██║██║   ██║        █████╔╝   ██║██╔██║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║╚════╝██╔══╝  ██║  ██║██║   ██║       ██╔═══╝    ████╔╝██║
██║██║ ╚████║███████║   ██║   ██║  ██║      ███████╗██████╔╝██║   ██║       ███████╗██╗╚██████╔╝
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝      ╚══════╝╚═════╝ ╚═╝   ╚═╝       ╚══════╝╚═╝ ╚═════╝ 
                                                                                                
EOF

echo ---------------------------------------
echo Insta-Edit Instagram Account Editor
echo By: Captain_Cozmos and TheLinuxChoice
echo IAW: National Assembly Red Team
echo ---------------------------------------

sleep 5
#clear

string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"
var=$(curl -i -s -H "$header" https://i.instagram.com/api/v1/si/fetch_headers/?challenge_type=signup&guid=$uuid > /dev/null)
var2=$(echo $var | awk -F ';' '{print $2}' | cut -d '=' -f3)

banner() {
printf "\n"
printf "[+] Insta-Edit v3.0,\e[1;92m Author: Captain_Cozmos & TheLinuxChoice\n"
printf "\n"

}
start() {
printf "Enter User Account:"
printf "\n"
read user
clear

printf "Authenticating with Instagram...\n"

# Check with Instagram to see if the account is present
# Comment out to Assume account is valid
checkaccount="$(curl -L -s https://www.instagram.com/$user/ | grep -c "the page may have been removed")"

 if [ $checkaccount -ge 1 ] 
    then
        printf "\e[1;91mInvalid Username! Press Ctrl+C to interrupt!\n"
    elif [ $checkaccount -lt 1 ]
        then
        printf "Checking Account...\n"
        printf "[*] OK\n"
    else
        printf "[*] ERROR!"
        printf "\n"
 sleep 1
 exit 1
 fi

# Get password
# Later will be commented out for requests containing only user ID and access token?

printf "Password for user:"
printf "\n"
read pass

# Define HTTP Headers

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"

# Copied line to omit password (Correct syntax above)
#data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "login_attempt_count":"0"}'
#ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"

# Tell us what we are doing
printf "$data"
printf "\n"
printf "IG Signature:"
printf "$ig_sig"



hmac="$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)"
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
printf "$useragent"
#                var="$(curl -c cookie -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq )"
                curl -c cookie -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq 
# for debuging
printf "\n"
printf "[*] Printing Var..."
printf "$var"
printf "\n"                
if [ $var == "challenge" ]
    then printf "\e[1;92m \n[*] Login Successful!\n [*] But Challenge required! Exiting\n"
        exit 1
    elif [ $var == "logged_in_user" ]
        then printf "\e[1;92m \n[*] Login Successful!\n" 
    elif [ $var == "Please wait" ]
        then printf "\e[1;93m \n [*] Please wait, ip blocked!\n"
    else 
        printf "Unknown Value: $var\n"
        printf "Exiting..."
fi

}

edit_profile() {
printf "\n"
printf "\e[1;92m[\e[1;77m+\e[1;92m] Edit Profile:\n"
read -p $'[+] Gender (male: 1, female: 2, Undef: 3):' gender
read -p $'[+] Phone: ' phone
IFS=$'\n'
read -p $'[+] First Name: ' first_name
IFS=$'\n'
read -p $'[+] Bio: ' bio
read -p $'[+] External Url: ' external_url
read -p $'[+] Email: ' email
data='{"username":"'$user'", "gender": "'$gender'", "phone_number": "'$phone'", "first_name": "'$first_name'", "biography": "'$bio'", "external_url": "'$external_url'", "email": "'$email'" }'
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
IFS=$'\n'
curl -b cookie -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/edit_profile/"

}
banner
start
edit_profile
