let connection = require('../bin/bdd');

class Model {
    static test(cb){
        connection.query("select * from utilisateurs;",(err,rows)=> {
            if (err) throw err
            cb(rows)
        })
    }

    static recette(cb) {
        connection.query("select * from recettes natural join imageRecette natural join recette_ingredient natural join ingrédients natural join recette_typeRecette natural join typeRecette;", (err, rows) => {
            if (err) throw err
            console.log(rows)
        })
    }
}

module.exports = Model
