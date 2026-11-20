var chalesModel = require("../models/chalesModel");


function chalePopulado(req, res) {
    chalesModel.chalePopulado()
    .then(
        function (resultadoContagem) {
            res.json(resultadoContagem)
        }
    ).catch(
        function (erro) {
                console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar a contagem! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
        }
    )
}

function chaleMaisPopuloso(req, res) {
    chalesModel.chaleMaisPopuloso()
    .then(
        function (resultadoContagem) {
            res.json(resultadoContagem)
        }
    ).catch(
        function (erro) {
                console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar a contagem! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
        }
    )
}

function chaleSemSemideuses(req, res) {
    chalesModel.chaleSemSemideuses()
    .then(
        function (resultadoContagem) {
            res.json(resultadoContagem)
        }
    ).catch(
        function (erro) {
                console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar a contagem! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
        }
    )
}

function chaleAtual(req, res) {
    var id = req.query.idServer;

    chalesModel.chaleAtual(id)
    .then(
        function (resultado) {
            res.json(resultado)
        }
    ).catch(
        function (erro) {
                console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar a busca! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
        }
    )
}
module.exports = {
    chalePopulado,
    chaleMaisPopuloso,
    chaleSemSemideuses,
    chaleAtual
}