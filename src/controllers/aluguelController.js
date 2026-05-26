const Aluguel = require('../models/aluguelModel')

const aluguelController = {
    ver: async (req, res) => {
        try {
            const alugueis = await Aluguel.listarTodos()
            res.json(alugueis)
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao listar aluguéis' })
        }
    },
    deletar: async (req, res) => {
        const { id } = req.params
        try {
            const affectedRows = await Aluguel.deletar(id)
            if (affectedRows === 0) {
                return res.status(404).json({ message: "Registro de aluguel não encontrado" })
            }
            res.status(204).send()
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao deletar aluguel' })
        }
    },
    criar: async (req, res) => {
        try {
            const insertId = await Aluguel.criar(req.body);
            res.status(201).json({ id: insertId, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    atualizar: async (req, res) => {
        const { id } = req.params;
        try {
            const affectedRows = await Aluguel.atualizar(id, req.body);
            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Aluguel não encontrado' });
            }
            res.json({ id, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = aluguelController