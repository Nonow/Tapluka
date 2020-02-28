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
    static test(cb){
        connection.query("select * from utilisateurs;",(err,rows)=> {
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

    static famille(idUser,cb){
        connection.query('select * from familles where id_utilisateur = ?',[idUser], (err, rows)=>{
            if (err) throw err
            connection.query('select * from famille_spec fs join specificationsAlimentaires sA on fs.id_spec = sA.id',(err, rows2)=>{
                if (err) throw err
                cb(rows,rows2)
            })
        })
    }
}

module.exports = Model
