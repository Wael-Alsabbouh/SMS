//Module dependencies.
var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
//var pagination = require('angular-utils-pagination');

//load users route
var users = require('./routes/users');   //API 
var app = express();

var connection  = require('express-myconnection'); 
var mysql = require('mysql');

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');     
//app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());

app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

/*------------------------------------------
    connection peer, register as middleware
    type koneksi : single,pool and request 
-------------------------------------------*/

app.use(
    
    connection(mysql,{
        
        host: 'localhost',
        user: 'root',
        password : 'admin',
        //port : 3306, //port mysql
        database:'sms_db'

    },'pool') //or single

);

app.get('/', routes.index);
app.get('/users', users.list);  
app.get('/users/add', users.add); 
app.post('/users/add', users.save); 
app.get('/users/delete/:id', users.delete_user); 
app.get('/users/edit/:id', users.edit); 
app.post('/users/edit/:id',users.save_edit); 


app.use(app.router);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});



/*|||||||||||||||| Invite by email |||||||||||||||*/

app.get("/invite",function(req,res){res.render("invite");});

app.post("/invite",function(req,res){
    var api_key = 'key-055bb9cb0a075b11fe777e200596e62a';
    var domain = 'sandboxdc00bc963eec4cccae80c4bae64b4a73.mailgun.org';
    var mailgun = require('mailgun-js')({apiKey: api_key, domain: domain});
 
    var data = {
      from: 'HYF Student System <postmaster@sandboxdc00bc963eec4cccae80c4bae64b4a73.mailgun.org>',
      to: req.body.useremail,
      subject: "HYF Student System",
      text: req.body.userbody
    };
 
mailgun.messages().send(data, function (error, body) {
  console.log(body);
    if(!error){
        res.redirect('/');
    }else{
        res.send("ERROR: MAIL NOT SEND! please try again");}
});
});

