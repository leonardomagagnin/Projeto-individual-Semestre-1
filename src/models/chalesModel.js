var database = require("../database/config")

function contarChales() {
    var instrucaoSql = `SELECT COUNT(*) AS total FROM chale;`;
    return database.executar(instrucaoSql);
}

function chaleMaisPopuloso() {
    var instrucaoSql = `SELECT * FROM vw_contagem ORDER BY total DESC LIMIT 1;`;
    return database.executar(instrucaoSql);
}
module.exports = {
    contarChales,
    chaleMaisPopuloso
};