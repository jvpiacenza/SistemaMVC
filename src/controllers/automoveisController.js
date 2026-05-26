const Automovel = require('../models/automoveisModel')

const automoveisController = {
    ver: async (req, res) => {
        try {
            const automoveis = await Automovel.listarTodos()
            res.json(automoveis)
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao listar automóveis' })
        }
    },
    deletar: async (req, res) => {
        const { id } = req.params
        try {
            const affectedRows = await Automovel.deletar(id)
            if (affectedRows === 0) {
                return res.status(404).json({ message: "Automóvel não encontrado" })
            }
            res.status(204).send()
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao deletar automóvel' })
        }
    },
    criar: async (req, res) => {
        try {
            const insertId = await Automovel.criar(req.body);
            res.status(201).json({ id: insertId, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    atualizar: async (req, res) => {
        const { id } = req.params;
        try {
            const affectedRows = await Automovel.atualizar(id, req.body);
            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Automóvel não encontrado' });
            }
            res.json({ id, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = automoveisController