var database = require("../database/config");

function listar() {
    console.log("ACESSEI O voto  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT 
            v.idPersonagem,
            v.nomePersonagem,
            u.idUsuario,
            u.nome,
            u.email,
            u.senha
            v.fkPersonagem
        FROM personagem v
            INNER JOIN usuario u
                ON v.idPersonagem = u.fkPersonagem;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function votar(fkPersonagem, idUsuario) {
    console.log("ACESSEI O voto MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function editar(): ", fkPersonagem, idUsuario);
    var instrucao = `
        UPDATE usuario SET fkPersonagem = ${fkPersonagem} WHERE idUsuario = ${idUsuario}; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function editar(novoPersonagem, idUsuario) {
    console.log("ACESSEI O voto MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function editar(): ", novoPersonagem, idUsuario);
    var instrucao = `
        UPDATE usuario SET fkPersonagem = '${novoPersonagem}' WHERE idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
    votar,
    editar
}
