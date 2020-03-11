let connection = require('../bin/bdd');

/*function addSa(item,index,arr){
    connection.query("select nom from famille_spec fs join specificationsAlimentaires sA on fs.id_spec = sA.id where id_famille = ?",[arr[index].id],(err,rows)=> {
        if (err) throw err
        arr[index].sa = []
        for (var row in rows) {
            arr[index].sa.push(rows[row].nom)
        }
        console.log(arr[index].sa)
    })
}*/

class Model {
    static test(cb) {
        connection.query("select * from utilisateurs;", (err, rows) => {
            if (err) throw err
            cb(rows)
        })
    }

    /*
    (select sA.nom from familles f
        join famille_spec fs on f.id = fs.id_famille
        join specificationsAlimentaires sA on fs.id_spec = sA.id
    where f.id_utilisateur = 4 )
    union
    (select sA.nom from utilisateur_spec us
        join specificationsAlimentaires sA on us.id_spec = sA.id
    where us.id_utilisateur=4) ;
     */

    static famille(idUser, cb) {
        connection.query('select * from familles where id_utilisateur = ?', [idUser], (err, rows) => {
            if (err) throw err
            connection.query('select * from famille_spec fs join specificationsAlimentaires sA on fs.id_spec = sA.id', (err, rows2) => {
                if (err) throw err
                connection.query("select * from specificationsAlimentaires", (err, rows3) => {

                    cb(rows, rows2, rows3)
                })

            })
        })
    }

    static addFamille(idUser, data, cb) {
        var newId = Math.floor(Math.random() * 1000000);
        connection.query("insert into familles values (?,?,?,?);", [newId, idUser, data.nom, data.type], (err, rows) => {
            if (err) throw err
            var sql = "insert into famille_spec values"
            if (data.specAlim!=undefined){
                for (var i = 0; i < data.specAlim.length; i++) {
                    if (i == 0) {
                        sql += "(" + newId + "," + data.specAlim[i] + ")"
                    } else {
                        sql += ",(" + newId + "," + data.specAlim[i] + ")"
                    }
                }
                connection.query(sql, (err, rows) => {
                    if (err) throw err
                    cb("OK")
                })
            }else {
                cb("OK without specAlim")
            }

        })
    }

    static removeFamille(idUser, idFamille, cb) {
        connection.query("select count(*) as existUser from familles where id_utilisateur = ? and id=?", [idUser, idFamille], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                connection.query("delete from famille_spec where id_famille = ?", [idFamille], (err, rows) => {
                    if (err) throw err
                    connection.query("delete from familles where id=?", [idFamille], (err, rows) => {
                        if (err) throw err
                    })
                })
            } else {
                cb("KO")
            }
        })
    }

    static modifierFamille(idUser, idFamille, data, cb) {
        connection.query("select count(*) as existUser from familles where id_utilisateur = ? and id=?", [idUser, idFamille], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                connection.query("delete from famille_spec where id_famille = ?", [idFamille], (err, rows) => {
                    if (err) throw err
                    connection.query("delete from familles where id=?", [idFamille], (err, rows) => {
                        if (err) throw err
                        var newId = Math.floor(Math.random() * 1000000);
                        connection.query("insert into familles values (?,?,?,?);", [newId, idUser, data.nom, data.type], (err, rows) => {
                            if (err) throw err
                            var sql = "insert into famille_spec values"
                            if (data.specAlim!=undefined){
                                for (var i = 0; i < data.specAlim.length; i++) {
                                    if (i == 0) {
                                        sql += "(" + newId + "," + data.specAlim[i] + ")"
                                    } else {
                                        sql += ",(" + newId + "," + data.specAlim[i] + ")"
                                    }
                                }
                                connection.query(sql, (err, rows) => {
                                    if (err) throw err
                                    cb("OK")
                                })
                            }else {
                                cb("OK without specAlim")
                            }

                        })
                    })
                })
            } else {
                cb("KO")
            }
        })
    }

    static singleFamille(idUser, idFamille, cb) {
        connection.query("select count(*) as existUser from familles where id_utilisateur = ? and id=?", [idUser, idFamille], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                connection.query("select * from familles where id = ?", [idFamille], (err, rows1) => {
                    if (err) throw err
                    connection.query("select * from specificationsAlimentaires where id in (select id_spec from famille_spec where id_famille = ?)", [idFamille], (err, rows2) => {
                        if (err) throw err
                        connection.query("select * from specificationsAlimentaires where id not in (select id_spec from famille_spec where id_famille = ?)", [idFamille], (err, rows3) => {
                            if (err) throw err
                            cb("OK", rows1, rows2, rows3)
                        })
                    })
                })
            } else {
                cb("KO", null, null, null)
            }
        })
    }

    static singleRecette(idRecette, idUser, cb) {
        connection.query("select * from recettes where id = ?", [idRecette], (err, rows1) => {
            if (err) throw err
            connection.query("select * from imageRecette where id_recette = ?", [idRecette], (err, rows2) => {
                if (err) throw err
                connection.query("select DISTINCT id_recette, id_ingredient, nom, quantite, type from ingrédients i right join recette_ingredient ri on i.id = ri.id_ingredient where id_recette = ?", [idRecette], (err, rows3) => {
                    if (err) throw err
                    connection.query("select DISTINCT nom from recette_typeRecette rtr left join typeRecette tr on rtr.id_recette = tr.id where id_recette = ?", [idRecette], (err, rows4) => {
                        if (err) throw err
                        connection.query("select * from preparations where id_recette = ? order by numero", [idRecette],(err,rows5)=>{
                            if (err) throw err
                            cb("OK", rows1, rows2, rows3, rows4,rows5)

                        })
                    })
                })
            })
       })
    }
}

module.exports = Model
