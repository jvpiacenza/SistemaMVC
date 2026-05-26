const pool = require("../config/db")

const Aluguel = {
    listarTodos: async () => {
        // Usei um JOIN simples para trazer os nomes em vez de apenas IDs (opcional, mas recomendado)
        const query = ("SELECT * FROM aluguel")
        const [rows] = await pool.execute(query)
        return rows
    },
    deletar: async (id) => {
        const [result] = await pool.execute('DELETE FROM aluguel WHERE id = ?', [id])
        return result.affectedRows
    },
    criar: async (dados) => {
        const query = `
        INSERT INTO aluguel (funcionario_al, cliente_al, automovel_al, data_aluguel, data_devolver)
        VALUES (?, ?, ?, ?, ?)
        `;
        const values = [
            dados.funcionario_al, 
            dados.cliente_al, 
            dados.automovel_al, 
            dados.data_aluguel, 
            dados.data_devolver
        ];
        const [result] = await pool.execute(query, values);
        return result.insertId;
    },
    atualizar: async (id, dados) => {
        const query = `
        UPDATE aluguel 
        SET funcionario_al = ?, cliente_al = ?, automovel_al = ?, data_aluguel = ?, data_devolver = ?
        WHERE id = ?
        `;
        const values = [
            dados.funcionario_al, 
            dados.cliente_al, 
            dados.automovel_al, 
            dados.data_aluguel, 
            dados.data_devolver, 
            id
        ];
        const [result] = await pool.execute(query, values);
        return result.affectedRows;
    }
}

module.exports = Aluguel