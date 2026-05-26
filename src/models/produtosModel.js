const pool = require("../config/db")

const Produto = {
    listarTodos:async () => {
            const [rows] = await pool.execute(`SELECT * FROM produtos`)
            return rows
},
deletar: async (id) => {
    const [rows] = await pool.execute('DELETE FROM produtos WHERE id = ?', [id])
    return rows.affectedRows
},
}
module.exports = Produto