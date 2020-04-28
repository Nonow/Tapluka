let connection = require('../bin/bdd');
let allergie_presente = false
let ingredient // recupere l'allergie si présente

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
                connection.query("select DISTINCT id_recette, id_ingredient, nom, quantite, photo, type from ingrédients i right join recette_ingredient ri on i.id = ri.id_ingredient where id_recette = ?", [idRecette], (err, rows3) => {
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

    static connect(mail,passwd,cb){
        connection.query("select * from utilisateurs where mail=? and motdepasse=?",[mail,passwd],(err,rows)=>{
            if (err) throw err
            if (rows.length > 0){
                cb(rows[0]['id'])
            }else{
                cb(-1)
            }
        })
    }

    /* modifier pour avoir la liste des ingredients utilisé par la page listecourse */
    static AfficheIngr(allergie,cb){
        if(allergie=="Supprimer"){
            allergie_presente = false
            connection.query('SELECT nom,photo,id FROM ingrédients', function(err, rows) {
                if (err) throw err
                cb(rows)  
            })
        }
        else if(allergie!=undefined && allergie!="Supprimer"){
            allergie_presente = true
            ingredient = allergie
            connection.query('SELECT nom,photo,id FROM ingrédients where nom not in (?)',[allergie], function(err, rows) {
                if (err) throw err
                cb(rows)  
            })
        }
        else if(allergie_presente && ingredient!=undefined){
            connection.query('SELECT nom,photo,id FROM ingrédients where nom not in (?)',[ingredient], function(err, rows) {
                if (err) throw err
                cb(rows)  
            })
        }
        else {
            connection.query('SELECT nom,photo,id FROM ingrédients', function(err, rows) {
                if (err) throw err
                cb(rows)  
            })
        }


    }


    /* modifier  pour avoir l'id ingredient*/
    static AfficheRecette(cb){
        connection.query('SELECT chemin_rec,recettes.nom,id from recettes', function(err, rows1) {
            if (err) throw err
            connection.query('select ingrédients.nom, id_recette, ingrédients.id from ingrédients join recette_ingredient on recette_ingredient.id_ingredient = ingrédients.id join recettes on recettes.id = recette_ingredient.id_recette ', function(err, rows2) {
                if (err) throw err
                cb(rows1,rows2)
            })
        })
    }

     /* modifier pour avoir tt les info sur les magasins, ingredient ,somme panier */
    static disponibilite(data,cb){
       // ne marche pas avec un seul ingredient ayant un id > 9 
        if(data.food!=undefined)
            var liste_ingredient =""
            var nb_ingredient=0
            for(var i=0;i<data.food.length;i++){

                if (i == data.food.length-1) {
                    liste_ingredient += data.food[i]
                    nb_ingredient++
                } 
                else {
                    liste_ingredient += data.food[i] + ","
                    nb_ingredient++
                }
            }
       // var sql="select id_magasin,nom,latitude,longitude from (select id_magasin,id_ingredient from magasin_ingredient where id_ingredient in("+liste_ingredient+") ORDER by id_magasin) as T JOIN magasins USING(id_magasin) GROUP BY id_magasin HAVING count(id_ingredient) ="+ nb_ingredient
        var sql ="SELECT id_magasin,nom,latitude,longitude,ROUND(sum(Prix),2) as Cout FROM (select id_magasin,id_ingredient,Prix from magasin_ingredient where id_ingredient in("+liste_ingredient+") ORDER by id_magasin) as T1 JOIN magasins USING(id_magasin) GROUP BY id_magasin HAVING count(id_ingredient) = "+ nb_ingredient
        console.log('liste ingrédients:',liste_ingredient)
        console.log('nb ingrédients:',nb_ingredient)
        //connection.query("select id_magasin from (select id_magasin,id_ingredient from magasin_ingredient where id_ingredient in(?) ORDER by id_magasin) as T GROUP BY id_magasin HAVING count(id_ingredient) = ?",[liste_ingredient,nb_ingredient],(err,rows) =>{
        //connection.query('select id_magasin from (select id_magasin,id_ingredient from magasin_ingredient where id_ingredient in(1,2,10) ORDER by id_magasin) as T GROUP BY id_magasin HAVING count(id_ingredient) = 3',(err,rows) =>{
        connection.query(sql,(err,rows) =>{ 
            if (err) throw err
            cb(rows)
        })
    }

    static addProduitPanier(idUser,data, cb) {
        var newId = Math.floor(Math.random() * 1000000);
        connection.query('SELECT * from panier where id_utilisateur=?', [idUser] ,(err,rows)=> {
            if (err) throw err
                connection.query("insert into panier values (?,?,?);", [newId,idUser,data], (err, rows2) => {
                    if (err) throw err
                    cb(rows,rows2)

                })

            })
    }

    static panier(idUser ,cb) {
         connection.query('SELECT * from panier where id_utilisateur=?', [ idUser], (err, rows)=> {
            if (err) throw err 
                connection.query('SELECT p.nom from panier p join utilisateurs u on p.id_utilisateur = u.id', (err,rows2) =>{
                    if (err) throw err
                    connection.query('select mag.nom,ROUND(sum(Prix),2) as cout,mag.id_magasin from magasins as mag join magasin_ingredient as mag_ing on mag.id_magasin = mag_ing.id_magasin join ingrédients on mag_ing.id_ingredient = ingrédients.id join panier on ingrédients.nom = panier.nom where id_utilisateur = ? GROUP BY mag.id_magasin having count(mag_ing.id_ingredient)= (select count(*) from panier where id_utilisateur=?)', [idUser,idUser], (err, rows3) => {
                        if (err) throw err
                        cb(rows,rows2,rows3)
                    }) 
        }) 
              /*  connection.query('SELECT * from ') */
        })
    }

   static removeProduitPanier(idUser, data , cb) {
        connection.query("select count(*) as existProduit from panier where id_utilisateur = ?", [idUser], (err, rows) => {
            if (err) throw err
            if (rows.length > 0) {
                connection.query("delete from panier where id_utilisateur = ? and nom =?" , [idUser,data.nom], (err, rows2) => {
                    if (err) throw err
                    cb(rows,rows2)
                    })
                }
        })
    }

    static affiche_specialite(cb){
        connection.query("select * from specialiteMonde", (err, rows) => {
            if (err) throw err
            cb(rows)
                
        })
    }

    static afficher_plats(data,cb){
        if(data.pays!=undefined){
            var liste_ingredient =""
            var nb_ingredient=0
            for(var i=0;i<data.pays.length;i++){

                if (i == data.pays.length-1) {
                    liste_ingredient += data.pays[i]
                    nb_ingredient++
                } 
                else {
                    liste_ingredient += data.pays[i] + ","
                    nb_ingredient++
                }
            }
        }
        connection.query("select recettes.id,difficulte,difficulte,tempsPreparation,tempsCuisson,specialite,chemin_rec,nom from specialiteMonde as spm join recette_specMonde as rec_spec on spm.id = rec_spec.id_specialite join recettes on recettes.id = rec_spec.id_recette where rec_spec.id_specialite in ("+liste_ingredient+")", (err, rows) => {
            if (err) throw err
            connection.query("select numero,preparations.description,preparations.id_recette from specialiteMonde as spm join recette_specMonde as rec_spec on spm.id = rec_spec.id_specialite join recettes on recettes.id = rec_spec.id_recette join preparations on preparations.id_recette = recettes.id where rec_spec.id_specialite in ("+liste_ingredient+")", (err, rows1) => {
                if (err) throw err
                cb(rows,rows1)
            })   
        })
    }

}  

module.exports = Model
