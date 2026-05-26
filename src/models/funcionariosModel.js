const pool = require("../config/db")

const Funcionario = {
    listarTodos: async () => {
        const [rows] = await pool.execute(`SELECT * FROM funcionarios`)
        return rows
    },
    deletar: async (id) => {
        const [result] = await pool.execute('DELETE FROM funcionarios WHERE id = ?', [id])
        return result.affectedRows
    },
    criar: async (dados) => {
        const query = `
        INSERT INTO funcionarios (nome, cpf, telefone, datanascimento, email)
        VALUES (?, ?, ?, ?, ?)
        `;
        const values = [dados.nome, dados.cpf, dados.telefone, dados.datanascimento, dados.email];
        const [result] = await pool.execute(query, values);
        return result.insertId;
    },
    atualizar: async (id, dados) => {
        const query = `
        UPDATE funcionarios 
        SET nome = ?, cpf = ?, telefone = ?, datanascimento = ?, email = ?
        WHERE id = ?
        `;
        const values = [...Object.values(dados), id];
        const [result] = await pool.execute(query, values);
        return result.affectedRows;
    }
}

module.exports = Funcionario