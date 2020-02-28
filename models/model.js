let connection = require('../bin/bdd');

class Model {
    static test(cb){
        connection.query("select * from utilisateurs;",(err,rows)=> {
            if (err) throw err
            cb(rows)
        })
    }
}

module.exports = Model
