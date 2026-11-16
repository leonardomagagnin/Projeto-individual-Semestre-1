var express = require("express");
var router = express.Router();

var chalesController = require("../controllers/chalesController");

router.get("/contarChales", function(req, res) {
    chalesController.contarChales(req, res);
});

router.get("/chaleMaisPopuloso", function(req, res) {
    chalesController.chaleMaisPopuloso(req, res);
});


module.exports = router;