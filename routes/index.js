var express = require('express');
var cookieParser = require('cookie-parser');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  cookieParser.signedCookies(req.cookies, "222");
  res.render('index', { title: 'Express' });
}); 

module.exports = router;
