const pool = require("../config/db")

const Pessoa = {
    listarTodos: async () => {
        const [rows] = await pool.execute(`SELECT * FROM pessoas`)
        return rows
    },
    deletar: async (id) => {
        const [rows] = await pool.execute('DELETE FROM pessoas WHERE id = ?', [id])
        return rows.affectedRows
    },
    criar: async (dados) => {
        const query = `
        INSERT INTO pessoas
        (nome_razao_social, cep, documento, email)
        VALUES (?, ?, ?, ?)
        `;
        const values = [
            dados.nome_razao_social,
            dados.cep || null,
            dados.documento,
            dados.email || null
        ];
        const [result] = await pool.execute(query, values);
        return result.insertId;
    },
    atualizar: async (id, dados) => {
        const query = `
        UPDATE pessoas
        SET nome_razao_social = ?, cep = ?, documento = ?,email = ?
        WHERE id = ?
        `;
        const values = [
            dados.nome_razao_social,
            dados.cep || null,
            dados.documento,
            dados.email || null,
            id
        ];
        const [result] = await pool.execute(query, values);
        return result.affectedRows;
    }
}

module.exports = Pessoa