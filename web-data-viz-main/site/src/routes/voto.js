var express = require("express");
var router = express.Router();

var votoController = require("../controllers/votoController");

router.get("/", function (req, res) {
    votoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    votoController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    votoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    votoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    votoController.publicar(req, res);
});

router.put("/editar/:idvoto", function (req, res) {
    votoController.editar(req, res);
});

router.delete("/deletar/:idvoto", function (req, res) {
    votoController.deletar(req, res);
});

module.exports = router;