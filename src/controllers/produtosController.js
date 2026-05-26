const Produto = require('../models/produtosModel')

const produtosController = {
    index: async (req, res) => {
        try {
            const produto = await Produto.listarTodos()
            res.json(produto)
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao listar produtos' })
        }
    },
    deletar: async (req, res) => {
        const { id } = req.params
        try {
            const affectedRows = await Produto.deletar(id)
            if (affectedRows === 0) {
                return res.status(404).json({ message: "Registro não encontrado" })
            }
            res.status(204).send()
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao deletar' })
        }
    },
    update: async (req, res) => {
        const { id } = req.params;
        try {
            const affectedRows = await Pessoa.atualizar(id, req.body);
            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Registro não encontrado' });
            }
            res.json({ id, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

}

module.exports = produtosController