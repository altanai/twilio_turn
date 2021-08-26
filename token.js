require('dotenv').config();
console.log('Environment variable TWILIO_ACCOUNT_SID has the value: ', process.env.TWILIO_ACCOUNT_SID);

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const app = require('express')();
const fs = require('fs');
const bodyParser = require('body-parser');

var http = require('http');
var https = require('https');
var privateKey = fs.readFileSync(process.env.privateKey);
var certificate = fs.readFileSync(process.env.certificate);
var cors = require('cors');

app.use(cors());
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({extended: true})); // for parsing application/x-www-form-urlencoded

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Credentials', 'true');
    res.header("Access-Control-Allow-Methods","GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers","*");
    next();
});

app.post('/token', cors(), (req, res, next) => {
    console.log("Token request received ");
    client.tokens.create()
        .then(token => {
            console.log(token);
            res.send(token);
        })
        .catch(err => {
            console.error(err);
        });
});


const port = 3000;
const secureport = 3001;
var httpServer = http.createServer(app);
var httpsServer = https.createServer({
    key: privateKey,
    cert: certificate
}, app);

httpServer.listen(port);
httpsServer.listen(secureport);
