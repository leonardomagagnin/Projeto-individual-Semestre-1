var chalesModel = require("../models/chalesModel");


function contarChales(req, res) {
    chalesModel.contarChales()
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


module.exports = {
    contarChales,
    chaleMaisPopuloso
}