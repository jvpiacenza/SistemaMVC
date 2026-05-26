const Funcionario = require('../models/funcionariosModel')

const funcionariosController = {
    ver: async (req, res) => {
        try {
            const funcionarios = await Funcionario.listarTodos()
            res.json(funcionarios)
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao listar funcionários' })
        }
    },
    deletar: async (req, res) => {
        const { id } = req.params
        try {
            const affectedRows = await Funcionario.deletar(id)
            if (affectedRows === 0) {
                return res.status(404).json({ message: "Funcionário não encontrado" })
            }
            res.status(204).send()
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: 'Erro ao deletar funcionário' })
        }
    },
    criar: async (req, res) => {
        try {
            const insertId = await Funcionario.criar(req.body);
            res.status(201).json({ id: insertId, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    atualizar: async (req, res) => {
        const { id } = req.params;
        try {
            const affectedRows = await Funcionario.atualizar(id, req.body);
            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Funcionário não encontrado' });
            }
            res.json({ id, ...req.body });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = funcionariosController