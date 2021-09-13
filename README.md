# TURN Twilio 

## Setup
Obtain the values from twilio dashboard 
![twilio console](tbd)

Add sid and auth token variable values to .env file 

    echo "export TWILIO_ACCOUNT_SID='ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'" > .env
    echo "export TWILIO_AUTH_TOKEN='your_auth_token'" >> .env


## Run

set the environment for dotenv files to pick up location of ssl certs for host the api servera nd twillio creds 

    NODE_ENV=dev node token.js

Check Env 

    console.log(process.env);

start the application 

    npm install
    npm start

check its working by opening another tab and listening for port specified 

    netstat -anp | grep 3000


## Test
Test the application 

    curl -X POST http://localhost:3000/token

or on secure protocol 

     curl -X POST  https://localhost:3001/token
    
output format 

    {
    "username": "xx",
    "ice_servers": [
    {
    "url": "stun:global.stun.twilio.com:3478?transport=udp",
    "urls": "stun:global.stun.twilio.com:3478?transport=udp"
    },
    {
    "username": "xx",
    "credential": "yy",
    "url": "turn:global.turn.twilio.com:3478?transport=udp",
    "urls": "turn:global.turn.twilio.com:3478?transport=udp"
    },
    {
    "username": "xx",
    "credential": "yy",
    "url": "turn:global.turn.twilio.com:3478?transport=tcp",
    "urls": "turn:global.turn.twilio.com:3478?transport=tcp"
    },
    {
    "username": "xx",
    "credential": "yy",
    "url": "turn:global.turn.twilio.com:443?transport=tcp",
    "urls": "turn:global.turn.twilio.com:443?transport=tcp"
    }
    ],
    "date_updated": "Fri, 01 May 2020 01:42:57 +0000",
    "account_sid": "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "ttl": "86400",
    "date_created": "Fri, 01 May 2020 01:42:57 +0000",
    "password": "yy"
    }

Add the .env with creds to .gitignore to prevent them from leaking

    echo "twilio.env" >> .gitignore


## Check status 

    sudo netstat -tunlp

The options used in this command have the following meaning:

    -t - Show TCP ports.
    -u - Show UDP ports.
    -n - Show numerical addresses instead of resolving hosts.
    -l - Show only listening ports.
    -p - Show the PID and name of the listener’s process. This information is shown only if you run the command as root or sudo user.


## Debug and help 

**Issue 1** Curls fails for self signe dcert 

    curl -X POST https://localhost:3001/token
    
    curl: (60) SSL certificate problem: self signed certificate
    More details here: https://curl.haxx.se/docs/sslcerts.html
    
    curl failed to verify the legitimacy of the server and therefore could not
    establish a secure connection to it. To learn more about this situation and
    how to fix it, please visit the web page mentioned above.

**solution** add the -k or --insecure  switch to disable SSL certificate verification.
