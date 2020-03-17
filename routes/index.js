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
        if (id == 0) {
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

router.get('/listecourse', function (req, res, next) {
    res.render('listecourse', {login: req.session.id_user, title: 'listecourse'});
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
