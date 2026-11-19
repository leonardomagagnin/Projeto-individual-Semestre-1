var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/contarUsuarios", function(req, res) {
    usuarioController.contarUsuarios(req, res);
});

router.get("/usuarioPorChale", function(req,res) {
    usuarioController.usuarioPorChale(req, res);
});

router.post("/reclamarUsuario", function(req, res) {
    usuarioController.reclamarUsuario(req, res);
});

router.get("/percentReclamados", function(req, res) {
    usuarioController.percentReclamados(req, res);
});

router.get("/usuariosNovos", function(req, res) {
    usuarioController.usuariosNovos(req, res);
})
module.exports = router;