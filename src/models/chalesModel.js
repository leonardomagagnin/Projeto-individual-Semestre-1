var database = require("../database/config")

function chalePopulado() {
    var instrucaoSql = `SELECT COUNT(DISTINCT c.id) AS chalesOcupados
                FROM chale c
                LEFT JOIN usuario u
                ON u.fk_chale = c.id
                WHERE u.id IS NOT NULL;`;
    return database.executar(instrucaoSql);
}

function chaleMaisPopuloso() {
    var instrucaoSql = `SELECT * FROM vw_contagem ORDER BY total DESC LIMIT 1;`;
    return database.executar(instrucaoSql);
}

function chaleSemSemideuses() {
    var instrucaoSql = `SELECT COUNT(*) AS total
                FROM chale c
                LEFT JOIN usuario u
                ON u.fk_chale = c.id
                WHERE u.id IS NULL;`;
    return database.executar(instrucaoSql);
}

function chaleAtual(id) {
    var  instrucaoSql = `SELECT c.divindade AS chale, c.frase AS frase, u.fk_chale AS numero FROM usuario u
                    INNER JOIN chale c ON u.fk_chale = c.id
                    WHERE u.id = '${id}'`;
    return database.executar(instrucaoSql)
}
module.exports = {
    chalePopulado,
    chaleMaisPopuloso,
    chaleSemSemideuses,
    chaleAtual
};