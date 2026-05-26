const pool = require("../config/db")

const Automovel = {
    listarTodos: async () => {
        const [rows] = await pool.execute(`SELECT * FROM automoveis`)
        return rows
    },
    deletar: async (id) => {
        const [result] = await pool.execute('DELETE FROM automoveis WHERE id = ?', [id])
        return result.affectedRows
    },
    criar: async (dados) => {
        const query = `
        INSERT INTO automoveis (nome, tipo, marca, modelo, ano_fabricacao)
        VALUES (?, ?, ?, ?, ?)
        `;
        const values = [dados.nome, dados.tipo, dados.marca, dados.modelo, dados.ano_fabricacao];
        const [result] = await pool.execute(query, values);
        return result.insertId;
    },
    atualizar: async (id, dados) => {
        const query = `
        UPDATE automoveis 
        SET nome = ?, tipo = ?, marca = ?, modelo = ?, ano_fabricacao = ?
        WHERE id = ?
        `;
        const values = [dados.nome, dados.tipo, dados.marca, dados.modelo, dados.ano_fabricacao, id];
        const [result] = await pool.execute(query, values);
        return result.affectedRows;
    }
}

module.exports = Automovel