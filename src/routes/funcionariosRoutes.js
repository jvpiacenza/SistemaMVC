const express = require('express');
const router = express.Router();
const funcionariosController = require('../controllers/funcionariosController');

router.get('/funcionarios', funcionariosController.ver);
router.delete('/funcionarios/:id', funcionariosController.deletar);
router.post('/funcionarios', funcionariosController.criar);
router.put('/funcionarios/:id', funcionariosController.atualizar);

module.exports = router;