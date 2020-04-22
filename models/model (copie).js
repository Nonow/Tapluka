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
                    if (err) throw err
                    connection.query("select planning.id as idP,jour,moment,r.id,r.nom from planning join recettes r on planning.id_recette = r.id where planning.id_utilisateur = ?", [idUser], (err, rows4) => {
                        if (err) throw err
                        connection.query("select * from planning_famille p join familles f on f.id = p.id_famille where id_utilisateur = ?", [idUser], (err, rows5) => {
                            if (err) throw err
                            connection.query("select * from recette_favori join recettes r on recette_favori.id_recette = r.id where recette_favori.id_utilisateur = ?", [idUser], (err, rows6) => {
                                if (err) throw err
                                cb(rows, rows2, rows3, rows4, rows5, rows6)
                            })

                        })
                    })

                })

            })
        })
    }

    static addFamille(idUser, data, cb) {
        var newId = Math.floor(Math.random() * 1000000);
        connection.query("insert into familles values (?,?,?,?);", [newId, idUser, data.nom, data.type], (err, rows) => {
            if (err) throw err
            var sql = "insert into famille_spec values"
            if (data.specAlim != undefined) {
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
            } else {
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
                        cb("OK")
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
                            if (data.specAlim != undefined) {
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
                            } else {
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

    static rechercheRecette(idRecette, idUser, cb) {
        connection.query("select * from recettes where id = ?", [idRecette], (err, rows1) => {
            if (err) throw err
            cb("OK", rows1, rows2, rows3, rows4, rows5, false)
        })
    }



    static singleRecette(categorie, idUser, cb) {
        connection.query("select * from recettes where categorie = ?", [categorie], (err, rows1) => {
            if (err) throw err
            connection.query("select * from imageRecette where id_recette = ?", [idRecette], (err, rows2) => {
                if (err) throw err
                connection.query("select DISTINCT id_recette, id_ingredient, nom, quantite, photo, type from ingrédients i right join recette_ingredient ri on i.id = ri.id_ingredient where id_recette = ?", [idRecette], (err, rows3) => {
                    if (err) throw err
                    connection.query("select DISTINCT nom from recette_typeRecette rtr left join typeRecette tr on rtr.id_recette = tr.id where id_recette = ?", [idRecette], (err, rows4) => {
                        if (err) throw err
                        connection.query("select * from preparations where id_recette = ? order by numero", [idRecette], (err, rows5) => {
                            if (err) throw err
                            connection.query("select * from recette_favori where id_recette = ? and id_utilisateur = ?", [idRecette, idUser], (err, rows6) => {
                                if (err) throw err
                                if (rows6.length > 0) {
                                    cb("OK", rows1, rows2, rows3, rows4, rows5, true)
                                } else {
                                    cb("OK", rows1, rows2, rows3, rows4, rows5, false)
                                }
                            })


                        })
                    })
                })
            })
        })
    }




    static removeFav(idUser, idRecette, cb) {
        connection.query("delete from recette_favori where id_recette = ? and id_utilisateur = ?", [idRecette, idUser], (err, rows) => {
            if (err) throw err
            cb("OK")
        })
    }

    static addFav(idUser, idRecette, cb) {
        connection.query("insert into recette_favori values (?,?)", [idRecette, idUser], (err, rows) => {
            if (err) throw err
            cb("OK")
        })
    }

    static connect(mail, passwd, cb) {
        connection.query("select * from utilisateurs where mail=? and motdepasse=?", [mail, passwd], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                cb(rows[0]['id'])
            } else {
                cb(-1)
            }
        })
    }

    static addPlatPlanning(idUser, idRecette, jour, moment, cb) {
        connection.query("insert into planning values (default, ?,?,?,?)", [jour, moment, idUser, idRecette], (err, rows) => {
            if (err) throw err
            cb("OK")
        })
    }

    static removePlatPlanning(idUser, idPlanning, cb) {
        connection.query("select * from planning where id = ? and id_utilisateur = ?", [idPlanning, idUser], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                connection.query("delete from planning_famille where id_planning = ?", [idPlanning], (err, rows2) => {
                    if (err) throw err
                    connection.query("delete from planning where id = ?", [idPlanning], (err, rows3) => {
                        if (err) throw err
                        cb("OK")
                    })
                })
            } else {
                cb("KO")
            }
        })
    }

    static addFamillePlanning(idPlanning, idFamille, cb) {
        connection.query("select * from planning_famille where id_planning = ? and id_famille = ?", [idPlanning, idFamille], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                cb("KO")
            } else {
                connection.query("insert into planning_famille values (?,?)", [idPlanning, idFamille], (err, rows) => {
                    if (err) throw err
                    cb("OK")
                })
            }
        })
    }

    static removeFamillePlanning(idPlanning, idFamille, cb) {
        connection.query("delete from planning_famille where id_planning = ? and id_famille = ?",[idPlanning,idFamille],(err,rows)=>{
            if (err) throw err
            cb("OK")
        })
    }
}
module.exports = Model
