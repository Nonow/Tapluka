var express = require('express');
var router = express.Router();
var model = require('../models/model.js')
var currentUser = 3

/* GET home page. */
router.get('/', function (req, res, next) {
    model.test(function (profils) {
        res.render('index', {title: 'index', profils: profils});
    })

});

router.get('/connexion', function (req, res, next) {
    res.render('connexion', {title: 'connexion'});
});

router.get('/inscription', function (req, res, next) {
    res.render('inscription', {title: 'inscription'});
});

router.get('/listecourse', function (req, res, next) {
    res.render('listecourse', {title: 'listecourse'});
});

router.get('/regles', function (req, res, next) {
    res.render('regles', {title: 'regles'});
});

router.get('/recette', function (req, res, next) {
    res.render('recette', {title: 'recette'});
});

router.get('/recette/:id', function (req, res, next) {
    model.singleRecette(req.params.id, currentUser, function(status, recettes, image, ingredients, typeRecette){
        console.log(recettes)
        console.log(image)
        console.log(ingredients)
        console.log(typeRecette)
        res.render('recette', {title: 'recette', recettes: recettes, image: image, ingredients: ingredients, typeRecette: typeRecette});
    })
});

router.get('/famille', function (req, res, next) {
    model.famille(currentUser, function (famille, specAlim, allSA) {
        res.render('famille', {title: 'famille', famille: famille, specAlim: specAlim, allSA: allSA});
    })
});

router.post('/famille', function (req, res, next) {
    console.log(req.body)
    if (req.body.form == "add") {
        model.addFamille(currentUser, req.body, function (status) {
            res.redirect('/famille')
        })
    } else if (req.body.form == "remove") {
        model.removeFamille(currentUser, req.body.id, function (status) {
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
    model.singleFamille(currentUser, req.params.id, function (status,data, coched, uncoched) {
        console.log(status)
        res.render('modifier_famille', {title: 'modifier_famille', data: data, coched: coched, uncoched: uncoched});
    })
});

router.post('/modifier_famille/:id', function (req, res, next) {
    model.modifierFamille(currentUser, req.params.id,req.body, function (status) {
        console.log(status)
        res.redirect('/famille')
       })
});



module.exports = router;
