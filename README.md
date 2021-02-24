# TURN Twilio 

## Setup
Obtain the values from twilio dashboard 
![twilio console](tbd)

Add sid and auth token variable values to .env file 
```
echo "export TWILIO_ACCOUNT_SID='ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'" > .env
echo "export TWILIO_AUTH_TOKEN='your_auth_token'" >> .env
```

## Run 
```shell
npm install
npm start
```

## Test 
```shell
curl -X POST http://localhost:3000
```
Sample output
```shell
-tbd
```

Add the .env with creds to .gitignore to prevent them from leaking
```shell
echo "twilio.env" >> .gitignore
```

