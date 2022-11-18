const express = require('express');
const {engine} = require('express-handlebars');
const myconnection = require('express-myconnection');
const mysql = require('mysql');
const session = require('express-session');
const bodyParser = require(body-parser);

const app = express();
app.set('port', 3306);

app.listen(app.get('port'), () => {
   console.log('Listening on port ', app.get('port'));
});