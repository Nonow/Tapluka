var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'index' });
});

router.get('/connexion', function(req, res, next) {
  res.render('connexion', { title: 'connexion' });
});

router.get('/inscription', function(req, res, next) {
  res.render('inscription', { title: 'inscription' });
});

router.get('/listecourse', function(req, res, next) {
  res.render('listecourse', { title: 'listecourse' });
});

router.get('/regles', function(req, res, next) {
  res.render('regles', { title: 'regles' });
});

module.exports = router;
