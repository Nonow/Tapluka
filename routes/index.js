var express = require('express');
var router = express.Router();
var model = require('../models/model.js')

/* GET home page. */
router.get('/', function (req, res, next) {
    console.log(req.session.id_user)
    model.test(function (profils) {
        res.render('index', {login: req.session.id_user, title: 'index', profils: profils});
    })

});

router.get('/connexion', function (req, res, next) {
    res.render('connexion', {login: req.session.id_user, title: 'connexion'});
});

router.post('/connexion', function (req, res, next) {
    model.connect(req.body.email, req.body.passwd, function (id) {
        console.log(id)
        if (id == -1) {
            console.log("mail ou mdp incorrect")
            res.redirect("/connexion")
        } else {
            req.session.id_user = id;
            res.redirect("/")
        }

    })

});

router.post('/deconnexion', function (req, res, next) {
    req.session.id_user = undefined;
    res.redirect("/")
});

router.get('/inscription', function (req, res, next) {
    res.render('inscription', {login: req.session.id_user, title: 'inscription'});
});

router.get('/panier', function (req, res, next) {
    model.panier(req.session.id_user, function (panier,panier_user,magasin_dispo) {
        console.log(magasin_dispo,'magasin_dispo')
        res.render('panier', {login: req.session.id_user, title:'panier', panier: panier,panier_user:panier_user,magasin_dispo:magasin_dispo});
    })
});


router.post('/panier', function(req, res, next) {

    if(req.body.form == "removePanier") {
        console.log(req.body.nom)

        model.removeProduitPanier(req.session.id_user, req.body, function (statuts) {
            console.log("rediretion remove");
            res.redirect('/panier')
        })
    }
});

/* modifier pour avoir page postres*/
router.get('/postres', function (req, res, next) {
    res.render('postres', {login: req.session.id_user, title: 'recette'});
});
/* modifier pour avoir les magasins suivant un post d'ingredient */
router.post('/postres',function(req,res,next) {
    console.log('entrer dans POST, req.body.food:',req.body.food)
    if (req.body.form == "valider") {
        console.log('valider')
        console.log('req.body:',req.body)
        model.disponibilite(req.body,function(status){
        console.log('contenu requete :',status)
        res.render('postres',{login: req.session.id_user,title: 'listecourse_recette',status:status});
        //res.redirect('listecourse')
        })
    }
});

router.get('/specialite', function (req, res, next) {
    model.affiche_specialite(function (specialite,platsMonde){
        res.render('specialite', {login: req.session.id_user, title: 'specialite',specialite:specialite});
    })
});

router.get('/platsMonde', function (req, res, next) {
    res.render('platsMonde', {login: req.session.id_user, title: 'platsMonde'});   
});

router.post('/platsMonde', function (req, res, next) {
    if(req.body.form == "valider") {
        model.afficher_plats(req.body,function (platsMonde,preparation){ 
            res.render('platsMonde', {login: req.session.id_user, title: 'recette',platsMonde:platsMonde,preparation:preparation});
        })
    }
});

router.get('/choix_listecourse', function (req, res, next) {
    res.render('choix_listecourse', {login: req.session.id_user, title: 'choix_listecourse'});
    
});


/* Page listecourse_ajouterPanier , on affiche les ingrédients de la bdd */ 
router.post('/listecourse_ingredient',function(req, res, next) {
    if(req.body.form == "addPanier") {
        model.addProduitPanier(req.session.id_user, req.body.nom, function (status){
            res.redirect('/listecourse_ingredient')
    })
    }
    else if(req.body.form == "Supprimer"){
        model.AfficheIngr(req.body.form, function (ingredients){
            res.render('listecourse_ingredient', {login: req.session.id_user, title: 'listecourse_ingredient',ingredients : ingredients}); 
        })
    }
    else if(req.body.form){
        model.AfficheIngr(req.body.nom, function (ingredients){
            res.render('listecourse_ingredient', {login: req.session.id_user, title: 'listecourse_ingredient',ingredients : ingredients}); 
        })
    }
    else {
        res.redirect('/listecourse_ingredient')
    }
});

router.get('/listecourse_ingredient', function (req, res, next) {
    model.AfficheIngr(req.body.nom,function (ingredients,magasin_ingredients){
        res.render('listecourse_ingredient', {login: req.session.id_user, title: 'listecourse_ingredient',ingredients : ingredients});
    }) 
});

router.post('/listecourse_recette', function (req, res, next) {
    model.AfficheRecette(function (recettes,ingredients_recettes){
        res.render('listecourse_recette', {login: req.session.id_user, title: 'listecourse_recette',recettes : recettes,ingredients_recettes:ingredients_recettes});
    })
});

router.get('/listecourse_recette', function (req, res, next) {
    model.AfficheRecette(function (recettes,ingredients_recettes){
        res.render('listecourse_recette', {login: req.session.id_user, title: 'listecourse_recette',recettes : recettes,ingredients_recettes:ingredients_recettes});
    })
});


router.get('/regles', function (req, res, next) {
    res.render('regles', {login: req.session.id_user, title: 'regles'});
});

router.get('/recette', function (req, res, next) {
    res.render('recette', {login: req.session.id_user, title: 'recette'});
});

router.get('/recette/:id', function (req, res, next) {
    model.singleRecette(req.params.id, req.session.id_user, function (status, recettes, image, ingredients, typeRecette, preparation) {
        console.log(recettes)
        console.log(image)
        console.log(ingredients)
        console.log(typeRecette)
        res.render('recette', {
            login: req.session.id_user,
            title: 'recette',
            recettes: recettes,
            image: image,
            ingredients: ingredients,
            typeRecette: typeRecette,
            preparation: preparation
        });
    })
});

router.get('/famille', function (req, res, next) {
    if (req.session.id_user==undefined){
        res.redirect("/")
    }
    model.famille(req.session.id_user, function (famille, specAlim, allSA) {
        res.render('famille', {
            login: req.session.id_user,
            title: 'famille',
            famille: famille,
            specAlim: specAlim,
            allSA: allSA
        });
    })
});

router.post('/famille', function (req, res, next) {
    console.log(req.body)
    if (req.body.form == "add") {
        model.addFamille(req.session.id_user, req.body, function (status) {
            res.redirect('/famille')
        })
    } else if (req.body.form == "remove") {
        model.removeFamille(req.session.id_user, req.body.id, function (status) {
            console.log("redirection removeF");
            res.redirect('/famille')
        })
    } else {
        res.redirect('/famille')
    }


});

router.get('/modifier_famille', function (req, res, next) {
    res.redirect('/famille')
});

router.get('/modifier_famille/:id', function (req, res, next) {
    model.singleFamille(req.session.id_user, req.params.id, function (status, data, coched, uncoched) {
        console.log(status)
        res.render('modifier_famille', {
            login: req.session.id_user,
            title: 'modifier_famille',
            data: data,
            coched: coched,
            uncoched: uncoched
        });
    })
});

router.post('/modifier_famille/:id', function (req, res, next) {
    model.modifierFamille(req.session.id_user, req.params.id, req.body, function (status) {
        console.log(status)
        res.redirect('/famille')
    })
});


module.exports = router;
