var express = require('express');
var router = express.Router();
var jsSHA = require('jssha');

/* GET home page. */
router.get('/', function(req, res, next) {
  var text = 'Hello World';
  var key  = 'nodejs';

  var shaObj = new jsSHA("SHA-1", "TEXT");
  shaObj.setHMACKey(key, "TEXT");
  shaObj.update(text);
  var hmac = shaObj.getHMAC("HEX");

  res.render('index', {
    text   : text,
    key    : key,
    output : hmac
  });
});

module.exports = router;
