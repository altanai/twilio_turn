require('dotenv').config();

// const properties = require("./env");
// var options = {
//     key: fs.readFileSync(properties.key),
//     cert: fs.readFileSync(properties.cert),
//     ca: fs.readFileSync(properties.ca),
//     requestCert: true,
//     rejectUnauthorized: false
// };
console.log('Environment variable TWILIO_ACCOUNT_SID has the value: ', process.env.TWILIO_ACCOUNT_SID);

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);





const app = require('express')();
const bodyParser = require('body-parser');
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

app.post('/', (req, res, next) => {
    console.log(req);
    client.tokens.create()
        .then(token => {
            console.log(token);
            res.send(token);
        })
        .catch(err=>{
            console.error(err);
        });
});

app.listen(3000);