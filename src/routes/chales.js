var express = require("express");
var router = express.Router();

var chalesController = require("../controllers/chalesController");

router.get("/chalePopulado", function(req, res) {
    chalesController.chalePopulado(req, res);
});

router.get("/chaleMaisPopuloso", function(req, res) {
    chalesController.chaleMaisPopuloso(req, res);
});

router.get("/chaleSemSemideuses", function(req, res) {
    chalesController.chaleSemSemideuses(req, res);
});


module.exports = router;