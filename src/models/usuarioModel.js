var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT id, nome, email FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (nome, email, senha) VALUES ('${nome}', '${email}', '${senha}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function contarUsuarios() {
    var instrucaoSql = `SELECT COUNT(*) AS total FROM usuario;`;
    return database.executar(instrucaoSql);
}

function usuarioPorChale() {
    var instrucaoSql = `SELECT * FROM vw_contagem;`;
    return database.executar(instrucaoSql);
}

function reclamarUsuario(id, fk_chale) {
    var instrucaoSql = `UPDATE usuario SET fk_chale = '${fk_chale}', reclamado = 1 WHERE id = '${id}';`
    return database.executar(instrucaoSql);
}

function percentReclamados() {
    var instrucaoSql = `SELECT
                    SUM(CASE WHEN reclamado = 1 THEN 1 ELSE 0 END) AS reclamados,
                    SUM(CASE WHEN reclamado = 0 THEN 1 ELSE 0 END) AS naoReclamados
                    FROM usuario;`;
    return database.executar(instrucaoSql);
}

function usuariosNovos() {
    var instrucaoSql = `SELECT COUNT(*) AS usuariosNovosNoMes
                    FROM usuario
                    WHERE MONTH(dt_cadastro) = MONTH(CURRENT_DATE())
                    AND YEAR(dt_cadastro) = YEAR(CURRENT_DATE());`;
    return database.executar(instrucaoSql);
}
module.exports = {
    autenticar,
    cadastrar,
    contarUsuarios,
    usuarioPorChale,
    reclamarUsuario,
    percentReclamados,
    usuariosNovos
};