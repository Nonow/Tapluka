let mysql = require('mysql');
let connection = mysql.createConnection({
    host: 'remotemysql.com',
    user: 'Um177LwAqA',
    password: 'j5GGwOJHsi',
    database: 'Um177LwAqA',
    insecureAuth : true,
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected to MySQl");
});
module.exports = connection;