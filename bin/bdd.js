let mysql = require('mysql');
/*let connection = mysql.createConnection({
    host: 'remotemysql.com',
    user: 'Um177LwAqA',
    password: 'j5GGwOJHsi',
    database: 'Um177LwAqA',
    insecureAuth : true,
});*/
let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'm1-gestionprojet',
    insecureAuth : true,
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected to MySQl");
});
module.exports = connection;